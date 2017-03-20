# =========================================================================
# Load libraries and scripts
# =========================================================================
library(shiny)
library(ggplot2)
library(scales)
source("data/parser.R")

# =========================================================================
# GET parsed data from parser.R script into dataframes
# =========================================================================
dataframes <- list(
  trend = as.data.frame(get_labor_trend()),
  occupation = as.data.frame(get_labor_occupation()),
  education = as.data.frame(get_labor_education())
)
