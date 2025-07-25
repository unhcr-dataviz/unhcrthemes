% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/palettes.R
\name{unhcr_pal}
\alias{unhcr_pal}
\title{UNHCR color palettes}
\usage{
unhcr_pal(n = NULL, name, ...)
}
\arguments{
\item{n}{Number of different colors in the palette, minimum depending on palette (2),
maximum depending on palette (5, 7 or 10)}

\item{name}{A palette name}

\item{...}{Additional arguments for \link[grDevices:colorRamp]{grDevices::colorRampPalette}}
}
\value{
A character vector, the palette hex color codes.
}
\description{
Creates a color palette from UNHCR branding
}
\examples{
unhcr_pal(3, "pal_unhcr")
unhcr_pal(3, "pal_blue")
unhcr_pal(5, "pal_yellow")
unhcr_pal(12, "pal_red")
}
