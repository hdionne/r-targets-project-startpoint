library(targets)
library(tarchetypes)
library(crew)

# Tell targets that the _targets.R file is in the scripts folder instead of the project root directory.
tar_config_set(
  script = './scripts/_targets.R',
  store = './scripts/_targets/'
)

tar_option_set(
  seed = #TODO
)
# Tell targets that there is a folder of scripts defining functions, ./scripts/functions/ and that these scripts should be run.
tar_source('./scripts/functions/')

# List the libraries.
libraries <- c()

tar_plan(
  
)