
# The yield files from 2019 and 2020
Yield_2019 <- paste0(here(), "/Data/YieldData_2019.csv")
NIR_2020   <- paste0(here(), "/Data/NIRData_2020.csv")
Yield_2020 <- paste0(here(), "/Data/YieldData_2020.csv")

the_plan <-
  drake_plan(

   # Read in and clean the data from 2019 and 2020
    YieldData = read_YieldData(Data_2019    = file_in(!!Yield_2019), 
                               Data_2020    = file_in(!!Yield_2020),
                               NIRData_2020 = file_in(!!NIR_2020)),
    
    # Clean the data to make a balanced set of data 
    # Basically, remove lines from 2020 that aren't in the 2019 data
    BalancedData = Balance_YieldData(YieldData = YieldData$All_WithAg_ThreeReps),
    
    
    
    # Make summary tables and plots for EDA
    ExploratoryAnalysis = explore_BalancedData(BalancedData),
    
    
    # The analysis writeup document
    Report = callr::r(
      function(...) rmarkdown::render(...),
      args = list(
        input = drake::knitr_in("C:/Users/Jay/Desktop/Documents/R/JayYield2021/doc/analysis.Rmd"),
        output_file = drake::file_out("C:/Users/Jay/Desktop/Documents/R/JayYield2021/doc/analysis.html")
      )
    )

)
