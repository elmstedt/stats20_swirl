
# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.
swirl_options(swirl_logging = TRUE)
swirl_options(swirl_is_fun = FALSE)

stat_data <-
  structure(c(89, 92, 76, 97, 92, 94, 96, 83, 90, 84, 96, 89), .Dim = 4:3, .Dimnames = list(
    c("Alex", "Emily", "Michael", "Abigael"), c("stat100A", "stat101A", 
                                                "stat102A")))
set.seed(123)
contrived_list <- list(letters  = sample(letters, 5),
                       integers = sample(100, 5),
                       doubles  = round(runif(5) * 100, 2))

