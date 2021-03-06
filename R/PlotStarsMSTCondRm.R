## User tool: tree representaton of metacluster, given size and marker representation on a subset of samples given by an list of index, removing a given number of smallest cluster
#' Modified PlotStarsMST function of FlowSOM, with removal of smallest clusters, over a subset of data
#' @param fSOMObject FlowSOM tree
#' @param metaClustFactors meta-clusters (numbers or names)
#' @param condIndex index of data events
#' @param mainTitle title
#' @param nbRm  number of smallest cluster to remove
#' @param smallTree true if tree is small and meta-cluster legend is big
#' @param equalSize true if clusters are represented with identical sizes
#' @export
#'
PlotStarsMSTCondRm <- function(fSOMObject,metaClustFactors,condIndex,mainTitle,nbRm=0,smallTree=F,equalSize=F)
{
    fSOM4Plot=list(
        map=fSOMObject$map,
        prettyColnames=fSOMObject$prettyColnames,
        MST=fSOMObject$MST)
    dataIndex = unlist(sapply(fSOMObject$metaData[condIndex],function(x){x[1]:x[2]}))
    clSizes = sapply(1:length(fSOMObject$map$medianValues[,1]),function(x){length(which(fSOMObject$map$mapping[dataIndex,1] == x))})
    if (nbRm>0)
    {
        indexKeep =  which(fSOMObject$MST$size > sort(fSOMObject$MST$size)[nbRm])
        indexRemove  = setdiff((1:length(fSOMObject$MST$size)),indexKeep)
        fSOM4Plot$MST$size = (sqrt(clSizes)/max(sqrt(clSizes))*15)[indexKeep]
        fSOM4Plot$map$medianValues = t(sapply(1:length(fSOMObject$map$medianValues[,1]),function(i){apply(fSOMObject$data[intersect(dataIndex,which(fSOMObject$map$mapping[,1] == i)),,drop=F],2,function(x){median(x)})}))[indexKeep,]
        fSOM4Plot$MST$graph=igraph::induced_subgraph(fSOMObject$MST$graph,indexKeep)
        fSOM4Plot$MST$l = fSOMObject$MST$l[indexKeep,]
        if (equalSize) {fSOM4Plot$MST$size = rep(8,length(fSOM4Plot$MST$size))}
        PlotStarsBigLeg(fSOM4Plot,backgroundValues = as.factor(metaClustFactors[indexKeep]), main=mainTitle,smallTree=smallTree)
    }
    else {
        fSOM4Plot$MST$size = sqrt(clSizes)/max(sqrt(clSizes))*15
        fSOM4Plot$map$medianValues = t(sapply(1:length(fSOMObject$map$medianValues[,1]),function(i){apply(fSOMObject$data[intersect(dataIndex,which(fSOMObject$map$mapping[,1] == i)),,drop=F],2,function(x){median(x)})}))
        if (equalSize) {fSOM4Plot$MST$size = rep(8,length(fSOM4Plot$MST$size))}
        PlotStarsBigLeg(fSOM4Plot,backgroundValues = as.factor(metaClustFactors), main=mainTitle,smallTree=smallTree)
        }
}
