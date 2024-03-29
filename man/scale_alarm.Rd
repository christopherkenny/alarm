% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scales.R
\name{scale_color_alarm}
\alias{scale_color_alarm}
\alias{scale_fill_alarm}
\alias{scale_colour_alarm}
\title{ALARM Project Scales for \code{ggplot2}}
\usage{
scale_color_alarm(palette = "alarm", which = NULL, ..., reverse = FALSE)

scale_fill_alarm(palette = "alarm", which = NULL, ..., reverse = FALSE)

scale_colour_alarm(palette = "alarm", which = NULL, ..., reverse = FALSE)
}
\arguments{
\item{palette}{palette from \code{names(alarm)} to use}

\item{which}{numeric indices of colors to use. \code{NULL} by default.}

\item{...}{arguments passed on to \code{ggplot2::discrete_scale()}}

\item{reverse}{Should the vector be reversed? Default is \code{FALSE}.}
}
\value{
A \link[ggplot2:ggplot2-ggproto]{ggplot2::Scale}
}
\description{
ALARM Project Scales for \code{ggplot2}
}
\examples{
ggplot2::mpg |>
  ggplot2::ggplot() +
   ggplot2::geom_point(ggplot2::aes(displ, hwy, colour = class)) +
   scale_color_alarm()

ggplot2::mpg |>
  ggplot2::ggplot() +
   ggplot2::geom_point(ggplot2::aes(displ, hwy, fill = class),
   pch = 23, color = 'transparent') +
   scale_fill_alarm()

}
