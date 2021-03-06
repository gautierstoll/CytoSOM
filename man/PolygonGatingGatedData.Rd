% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PolygonGatingGatedData.R
\name{PolygonGatingGatedData}
\alias{PolygonGatingGatedData}
\title{Apply a list of gates made of polygon (from function Interactive2DGating) to RawData}
\usage{
PolygonGatingGatedData(GatedData, Polygons, gatingName = "")
}
\arguments{
\item{GatedData}{data from CytoSOM::PolygonGatingGatedData}

\item{Polygons}{list of polygons contructed within Interactive2DGating}

\item{gatingName}{Name of gating}
}
\value{
FlowSOM data object that includes the polygons gating and the name of the population of interest.
}
\description{
Apply a list of gates made of polygon (from function Interactive2DGating) to RawData
}
