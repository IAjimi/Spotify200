
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Spotify200

<!-- badges: start -->

<!-- badges: end -->

Spotify200 is a data package centered on songs which reached Spotify’s
Top 200 Most Streamed songs in the U.S. between January 2017 and
December 2019.

## Installation

You can install the released version of Spotify200 with:

``` r
devtools::install_github("IAjimi/Spotify200", build_vignettes = TRUE)
```

## Datasets

The following displays the first rows of all datasets included in this
package:

``` r
library(Spotify200)
head(chart_position)
#>   Position                               Track           Artist Streams
#> 1        1 Bad and Boujee (feat. Lil Uzi Vert)            Migos 1371493
#> 2        2                           Fake Love            Drake 1180074
#> 3        3                             Starboy       The Weeknd 1064351
#> 4        4                              Closer The Chainsmokers 1010492
#> 5        5                       Black Beatles     Rae Sremmurd  874289
#> 6        6         Broccoli (feat. Lil Yachty)             DRAM  763259
#>                                                     URL       Date
#> 1 https://open.spotify.com/track/4Km5HrUvYTaSUfiSGPJeQR 2017-01-01
#> 2 https://open.spotify.com/track/343YBumqHu19cGoGARUTsd 2017-01-01
#> 3 https://open.spotify.com/track/5aAx2yezTd8zXrkmtKl66Z 2017-01-01
#> 4 https://open.spotify.com/track/7BKLCZ1jbUBVqRi2FVlTVw 2017-01-01
#> 5 https://open.spotify.com/track/6fujklziTHa8uoM5OQSfIo 2017-01-01
#> 6 https://open.spotify.com/track/7yyRTcZmCiyzzJlNzGC9Ol 2017-01-01
#>                 track_ID
#> 1 4Km5HrUvYTaSUfiSGPJeQR
#> 2 343YBumqHu19cGoGARUTsd
#> 3 5aAx2yezTd8zXrkmtKl66Z
#> 4 7BKLCZ1jbUBVqRi2FVlTVw
#> 5 6fujklziTHa8uoM5OQSfIo
#> 6 7yyRTcZmCiyzzJlNzGC9Ol
head(track_information)
#>                                 Track           Artist
#> 1 Bad and Boujee (feat. Lil Uzi Vert)            Migos
#> 2                           Fake Love            Drake
#> 3                             Starboy       The Weeknd
#> 4                              Closer The Chainsmokers
#> 5                       Black Beatles     Rae Sremmurd
#> 6         Broccoli (feat. Lil Yachty)             DRAM
#>                 track_ID              artist_ID album_type popularity
#> 1 4Km5HrUvYTaSUfiSGPJeQR 6oMuImdp5ZcFhWP0ESe6mG      album         77
#> 2 343YBumqHu19cGoGARUTsd 3TVXtAsR1Inumwj472S9r4      album         77
#> 3 5aAx2yezTd8zXrkmtKl66Z 1Xyo4u8uXC1ZmMpatF05PJ      album         17
#> 4 7BKLCZ1jbUBVqRi2FVlTVw 69GGBxA162lTqCwzJG5jLp     single         86
#> 5 6fujklziTHa8uoM5OQSfIo 7iZtZyCzp3LItcw1wtPI3D      album         77
#> 6 7yyRTcZmCiyzzJlNzGC9Ol 5M0lbkGluOPXLeFjApw8r8      album         71
#>   track_number explicit album_release_date number_artists
#> 1            4     TRUE         2017-01-27              2
#> 2           20     TRUE         2017-03-18              1
#> 3            1     TRUE         2016-11-25              2
#> 4            1    FALSE         2016-07-29              2
#> 5            5     TRUE         2016-08-12              2
#> 6            7     TRUE         2016-10-21              2
#>   available_markets_number
#> 1                       68
#> 2                       79
#> 3                        0
#> 4                       79
#> 5                       79
#> 6                       68
#>                                                                                                                                                                                                                                                                                                                                                                                      available_markets_all
#> 1                                                        AD - AR - AT - AU - BE - BG - BO - BR - CA - CH - CL - CO - CR - CY - CZ - DE - DK - DO - DZ - EC - EE - ES - FI - GB - GR - GT - HK - HN - HU - ID - IE - IL - IS - IT - JP - KW - LI - LT - LU - LV - MA - MC - MT - MX - MY - NI - NL - NO - NZ - PA - PE - PH - PL - PS - PT - PY - RO - SE - SG - SK - SV - TH - TR - TW - US - UY - VN - ZA
#> 2 AD - AE - AR - AT - AU - BE - BG - BH - BO - BR - CA - CH - CL - CO - CR - CY - CZ - DE - DK - DO - DZ - EC - EE - EG - ES - FI - FR - GB - GR - GT - HK - HN - HU - ID - IE - IL - IN - IS - IT - JO - JP - KW - LB - LI - LT - LU - LV - MA - MC - MT - MX - MY - NI - NL - NO - NZ - OM - PA - PE - PH - PL - PS - PT - PY - QA - RO - SA - SE - SG - SK - SV - TH - TN - TR - TW - US - UY - VN - ZA
#> 3                                                                                                                                                                                                                                                                                                                                                                                                         
#> 4 AD - AE - AR - AT - AU - BE - BG - BH - BO - BR - CA - CH - CL - CO - CR - CY - CZ - DE - DK - DO - DZ - EC - EE - EG - ES - FI - FR - GB - GR - GT - HK - HN - HU - ID - IE - IL - IN - IS - IT - JO - JP - KW - LB - LI - LT - LU - LV - MA - MC - MT - MX - MY - NI - NL - NO - NZ - OM - PA - PE - PH - PL - PS - PT - PY - QA - RO - SA - SE - SG - SK - SV - TH - TN - TR - TW - US - UY - VN - ZA
#> 5 AD - AE - AR - AT - AU - BE - BG - BH - BO - BR - CA - CH - CL - CO - CR - CY - CZ - DE - DK - DO - DZ - EC - EE - EG - ES - FI - FR - GB - GR - GT - HK - HN - HU - ID - IE - IL - IN - IS - IT - JO - JP - KW - LB - LI - LT - LU - LV - MA - MC - MT - MX - MY - NI - NL - NO - NZ - OM - PA - PE - PH - PL - PS - PT - PY - QA - RO - SA - SE - SG - SK - SV - TH - TN - TR - TW - US - UY - VN - ZA
#> 6                                                        AD - AR - AT - AU - BE - BG - BO - BR - CA - CH - CL - CO - CR - CY - CZ - DE - DK - DO - DZ - EC - EE - ES - FI - FR - GB - GR - GT - HK - HN - HU - ID - IE - IL - IS - IT - JP - KW - LI - LT - LU - LV - MA - MC - MT - MX - MY - NI - NL - NO - NZ - PA - PE - PH - PL - PS - PT - PY - RO - SE - SG - SK - SV - TH - TR - TW - UY - VN - ZA
#>   disc_number danceability energy key loudness mode speechiness
#> 1           1        0.927  0.665  11   -5.313    1      0.2440
#> 2           1        0.928  0.481   9   -9.350    0      0.2870
#> 3           1        0.681  0.594   7   -7.028    1      0.2820
#> 4           1        0.748  0.524   8   -5.599    1      0.0338
#> 5           1        0.794  0.632   0   -6.163    1      0.0649
#> 6           1        0.886  0.525   8   -7.390    1      0.1310
#>   acousticness instrumentalness liveness valence   tempo
#> 1        0.061         0.00e+00    0.123   0.175 127.076
#> 2        0.105         0.00e+00    0.176   0.613 134.007
#> 3        0.165         3.49e-06    0.134   0.535 186.054
#> 4        0.414         0.00e+00    0.111   0.661  95.010
#> 5        0.142         0.00e+00    0.128   0.355 145.926
#> 6        0.236         0.00e+00    0.057   0.708 145.990
#>                       id duration_ms time_signature    score       bnm
#> 1 4Km5HrUvYTaSUfiSGPJeQR      343150              4 7.020000 0.1000000
#> 2 343YBumqHu19cGoGARUTsd      210937              4 7.616667 0.1666667
#> 3 5aAx2yezTd8zXrkmtKl66Z      230453              4 7.450000 0.2500000
#> 4 7BKLCZ1jbUBVqRi2FVlTVw      244960              4 3.600000 0.0000000
#> 5 6fujklziTHa8uoM5OQSfIo      291893              4 7.833333 0.0000000
#> 6 7yyRTcZmCiyzzJlNzGC9Ol      225205              4 6.722222 0.0000000
#>   n_albums_review
#> 1              10
#> 2              12
#> 3               8
#> 4               3
#> 5               3
#> 6               9
head(track_position_aggregate)
#>                     Track           Artist Avg_Position Avg_Streams
#> 1        'Till I Collapse           Eminem    175.72510    182796.3
#> 2                       !     Trippie Redd     87.71429    375109.7
#> 3       "42" - From SR3MM     Rae Sremmurd    130.00000    297731.0
#> 4     #PROUDCATOWNERREMIX     XXXTENTACION    100.75000    308372.2
#> 5      $$$ - with Matt Ox     XXXTENTACION    116.69697    317803.7
#> 6 (Don't Fear) The Reaper Blue Öyster Cult    100.00000    345843.2
#>   Max_Streams Days_Trending
#> 1      286215           251
#> 2      808145             7
#> 3      297731             1
#> 4      361205             4
#> 5      725018            33
#> 6      434252             4
head(pitchfork_reviews)
#>            artist score                                        album bnm
#> 1 Various Artists   5.9                Control the Streets, Volume 2   0
#> 2         Takeoff   7.7                              The Last Rocket   0
#> 3           Quavo   5.9                                 QUAVO HUNCHO   0
#> 4           Migos   6.4                                   Culture II   0
#> 5 Various Artists   7.9 Quality Control: Control the Streets, Vol. 1   0
#> 6           Migos   8.1                                      Culture   1
#>     pub_date
#> 1 2019-08-21
#> 2 2018-11-07
#> 3 2018-10-18
#> 4 2018-01-30
#> 5 2017-12-12
#> 6 2017-01-31
```

More information about the datasets can be found in the package’s
vignettes.

## Data Collection

The data collection for this package was done in three steps:

1.  Information was downloaded from the Spotify Charts website about the
    200 most streamed songs in the U.S. The information is available as
    `.csv` files available for download from the site: the download link
    varies predictably with the date the information was collected on,
    so all files can easily be retrieved with a for loop.
2.  The Spotify API was used to retrieve artist and track specific
    information for all tracks found in 1. There is a Spotify API in R,
    but it doesn’t work properly when user authorization is required.
    The user authorization flow isn’t actually required for this
    package, but I still used my own API wrapper functions (customized
    to retrieve the information I was interested in).
3.  Review information for the artists in 1) was web-scraped from
    Pitchfork.

The code can easily be extended to collect the most recent information
from Spotify Charts: since the code for steps 2) and 3) is written to
find information relevant to 1), the data collection in those steps
automatically extends to collect this new, additional information.

Generally, the code is highly dependent on web-scraping, the Spotify
API, and specific URLs, so a change in any of the three would require a
corresponding rewrite.
