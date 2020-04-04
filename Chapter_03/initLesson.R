# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

set.seed(123)
rm(list = ls())
swirl_options(swirl_logging = TRUE)
swirl_options(swirl_is_fun = FALSE)


v <- sample(100, 20, TRUE)

my_logi_all <- c(TRUE, TRUE, TRUE)
my_logi_any <- c(FALSE, FALSE, TRUE, FALSE)
my_logi_none <- c(FALSE, FALSE, FALSE)
