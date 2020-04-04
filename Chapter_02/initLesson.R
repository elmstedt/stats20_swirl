# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

set.seed(123)
rm(list = ls())
swirl_options(swirl_logging = TRUE)
swirl_options(swirl_is_fun = FALSE)

v1 <- seq(pi, length.out = 4)

v2 <- 4:1

v3 <- seq(-1.5, length.out = 4)

v4 <- rep(3,3)

v5 <- 1:5

v6 <- c(TRUE, FALSE, NA)
heights <- round(rnorm(100, 64, 2.2))