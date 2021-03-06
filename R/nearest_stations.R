#' Find Nearest GSOD Stations to Specified Latitude and Longitude
#'
#'Given a latitude and longitude value entered as decimal degrees (DD),
#'this function returns a list of STNID values, which can be used in
#'\code{\link{get_GSOD}} to query for specific stations as an argument in the
#'\code{station} parameter of that function.
#'
#' @param LAT Latitude expressed as decimal degrees (DD) [WGS84]
#' @param LON Longitude expressed as decimal degrees (DD) [WGS84]
#' @param distance Distance in kilometres from point for which stations are to
#' be returned.
#'
#' @note The GSOD data, which are downloaded and manipulated by this R package,
#' stipulate that the following notice should be given.  \dQuote{The following
#' data and products may have conditions placed on their international
#' commercial use.  They can be used within the U.S. or for non-commercial
#' international activities without restriction.  The non-U.S. data cannot be
#' redistributed for commercial purposes.  Re-distribution of these data by
#' others must provide this same notification.}
#'
#' @examples
#' \dontrun{
#' # Find stations within a 100km radius of Toowoomba, QLD, AUS
#'
#' n <- nearest_stations(LAT = -27.5598, LON = 151.9507, distance = 100)
#'}
#' @return \code{\link[base]{vector}} object of station identification numbers
#' @author Adam H Sparks, \email{adamhsparks@gmail.com}
#' @export
nearest_stations <- function(LAT, LON, distance) {
  original_timeout <- options("timeout")[[1]]
  options(timeout = 300)
  on.exit(options(timeout = original_timeout), add = TRUE)
  stations <- as.data.frame(get_station_list())
  dists <- fields::rdist.earth(as.matrix(stations[c("LAT", "LON")]),
                               matrix(c(LAT, LON), ncol = 2), miles = FALSE)
  nearby <- which(dists[, 1] < distance)
  return(stations[as.numeric(nearby), ]$STNID)
}
