#' Aggregate Track Position
#'
#' A dataset containing aggregate metrics of all tracks having reached Spotify's top 200 tracks (U.S.) between January 1, 2017 and December 4, 2019.
#'
#' @format A data frame with 4,503 rows and 6 variables:
#' \describe{
#'   \item{Track}{track name}
#'   \item{Artist}{artist name}
#'   \item{Avg_Position}{average track position in the top 200 when the song was listed as a top 200 hit}
#'   \item{Avg_Streams}{average daily number of streams}
#'   \item{Max_Streams}{maximum daily number of streams}
#'   \item{Days_Trending}{number of days the song was in the top 200}
#'   ...
#' }
#' @source \url{https://spotifycharts.com/}
"track_position_aggregate"
