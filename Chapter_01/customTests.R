# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

# Get the swirl state
start_timer <- function() {
  e <- get('e', parent.frame())
  e$`__lesson_start_time` <- now()
  TRUE
}

stop_timer <- function() {
  e <- get('e', parent.frame())
  if(deparse(e$expr) == "stopwatch()") {
    start_time <- e$`__lesson_start_time`
    stop_time <- now()
    print(as.period(interval(start_time, stop_time)))
  }
  TRUE
}

# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Get the last expression which the user entered at the R console.
getExpr <- function(){
  getState()$expr
}


# Retrieve the log from swirl's state
getLog <- function(){
  getState()$log
}

submit_log <- function(...){
  si <- as.data.frame(t(Sys.info()))
  
  e <- get("e", parent.frame())
  
  form_link <- "https://docs.google.com/forms/d/e/1FAIpQLScJ2lYafz7lqnhnD9Z7Dw-PZLfhhC3IihZKWkURFGcMseYeGg/viewform?entry.1752962042"
  form_link2 <- "http://bit.ly/stats20_19f_swirl"
  if(!grepl("=$", form_link)){
    form_link <- paste0(form_link, "=")
  }
  
  p <- function(x, p, f, l = length(x)){if(l < p){x <- c(x, rep(f, p - l))};x}
  
  temp <- tempfile()
  log_ <- getLog()
  nrow_ <- max(unlist(lapply(log_, length)))
  log_tbl <- data.frame(user = rep(log_$user, nrow_),
                        course_name = rep(log_$course_name, nrow_),
                        lesson_name = rep(log_$lesson_name, nrow_),
                        question_number = p(log_$question_number, nrow_, NA),
                        correct = p(log_$correct, nrow_, NA),
                        attempt = p(log_$attempt, nrow_, NA),
                        skipped = p(log_$skipped, nrow_, NA),
                        datetime = p(as.POSIXct.numeric(log_$datetime, origin="1970-01-01"), nrow_, NA),
                        stringsAsFactors = FALSE)
  # write.csv(log_tbl, file = temp, row.names = FALSE)
  
  suppressWarnings(write.table(si, file = temp, row.names = FALSE, col.names = TRUE, sep = ",")) # drop if not working
  suppressWarnings(write.table(log_tbl, file = temp, row.names = FALSE, col.names = TRUE, append = TRUE, sep = ","))
  encoded_log <- base64encode(temp)
  logname <- paste0("logfile - ", log_$lesson_name, ".txt")
  fileConn<-file(logname)
  writeLines(encoded_log, fileConn)
  close(fileConn)
  
  if(e$val == "Yes"){
    file.show(logname, title = "Lesson Log")
    browseURL(paste0(form_link, encoded_log))
    cat(paste0("If there is an error submitting your lesson log, please email the CONTENTS of your encoded log record, the file named:\n\n",
               logname,
               "\n\nlocated in your working directory, along with acompanying screenshots, and system information.\n\n"))
  } else {
    file.show(logname, title = "Lesson Log")
    cat(paste0("You have chosen not to submit, unless this is for a good reason (e.g. you are just repeating lessons for practice) you SHOULD submit it yourself.\nYou may do so by copying the encoded log record located in:\n\n",
               logname,
               "\n\nand pasting its contents into the form at:\n\n",
               form_link2, "\n\n"))
  }
  
}

test_func <- function() {
  try({
    func <- get('f', globalenv())
    t1 <- identical(func(9), 2*9+3)
    t2 <- identical(func(4), 2*4+3)
    t3 <- identical(func(0), 2*0+3)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_sa <- function() {
  r <- runif(1)
  h <- runif(1)
  try({
    func <- get('sa_cyl', globalenv())
    t1 <- identical(func(r = r, h = h), 2 * pi * r * h + 2 * pi * r ^ 2)
    ok <- all(t1)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_area <- function() {
  r <- runif(1)
  try({
    func <- get('area_circle', globalenv())
    t1 <- identical(func(r = r), pi * r ^ 2)
    ok <- all(t1)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}
