#' Spotify Charts Position
#'
#' A dataset containing the daily chart position of all tracks having reached Spotify's top 200 tracks (U.S.) between January 1, 2017 and December 4, 2019.
#'
#' @format A data frame with 212,600 rows and 7 variables:
#' \describe{
#'   \item{Position}{track position in the top 200}
#'   \item{Track}{track name}
#'   \item{Artist}{artist name}
#'   \item{Streams}{daily number of streams}
#'   \item{URL}{Spotify URL}
#'   \item{Date}{Date}
#'   \item{track_ID}{Spotify Track ID}
#'   ...
#' }
#' @source \url{https://spotifycharts.com/}
"chart_position"
