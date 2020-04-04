# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

rm(list = ls())
swirl_options(swirl_logging = TRUE)
swirl_options(swirl_is_fun = FALSE)

parks_df <- data.frame("Name"=c("Leslie","Ron","April"),"Height"=c(62,71,66),
                       "Weight"=c(115,201,119),"Income"=c(4000,NA,2000))
L <- list(1:10,matrix(1:6,nrow=2,ncol=3),parks_df,list(1:5,matrix(1:9,nrow=3,ncol=3)))

A <- matrix(rnorm(100), ncol=5)

pulse <- round(rnorm(22, 70, 2)) + rep(c(0, 5), c(10, 12))
F1 <- sample(rep(c("A1", "A2"), c(10, 12)))
F2 <- rep(c("B1", "B2", "B1", "B2"), c(5, 6, 5, 6))
