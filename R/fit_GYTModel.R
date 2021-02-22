##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param BalancedData
##' @param TraitSelection
fit_GYTModel <- function(BalancedData, TraitSelection = c("Protein", "LOD")) {

  gytb(BalancedData, 
       gen      = GEN, 
       yield    = Yield, 
       traits   = TraitSelection,
       ideotype = c('h', 'l'),
       svp      = "genotype",
       weight   = c(1, 0.5))

}
