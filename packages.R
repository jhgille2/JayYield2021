## library() calls go here

list.of.packages <- c("conflicted", "dotenv", "drake", "here", "tidyverse", "gsheet", "readxl", "janitor", "ggplot2", "ggcorrplot", "cowplot", 
                      "patchwork", "gt", "ggthemes", "tufte", "kableExtra", "ggrepel", "hrbrthemes", "emmeans", "lme4", "metan", "rmarkdown", "bookdown")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Organization
library(conflicted)
library(dotenv)
library(drake)
library(here)

# Data wrangling
library(tidyverse)
library(gsheet)
library(readxl)
library(janitor)

# Visualization
library(ggplot2)
library(ggcorrplot)
#library(cowplot)
library(patchwork)
library(gt)
library(ggthemes)
library(tufte)
library(kableExtra)
library(ggrepel)
library(hrbrthemes)

# Analysis
library(emmeans)
library(lme4)
library(metan)
library(rmarkdown)
library(bookdown)

