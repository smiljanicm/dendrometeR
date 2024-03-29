% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/daily_stats.R
\name{daily_stats}
\alias{daily_stats}
\title{Calculate daily statistics for dendrometer and environmental data}
\usage{
daily_stats(dm.data, sensor = 1, value = c("mean", "min",
            "max", "sum"), smooth.param = 1)
}
\arguments{
\item{dm.data}{a \code{data.frame} with a timestamp (\code{\%Y-\%m-\%d \%H:\%M:\%S} format) as row names, and dendrometer series in columns. Output as created using code from the \code{Import dendrometer data} vignette, or gap-filled dendrometer series as produced by \code{\link{fill_gaps}}. Environmental data can be specified as well, and should be formatted as dendrometer data.}

\item{sensor}{a \code{numeric} or \code{character} string specifying the sensor(s) to be used in the function. Defaults to 1 (first column of \code{data.frame}). If "ALL" is specified, a single \code{value} will be calculated or extracted for all series in the \code{data.frame}.}

\item{value}{a \code{character} string of \code{"mean"}, \code{"min"}, \code{"max"} or \code{"sum"}, specifying the daily statistic to be calculated or extracted. Optional argument for \code{sensor = "ALL"}, defaults to \code{"mean"}. Argument matching is performed.}

\item{smooth.param}{a \code{numeric} specifying the degree of smoothing. Defaults to 1 (no smoothing). In case smoothing is applied, series should be gap-free or gap-filled.}
}
\value{
The function returns:

\itemize{\item{for \code{sensor} is \code{numeric}, a \code{data.frame} containing the following columns:}}
\item{dmID}{dendrometer ID.}
\item{date}{timestamp in \code{\%Y-\%m-\%d} format.}
\item{DOY}{day of year.}
\item{min}{minimum daily stem size.}
\item{mean}{mean daily stem size.}
\item{max}{maximum daily stem size.}
\item{amplitude}{amplitude of daily stem-size changes (i.e. max - min).}
\item{time_min}{timestamp indicating the timing of the minimum.}
\item{time_max}{timestamp indicating the timing of the maximum.}

\itemize{\item{for \code{sensor} is \code{"ALL"}:}}

a \code{data.frame} with a timestamp (\code{\%Y-\%m-\%d}) as row names, and processed dendrometer or environmental data in columns (i.e. mean, minimum, maximum or sum).
}
\description{
The function calculates various daily statistics for dendrometer and environmental data. It either returns multiple statistics for individual sensors, or a single statistic for multiple sensors.
}
\details{
The function calculates various daily statistics for dendrometer and environmental data. For \code{sensor} is \code{numeric}, the function returns multiple statistics for a single sensor. For \code{sensor = "ALL"}, the function returns a single statistic (i.e. \code{"mean"}, \code{"min"}, \code{"max"} or \code{"sum"}) for all columns of the \code{data.frame}, whereby \code{"sum"} is particularly relevant for environmental parameters like precipitation.

The function includes a smoothing option (argument \code{smooth.param}) particularly for noisy datasets in which outliers may under- or overestimate minimum and maximum stem sizes within days. By default, no smoothing is performed. Smoothing requires gap-free series.
}
\examples{
data(dmCD)
dm.daily <- daily_stats(dmCD, sensor = 1)

data(dmED)
dm.daily <- daily_stats(dmED, sensor = "ALL", value = "max")

}
\author{
Olivier Bouriaud, Ernst van der Maaten and Marieke van der Maaten-Theunissen.
}
