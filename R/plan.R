
# The yield files from 2019 and 2020
Yield_2019 <- paste0(here(), "/Data/YieldData_2019.csv")
Yield_2020 <- paste0(here(), "/Data/YieldData_2020.csv")

the_plan <-
  drake_plan(

   # Read in and clean the data from 2019 and 2020
    YieldData = read_YieldData(Data_2019 = file_in(!!Yield_2019), 
                               Data_2020 = file_in(!!Yield_2020))

)
