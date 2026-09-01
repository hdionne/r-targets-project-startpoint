library(targets)
library(tarchetypes)
library(crew)

# Tell targets that the _targets.R file is in the scripts folder instead of the project root directory.
tar_config_set(
  script = './scripts/_targets.R',
  store = './scripts/_targets/'
)

# List the libraries.
libraries <- c(
  'tidyverse',
  'openxlsx2'
)

tar_option_set(
  packages = libraries,
  seed = 968548
)
# Tell targets that there is a folder of scripts defining functions, ./scripts/functions/ and that these scripts should be run.
tar_source('./scripts/functions/')

# Place targets here
tar_plan(
  wb_file = './raw-data/TPIAT_Peds_Data.xlsx',
  wb = wb_load(wb_file),
  outcome_df_raw = load_outcome_df(wb),
  outcome_a1c_df_raw = load_outcome_a1c_df(wb)
)
