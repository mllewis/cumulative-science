library(tidyverse)

eng = read.csv("../data/corpus/english_complexity_norms.csv")

tidy_complexity <- eng %>%
  select(-X, -workerid, -trial, -obj, -clx.morph) %>%
  group_by(word) %>%
  summarize_all(mean) %>%
  rename(familiarity = mrc.fam,
         concreteness = mrc.conc,
         imageability = mrc.imag,
         n_syllables = mrc.syl,
         n_phonemes = mrc.phon,
         word_class = class, 
         frequency_old = subt.log.freq,
         n_chars = nchars,
         mean_complexity_rating = round(complexity,2)) %>%
  mutate(frequency = round(exp(1)^frequency_old,2),
         word_class = as.factor(word_class),
         word_class = fct_recode(word_class,
                                open = "1", closed = "0")) %>%
  select(-frequency_old) %>%
  mutate(complexity_type = ntile(mean_complexity_rating,2),
         complexity_type = as.factor(complexity_type),
         complexity_type = fct_recode(complexity_type,
                                 low = "1", high = "2")) %>%
  select(word, word_class, n_chars, n_syllables, n_phonemes, 
         mean_complexity_rating, complexity_type, concreteness, familiarity,imageability , frequency)


write_csv(tidy_complexity, "tidy_english_complexity.csv")
