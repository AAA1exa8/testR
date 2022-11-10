mid_school <- readRDS("~/Documents/programming/DataSci/pleskotA/M03_2021.RDS")

install.packages("ggplot2")
library(dplyr)

# V.Určete počet škol v datasetu
mid_school %>% nrow()

#1. Určete školu, ve které největší podíl žáků, ukončil povinnou školní docházku dříve než v 9. třídě
mid_school <- mid_school %>%
  mutate(eneded_prematurly = ukoncili_v_7_8/zaci_celkem)

mid_school$eneded_prematurly[is.infinite(mid_school$eneded_prematurly)] <- NA


# 2. Opakuje, ale jen pro školy s počtem žáků větším než 100
ended_prematurely_over100 <- mid_school %>%
  filter(zaci_celkem > 100)

# 3. Bonus
mid_school$sizeof_school <- if_else(mid_school$zaci_celkem >= 250, "velka", "mala")
