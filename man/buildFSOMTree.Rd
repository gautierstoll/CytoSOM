% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildFSOMTree.R
\name{buildFSOMTree}
\alias{buildFSOMTree}
\title{Build and plot FlowSOM tree}
\usage{
buildFSOMTree(fSOMDloaded, prettyNames, clustDim, metaClNb, fSOMSeed)
}
\arguments{
\item{fSOMDloaded}{FlowSOM data dowloaded with DowLoadCytoData}

\item{prettyNames}{list of markers names to include to build the tree}

\item{clustDim}{dimension of the 2D cluster grid}

\item{metaClNb}{number of metaclusters}

\item{fSOMSeed}{seed of the random generator used for building the tree}
}
\value{
FlowSOM object that includes the correspondance between the clusters and the metaclusters and the name of the population of interest.
}
\description{
BuildFSOMTree is a function that plot a tree based on the FlowSOM clusterization and metaclusterization algorithm. From data of interest contained in the DownLoadCytoData object, buildFSOMTree applies FlowSOM algorithm to cluster and metacluster data thanks to the markers of interest.
}
\examples{
CytoTree=buildFSOMTree(fSOMloaded=CytoData,prettyNames=c("CD4","CD8","FoxP3"),ClustDim=4,metaClNb=6,fSOMSeed=1)
}
