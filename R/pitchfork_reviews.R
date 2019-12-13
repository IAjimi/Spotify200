#' Pitchfork Album Reviews
#'
#' A dataset containing the score given by Pitchfork to albums released by artists having reached Spotify's top 200 tracks (U.S.).
#'
#' @format A data frame with 979 rows and 5 variables:
#' \describe{
#'   \item{artist}{artist's name}
#'   \item{score}{score given by pitchfork, from a scale of 0 to 10}
#'   \item{album}{album name}
#'   \item{bnm}{dummy variable, 1 if the album received Best New Music or Best New Reissue, 0 otherwise}
#'   \item{pub_date}{review publication date}
#'   ...
#' }
#' @source \url{https://pitchfork.com/}
"pitchfork_reviews"
