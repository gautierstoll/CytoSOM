## User tool: Plot Meta clusters labels
#' Modified PlotLabels function of FlowSOM, with removal of smallest clusters
#' @param fSOMObject FlowSOM tree
#' @param metaClustFactors meta-clusters (numbers or names)
#' @param nbRm  number of smallest cluster to remove
#' @param equalSize true if clusters are represented with identical sizes
#' @export
#'
PlotLabelsRm <- function(fSOMObject,metaClustFactors,mainTitle,nbRm,equalSize=F)
{
     fSOM4Plot=list(
        map=fSOMObject$map,
        prettyColnames=fSOMObject$prettyColnames,
       MST=fSOMObject$MST)
    if (nbRm>0)
    {
       indexKeep =  which(fSOMObject$MST$size > sort(fSOMObject$MST$size)[nbRm])
       indexRemove  = setdiff((1:length(fSOMObject$MST$size)),indexKeep)
       fSOM4Plot$MST$size=fSOMObject$MST$size[indexKeep]
       fSOM4Plot$map$medianValues=fSOMObject$map$medianValues[indexKeep,]
       fSOM4Plot$MST$graph=igraph::induced_subgraph(fSOMObject$MST$graph,indexKeep)
       fSOM4Plot$MST$l = fSOMObject$MST$l[indexKeep,]
       if (equalSize) {fSOM4Plot$MST$size = rep(8,length(fSOM4Plot$MST$size))}
       PlotLabels(fSOM4Plot,as.factor(metaClustFactors[indexKeep]), main=mainTitle)
    }
    else
    {if (equalSize) {fSOM4Plot$MST$size = rep(8,length(fSOM4Plot$MST$size))}
            PlotLabels(fSOM4Plot,as.factor(metaClustFactors), main=mainTitle)}
}
