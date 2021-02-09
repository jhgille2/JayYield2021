##' Read in the .csv files for the 2019 and 2020 yield data for the "Jay" yield tests.
##' This function reads in both files, filters genotypes from the 2019 data so that it
##' only contains the entries which were also grown in 2020, cleans each data set 
##' so that they share a set of column names and variable types, and combines them
##' to a single file. 
##'
##' .. content for \details{} ..
##'
##' @title
##' @param Data_2019
##' @param Data_2020
##' @return A single data set ready for analysis with the metan package
read_YieldData <- function(Data_2019 = file_in(!!Yield_2019), Data_2020 =
                           file_in(!!Yield_2020)) {

  Data2019 <- read_csv(Data_2019)
  Data2020 <- read_csv(Data_2020)
  
  # Keep only the entries that are included in 2020, 
  # and keep only the checks from one of the tests
  Data2019 <- Data2019 %>%
    dplyr::filter(Genotype %in% unique(Data2020$Genotype),
                  !(Genotype %in% c("Dunphy", "Osage") & Test %in% c("Yield Test 2", "Yield Test 3", "Yield Test 4"))) %>% 
    clean_names() %>%
    mutate(loc = toupper(loc),
           ENV = paste(loc, year, sep = "-")) %>%
    select(genotype, 
           year,
           rep, 
           loc,
           ENV,
           plot, 
           yield,
           oil, 
           protein, 
           protein_plus_oil)
  
  Data2020 <- Data2020 %>%
    clean_names() %>%
    rename(oil = oil_dry_basis,
           protein = protein_dry_basis) %>%
    mutate(protein_plus_oil = oil + protein, 
           loc = toupper(loc),
           ENV = paste(loc, year, sep = "-")) %>%
    select(genotype, 
           year,
           rep,
           loc,
           ENV,
           plot, 
           yield,
           oil,
           protein,
           protein_plus_oil) %>%
    dplyr::filter(rep != 4)
  
  AllData <- bind_rows(Data2019, Data2020)
  AllData
}
