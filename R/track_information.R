#' Track Information
#'
#' A dataset of 5387 observations and 27 variables containing information relating to every track having reached Spotify's top 200 tracks (U.S.) between January 1, 2017 and December 4, 2019.
#' Includes information retrieved from Spotify relating to the song's audio features.
#'
#' @format A data frame with 150 rows and 5 variables:
#' \describe{
#'   \item{Track}{track name}
#'   \item{Artist}{artist's name}
#'   \item{track_ID}{Spotify Track ID}
#'   \item{artist_ID}{Spotify Artist ID}
#'   \item{album_release_date}{album release date}
#'   \item{album_type}{album type, e.g., album, single, compilation, etc}
#'   \item{popularity}{track popularity, computed by Spotify, ranging from 0 to 100}
#'   \item{track_number}{track listing in the album}
#'   \item{disc_number}{disc number}
#'   \item{explicit}{dummy, TRUE if the track is explicity, FALSE otherwise}
#'   \item{number_artists}{number of artists featured on the track}
#'   \item{available_markets_number}{number of "markets" (countries) the track is available in}
#'   \item{available_markets_all}{names of all the "markets" the track is available in}
#'   \item{danceability}{audio feature computed by Spotify, described as: "how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity", ranging from 0 to 1}
#'   \item{energy}{audio feature computed by Spotify, described as: "a measure from 0.0 to 1.0 ... of intensity and activity."}
#'   \item{key}{audio feature computed by Spotify: "	The estimated overall key of the track. Integers map to pitches using standard Pitch Class notation ."}
#'   \item{loudness}{audio feature computed by Spotify, "the overall loudness of a track in decibels (dB)", "values typically range between -60 and 0 db." }
#'   \item{mode}{audio feature computed by Spotify, described as: "the type of scale from which its melodic content is derived. Major is represented by 1 and minor is 0."}
#'   \item{speechiness}{audio feature computed by Spotify, "detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audio book, poetry), the closer to 1.0 the attribute value"}
#'   \item{acousticness}{audio feature computed by Spotify, described as: "A confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic."}
#'   \item{instrumentalness}{audio feature computed by Spotify, described as: "Predicts whether a track contains no vocals... The closer the instrumentalness value is to 1.0, the greater likelihood the track contains no vocal content."}
#'   \item{liveness}{audio feature computed by Spotify, "Detects the presence of an audience in the recording... A value above 0.8 provides strong likelihood that the track is live."}
#'   \item{valence}{audio feature computed by Spotify, described as: "A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track."}
#'   \item{tempo}{audio feature computed by Spotify, described as: "the overall estimated tempo of a track in beats per minute (BPM)"}
#'   \item{id}{Spotify Track ID}
#'   \item{duration_ms}{audio feature computed by Spotify, the length of the track in millisecond}
#'   \item{time_signature}{audio feature computed by Spotify: "An estimated overall time signature of a track. The time signature (meter) is a notational convention to specify how many beats are in each bar (or measure)."}
#'   \item{score}{the artist's average Pitchfork album score out of 10}
#'   \item{bnm}{the artist's average of Pitchfork's Best New Music/Reissue award, assigned as 1 if awarded, 0 otherwise}
#'   \item{n_albums_review}{number of albums of the artist that Pitchfork reviewed}
#'   ...
#' }
#' @source \url{https://developer.spotify.com/documentation/web-api/}
"track_information"
