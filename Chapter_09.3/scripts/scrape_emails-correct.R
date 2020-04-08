### Edit the email pattern below to select only the email addresses on the Stat Department Directory Page
### If you get an error related to stat_dir not being found, uncomment the first line below.

# stat_dir <- readLines("http://directory.stat.ucla.edu/faculty/all-faculty/")
email_pattern <- "\\b([[:alnum:].])*\\b *@ *([[:alnum:].])*\\b"
reg <- gregexpr(email_pattern, stat_dir)
faculty_email <- gsub(pattern = "[[:space:]]*", replacement = "", Reduce("c",regmatches(x = stat_dir, m = reg)))

# When you are finished, type submit() into the command line below.