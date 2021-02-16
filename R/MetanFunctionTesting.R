


BalancedData <- readd(BalancedData)


inspect(BalancedData)

BLUP_Model <- gamem_met(BalancedData, 
                        env  = ENV, 
                        gen  = GEN, 
                        rep  = REP, 
                        resp = everything(),
                        verbose = FALSE)

waas_index <- waas(BalancedData,  ENV, GEN, REP, Yield, verbose = FALSE)
e <- plot_scores(waas_index, type = 3)
i <- plot_waasby(waas_index)

get_model_data(BLUP_Model, what = "vcomp")
get_model_data(BLUP_Model, "genpar")
get_model_data(BLUP_Model, "blupg")

plot_blup(BLUP_Model)


GGE_Model <- gge(BalancedData, 
                 env  = ENV, 
                 gen  = GEN, 
                 rep  = REP, 
                 resp = everything())


MTSI_Index2 <- waasb(BalancedData, 
                     env  = ENV, 
                     gen  = GEN, 
                     rep  = REP, 
                     resp = everything(),
                     # resp = c(Yield, Oil, Protein),
                     mresp = c('h', 'h', 'h'),
                     wresp = 75) %>%
  mtsi(SI = 20)
                

plot(MTSI_Index2)
mgidi(BLUP_Model) %>% plot()
fai_blup(BLUP_Model) %>% plot(SI = 25)
