load_outcome_sheet <- function(wb, sheet) {
  df <- wb_read(
    wb,
    sheet,
    rows = 3:7,
    cols = col2int('A'):col2int('L')
  )
  
  colnames(df) <- c('outcome', 'timepoint', 'description', 'child_yes', 'adult_yes', 'yes_calc-total', 'event_input-total', 'child_no', 'adult_no', 'no_calc-total', 'calc-total', 'input-total')
  
  return(df)
}


load_outcome_df <- function(wb) {
  browser()
  sheets_to_load <- c(
    'opioid_use' = 'TPIAT Opioid Pop Method',
    'hospitalization' = 'TPIAT Hospitalization PM',
    'anxiety' = 'TPIAT Anxiety PM',
    'depression' = 'TPIAT Depression PM'
  )
  
  dfs <- map(as.list(sheets_to_load), \(sheet) load_outcome_sheet(wb, sheet))
  df <- bind_rows(dfs, .id = 'outcome')
  
  return(df)
}

load_outcome_a1c_sheet <- function(wb, start_col) {
  df_raw <- wb_read(
    wb,
    'TPIAT A1C PM',
    rows = 3:7,
    cols = c(col2int(c('A', 'B')), seq(col2int(start_col), length.out = 4), col2int('AA'):col2int('AF'))
  )
  
  colnames(df_raw) <- c('timepoint', 'description', 'child_event', 'adult_event', 'event_calc_total', 'event_input_total', 'child_calc_total', 'adult_calc_total', 'calc_total', 'child_input_total', 'adult_input_total', 'input_total')
  
  for(x in colnames(df_raw)[-c(1,2)]) {
    df_raw[,x] <- as.integer(df_raw[,x])
  }
  
  return(df_raw)
}

load_outcome_a1c_df <- function(wb) {
  start_cols <- as.list(col2int(c('C', 'G', 'K', 'O', 'S', 'W'))) %>% 
    setNames(c('a1c_<5.7', 'a1c_5.7-6.4', 'a1c_6.5-6.9', 'a1c_7.0-7.9', 'a1c_8.0-8.9', 'a1c_>=9.0'))
  dfs <- map(start_cols, \(x) load_outcome_a1c_sheet(wb, x))
  
  df <- bind_rows(dfs, .id = 'a1c')
  
  return(df)
}

