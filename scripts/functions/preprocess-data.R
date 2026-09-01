prep_outcome_df <- function(outcome_df_raw, outcome_a1c_df_raw) {
  outcome_df <- outcome_df_raw %>% 
    select(outcome, timepoint, child_yes, adult_yes, child_no, adult_no) %>% 
    pivot_longer(
      cols = c(child_yes, adult_yes, child_no, adult_no),
      names_to = c('age', 'event'),
      values_to = 'count',
      names_sep='_'
    ) %>% 
    mutate(timepoint, outcome, event, age, count, .keep = 'none')
  
  outcome_a1c_df <- outcome_a1c_df_raw %>% 
    select(outcome, timepoint, event, child_event, adult_event) %>% 
    pivot_longer(
      cols = c(child_event, adult_event),
      names_to = c('age'),
      values_to = 'count',
      names_pattern='(^[[:print:]]+(?=_))'
    ) %>% 
    mutate(timepoint, outcome, event, age, count, .keep = 'none')
  
  df <- bind_rows(outcome_df, outcome_a1c_df)
  
  return(df)
}

prep_demographics <- function(demo_df) {
  
  colnames(demo_df) <- c('characteristic', 'child', 'adult', 'total')
  
  for(x in c('child', 'adult', 'total')) {
    demo_df[,x] <- as.integer(demo_df[,x])
  }
  
  # Extract the count record
  total <- demo_df %>% filter(characteristic == 'Count')
  
  df <- demo_df %>% 
    filter(characteristic != 'Count') %>% 
    select(characteristic, child, adult) %>% 
    pivot_longer(
      cols = c(child, adult),
      names_to = 'age',
      values_to = 'count'
    ) %>% 
      mutate(
        count = as.integer(count),
        age_total = ifelse(age == 'child', total$child, total$adult),
        total = total$total
      )
    
  return(df)
}