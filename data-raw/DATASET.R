## Library
library("httr")
library("dplyr")
library("readr")
library("magrittr")
library("stringr")
library("purrr")

### Retrieving Spotify Charts ####
## Creating List of Dates for Which to Retrieve Data
### Note: can only go as far back as 2017-01-01
calendar <- seq(as.Date("2017-01-01"), Sys.Date() - 1, by="days")

## Output List, same length as calendar
results <- rep(list(NA), length(calendar))

## Loop: Retrieve Spotify Charts for every day in calendar
for (i in c(1:length(calendar))){

  date <- calendar[i]
  url <- paste("https://spotifycharts.com/regional/us/daily/", date, "/download", sep = "")
  dest_file <- paste("spotifycharts", date, sep = "_")

  tryCatch({

    download.file(url, dest_file) #downloads file from url
    temp_db <- readr::read_csv(dest_file, skip = 1) #saves db temporarily
    temp_db <- mutate(temp_db, Date = date)
    results[[i]] <- temp_db #saves dataframe in results
    unlink(dest_file, ".csv") #deletes file from computer
  }, error=function(e){})


}

raw_results <- do.call(rbind.data.frame, results) #rbinds all dataframes together

## Cleaning Chart Results
chart_position <- raw_results %>%
  as.data.frame() %>%
  dplyr::filter(!is.na(Position)) %>% #ignores failed downloads
  dplyr::rename(Track = `Track Name`) %>%
  mutate(track_ID = str_replace(URL, "https://open.spotify.com/track/", ""), #change URL into spotify track ID
         Date = as.Date(Date)) #saves Dates as Dates


## Creating List of Unique Tracks
track_information <- chart_position %>% distinct(Track, Artist, track_ID)

## Creating Track Statistics
track_position_aggregate <- chart_position %>%
  group_by(Track, Artist) %>%
  summarise(Avg_Position = mean(Position),
            Avg_Streams = mean(Streams),
            Max_Streams = max(Streams),
            Days_Trending = n())

## Spotify DIY API ####
## Get Spotify Token (initial token)
endpoint <- oauth_endpoint(authorize = 'https://accounts.spotify.com/authorize',
                           access = 'https://accounts.spotify.com/api/token')

app <- oauth_app('r',
                 Sys.getenv("SPOTIFY_CLIENT_ID"),
                 Sys.getenv("SPOTIFY_CLIENT_SECRET"),
                 redirect_uri = "http://localhost:1410/")

auth.code <- oauth2.0_token(endpoint = endpoint, app = app, scope = c("user-read-recently-played", "user-top-read")) #request user auth
1 #response to auth code prompt

token <- auth.code$credentials$access_token
auth_header <- httr::add_headers('Authorization'= paste('Bearer', token))

## Custom API Wrapper
retrieve_Spotify <- function(type, urls){

  # Create Output
  output <- rep(list(NA), length(urls))

  # For every target URL
  for (i in c(1:length(urls)) ) {

    # Make call
    parameter_response <- httr::GET(urls[i], auth_header)

    # IF Rate Limited
    if (parameter_response$status_code == 429){

      # Get Exact Message
      http_status(parameter_response)

      # Sleep for a bit
      Sys.sleep(20)

      #Repeat Call
      parameter_response <- httr::GET(urls[i], auth_header)
    }

    # IF Expired Token
    if (parameter_response$status_code == 401){

      #Send Token Request
      request_body_refresh <- list(grant_type = 'refresh_token',
                                   refresh_token = auth.code$credentials$refresh_token,
                                   redirect_uri = "http://localhost:1410/",
                                   client_id = Sys.getenv("SPOTIFY_CLIENT_ID"),
                                   client_secret = Sys.getenv("SPOTIFY_CLIENT_SECRET"))

      user_token_refresh <- httr::POST('https://accounts.spotify.com/api/token', body = request_body_refresh, encode='form')

      if (user_token_refresh$status_code == 200){  #verify status

        token <- content(user_token_refresh)$access_token
        auth_header <- httr::add_headers('Authorization'= paste('Bearer', token))

      } else{

        http_error(user_token_refresh)

      }

      #Repeat Call
      parameter_response <- httr::GET(urls[i], auth_header)
    }


    # IF Status == Good
    if (parameter_response$status_code == 200){

      response <- content(parameter_response) #get results

      temp <- list() #create temporary output

      # Save Response Contents depending on type
      if (type == "track_info"){

        temp$track_ID <- response$id
        temp$artist_ID <- response$artists[[1]]$id #artist id
        temp$album_name <- response$album$name
        temp$album_type <- response$album$album_type
        temp$popularity <- response$popularity
        temp$track_number <- response$track_number
        temp$explicit <- response$explicit
        temp$album_release_date <- response$album$release_date
        temp$number_artists <- response$artists %>% length()
        temp$available_markets_number <- response$available_markets %>% length() #number available markets
        temp$available_markets_all <- response$available_markets %>% paste(collapse = " - ") #all available markets
        temp$disc_number <- response$disc_number #all available markets

      }

      if (type == "artist_info"){

        temp$Artist <- response$name
        temp$artist_ID <- response$id
        temp$artist_popularity <- response$popularity
        temp$followers <- response$followers$total
        temp$genres <- response$genres %>% purrr::map(1) %>% paste(collapse = " - ")  #paste includes "NULL" responses

      }

      if (type == "track_features"){

        temp <- response

      }

      output[[i]] <- temp


    } else{

      # Still Save Output
      output <- do.call(rbind.data.frame, output) %>% as.data.frame()
      nam <- paste("output", type, sep = "_")
      rownames(output) <- c()
      assign(nam, output, envir = globalenv())

      # Tell Us What Happened
      return(http_status(parameter_response))
    }

  }

  # Saving Output as Dataframe
  output <- do.call(rbind.data.frame, output) %>% as.data.frame()
  nam <- paste("output", type, sep = "_")
  rownames(output) <- c()
  assign(nam, output, envir = globalenv())

}


## Track Information
# Creating Relevant URLS
track_info_urls <- paste("https://api.spotify.com/v1/tracks/", track_information$track_ID, sep = "")

# Using Function to Retrieve Information
retrieve_Spotify(type = "track_info", urls = track_info_urls)

# Preview Results
output_track_info %>% head()

#Adding to track_information
track_information <- dplyr::left_join(track_information, output_track_info)

## Audio Features
# Creating Relevant URLS
track_features_urls <- paste("https://api.spotify.com/v1/audio-features/", track_information$track_ID, sep = "")

# Using Function to Retrieve Information
retrieve_Spotify(type = "track_features", urls = track_features_urls)

# Preview Results
output_track_features %>% head()

# Quick Cleaning of DB
output_track_features <- output_track_features %>%
  as.data.frame() %>%
  select(-uri, -track_href, - analysis_url, -type) %>%
  dplyr::mutate(track_ID = id) %>%
  dplyr::filter(!is.na(track_ID))

#Adding to track_information
track_information <- dplyr::left_join(track_information, output_track_features)

## Artist Info
# Creating Relevant URLS
artist_info_urls <- paste("https://api.spotify.com/v1/artists/", track_information$artist_ID, sep = "")

# Using Function to Retrieve Information
retrieve_Spotify(type = "artist_info", urls = artist_info_urls)

# Preview Results
output_artist_info %>% head()

#Adding to track_information
track_information <- dplyr::left_join(track_information, output_artist_info)


## Collecting Relevant Information from Pitchfork ####
unique_artist <- unique(track_information$Artist)
search_artist <- stringr::str_to_lower(unique_artist)
search_artist <- str_replace_all(search_artist, " ", "%20")

artist_decoder <- data.frame("artist_name" = unique_artist, "search_artist" = search_artist)

pitchfork_reviews <- data.frame("artist" = rep(NA, 10000),
                                "search_artist" = rep(NA, 10000),
                                "score" = rep(NA, 10000),
                                "album" = rep(NA, 10000),
                                "bnm" = rep(NA, 10000),
                                "pub_date" = rep(NA, 10000))

n <- 1

for (i in c(1:length(unique_artist))){

  ## 1. LOOK UP ARTIST NAME
  url <- paste("https://pitchfork.com/search/?query=", search_artist[i], sep = "")

  tryCatch({

    wiki_resp <- xml2::read_html(url)
    links <- rvest::html_nodes(wiki_resp, ".review__link") %>% rvest::html_attr("href") #all links

  }, error=function(e){
    links <- c()
  })


  if (length(links) > 0){
    for (j in c(1:length(links))){

      ## 2. GET INFO FOR LINK LIST
      new_url <- paste("https://pitchfork.com", links[j], sep = "")
      album_resp <- xml2::read_html(new_url)

      pitchfork_reviews$search_artist[n] <- search_artist[i] #artist this was linked to
      pitchfork_reviews$artist[n] <- rvest::html_text(rvest::html_nodes(album_resp, ".artist-links"))[[1]] #artist name
      pitchfork_reviews$score[n] <- rvest::html_text(rvest::html_nodes(album_resp, ".score"))[[1]] #score
      pitchfork_reviews$album[n] <- rvest::html_text(rvest::html_nodes(album_resp, ".single-album-tombstone__review-title"))[[1]] #album name
      pitchfork_reviews$pub_date[n] <- as.character(as.Date(rvest::html_text(rvest::html_nodes(album_resp, ".pub-date")), "%B %d %Y"))[[1]] #publication date

      if (length(rvest::html_nodes(album_resp, ".bnm-txt")) != 0){
        pitchfork_reviews$bnm[n] <- 1
      }  else{
        pitchfork_reviews$bnm[n] <- 0
      }

      # Update Counter
      n <- n + 1

      # Sleep for a bit
      Sys.sleep(5)
    }

  }

}


pitchfork_reviews <- dplyr::filter(pitchfork_reviews, !is.na(artist))

# Adding Pitchfork Information to Dataset
pitchfork_agg <- left_join(pitchfork_reviews, artist_decoder)
pitchfork_reviews <- select(pitchfork_reviews, -search_artist)

## Get Summary Variables (by Artist)
pitchfork_agg <- pitchfork_agg %>%
  group_by(Artist = artist_name) %>%
  summarize(score = mean(as.numeric(score), na.rm = TRUE),
            bnm = mean(bnm, na.rm = TRUE),
            n_albums_review = n())

track_information <- left_join(track_information, pitchfork_agg)

track_information <- distinct(track_information)

## Saving results ####
usethis::use_data(chart_position, overwrite = TRUE)
usethis::use_data(track_information, overwrite = TRUE)
usethis::use_data(track_position_aggregate, overwrite = TRUE)
usethis::use_data(pitchfork_reviews, overwrite = TRUE)
