# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

# Check that the output/value produced by a script is correct

keygen <- function(){
  set.seed(sum(as.numeric(charToRaw("Regular_Expressions"))))
  pran <- function(n = 1){
    replicate(n, sample(c(LETTERS, letters, 0:9), 1))
  }
  ks <- replicate(4, paste0(pran(4), collapse = ""))
  set.seed(NULL)
  pn <- sample(1:16, 1)
  kn <- sample(1:4, 1)
  sss <- paste(sample(c(LETTERS, letters, 0:9), 16-pn), collapse = "")
  eee <- paste(sample(c(LETTERS, letters, 0:9), pn), collapse = "")
  paste0(sss, ks[kn], eee)  
}

results_identical <- function(correctExpr = NULL) {
  # Get e
  e <- get('e', parent.frame())
  # Get value produced from user's script
  user_val <- capture.output(
    local(
      try(
        # Must use eval-parse combo, not source, if we don't force user
        # to print result
        eval(e$expr),
        silent = TRUE
      )
    )
  )
  # Get value produced from correct script
  correct_val <- capture.output(
    local(
      try(
        # Must use eval-parse combo, not source, if we don't force user
        # to print result
        eval(parse(text = correctExpr)),
        silent = TRUE
      )
    )
  )
  # cat("\n",user_val,"\n",correct_val,"\n\n")
  # Compare values
  identical(user_val, correct_val)
}
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
    cat(paste0("If the submission page does not appear or the lesson log is not completely filled, you SHOULD submit it yourself.\nYou may do so by copying the encoded log record located in:\n\n",
               logname,
               "\n\nand pasting its contents into the form at:\n\n",
               form_link2, "\n\n"))
  } else {
    file.show(logname, title = "Lesson Log")
    cat(paste0("You have chosen not to submit, unless this is for a good reason (e.g. you are just repeating lessons for practice) you SHOULD submit it yourself.\nYou may do so by copying the encoded log record located in:\n\n",
               logname,
               "\n\nand pasting its contents into the form at:\n\n",
               form_link2, "\n\n"))
  }
  
}


test_rst <- function() {
  try({
    plath <- get('plath', globalenv())
    ptrn <- "\\b[r-tR-T][[:alnum:]]*\\b"
    reg <- gregexpr(ptrn, plath)
    my_rst <- Reduce("c",regmatches(x = plath, m = reg))
    rst <- get('rst_words', globalenv())
    ok <- identical(my_rst, rst)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_email <- function() {
  try({
    stat_dir <- get('stat_dir', globalenv())
    ptrn <- "\\b([[:alnum:].])*\\b *@ *([[:alnum:].])*\\b"
    reg <- gregexpr(ptrn, stat_dir)
    my_faculty_email <- gsub(pattern = "[[:space:]]*", replacement = "", Reduce("c",regmatches(x = stat_dir, m = reg)))
    faculty_email <- get('faculty_email', globalenv())
    ok <- identical(my_faculty_email, faculty_email)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}
