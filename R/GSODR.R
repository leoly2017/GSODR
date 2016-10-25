#' GSODR: Global Surface Summary Daily Weather Data in R.
#'
#'The GSODR package is an R package that provides a function that
#'automates downloading and cleaning data from the "Global Surface
#'Summary of the Day (GSOD)" weather station data provided by the US National
#'Climatic Data Center (NCDC). Station files are individually checked for number
#'of missing days to assure data quality, stations with too many missing
#'observations are omitted. All units are converted to International System of
#'Units (SI), e.g., inches to millimetres and Fahrenheit to Celsius. Output is
#'saved as a Comma Separated Value (CSV) file or in a spatial GeoPackage
#'(GPKG) file, implemented by most major GIS software, summarising each
#'year by station, which also includes vapour pressure and relative
#'humidity variables calculated from existing data in GSOD.
#'
#' @section GSODR functions:
#' \code{\link{get_GSOD}}
#'
#' \code{\link{nearest_stations}}
#'
#' @section References:
#' \url{https://data.noaa.gov/dataset/global-surface-summary-of-the-day-gsod}
#' @docType package
#' @name GSODR
NULL