##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param BalancedData
##' @param TraitSelection
fit_GYTModel <- function(BalancedData, TraitSelection = c("Protein", "Oil"), wt = c(1, 1), ideo = c('h', 'h')) {

  GYTMod <- gytb(BalancedData, 
                 gen      = GEN, 
                 yield    = Yield, 
                 traits   = all_of(TraitSelection),
                 ideotype = all_of(ideo),
                 svp      = "genotype",
                 weight   = all_of(wt))
  
  # Get the superiority indices from the model
  SITable <- get_model_data(GYTMod, what = "si")
  
  return(list("Model"    = GYTMod, 
              "SI_Table" = SITable))
}
