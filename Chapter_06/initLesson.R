# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

# rm(list = ls())
swirl_options(swirl_logging = TRUE)
swirl_options(swirl_is_fun = FALSE)

set.seed(1123)
exam_score <- floor(c(pmin(rnorm(8, 70, 15), 100),
                      pmin(rnorm(5, 75, 13), 100),
                      pmin(rnorm(7, 78, 12), 100),
                      pmin(rnorm(5, 85, 8), 100)))
class_level <- factor(c(rep("Freshman", 8), 
                        rep("Sophomore", 5), 
                        rep("Junior", 7), 
                        rep("Senior", 5)),
                      levels = c("Freshman", "Sophomore", "Junior", "Senior"),
                      ordered = TRUE)

