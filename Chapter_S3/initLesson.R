set.seed(123)
rm(list = ls())
swirl_options(swirl_logging = TRUE)
swirl_options(swirl_is_fun = FALSE)

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}


tryCatch(stat_dir <- readLines("http://directory.stat.ucla.edu/faculty/all-faculty/"),
         error = function(c) {}
)

.pathtofile <<- function(fileName){
  file.path(.get_course_path(),
            "stats20_swirl", "Chapter_S3",
            fileName)
}
#.datapath <- file.path(.get_course_path(),
#                       'stats20s19swirl', 'Week_2.2', 'data')
.filepath <- file.path(.get_course_path(),
                       "stats20_swirl", "Chapter_S3", 'files')
.files <- dir(.filepath)
 # if(!dir.exists("Week_4.1.c_Files")){
 #   dir.create("Week_4.1.c_Files")  
 # }
file.copy(file.path(.filepath, .files), file.path(.files))
.viewer_question <<- function(html){
  path <- .pathtofile(html)
  temp <- tempfile(fileext = ".html")
  file.copy(path, temp, overwrite = TRUE)
  
  viewer <- getOption("viewer")
  if (!is.null(viewer))
    viewer(temp)
  else
    utils::browseURL(temp)
}
#.cpath <- .get_course_path()

preamble <- "We the People of the United States, in Order to form a more perfect Union, establish Justice, insure domestic Tranquility, provide for the common defence, promote the general Welfare, and secure the Blessings of Liberty to ourselves and our Posterity, do ordain and establish this Constitution for the United States of America."
gettysburg <- "Fourscore and seven years ago our fathers brought forth, on this continent, a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal. Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived, and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting-place for those who here gave their lives, that that nation might live. It is altogether fitting and proper that we should do this. But, in a larger sense, we cannot dedicate, we cannot consecrate—we cannot hallow—this ground. The brave men, living and dead, who struggled here, have consecrated it far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us—that from these honored dead we take increased devotion to that cause for which they here gave the last full measure of devotion—that we here highly resolve that these dead shall not have died in vain—that this nation, under God, shall have a new birth of freedom, and that government of the people, by the people, for the people, shall not perish from the earth."
hello <- "Hello World!"

plath <-c(
  "What a thrill ---",
  "My thumb instead of an onion.",
  "The top quite gone",
  "Except for a sort of a hinge",
  "",
  "Of skin,",
  "A flap like a hat,",
  "Dead white.",
  "Then that red plush.",
  "",
  "Little pilgrim,",
  "The Indian's axed your scalp.",
  "Your turkey wattle",
  "Carpet rolls",
  "",
  "Straight from the heart.",
  "I step on it,",
  "Clutching my bottle",
  "Of pink fizz.",
  "",
  "A celebration, this is.",
  "Out of a gap",
  "A million soldiers run,",
  "Redcoats, every one.",
  "",
  "Whose side are they on?",
  "O my",
  "Homunculus, I am ill.",
  "I have taken a pill to kill",
  "",
  "The thin",
  "Papery feeling.",
  "Saboteur,",
  "Kamikaze man ---",
  "",
  "The stain on your",
  "Gauze Ku Klux Klan",
  "Babushka",
  "Darkens and tarnishes and when",
  "",
  "The balled",
  "Pulp of your heart",
  "Confronts its small",
  "Mill of silence",
  "",
  "How you jump ---",
  "Trepanned veteran,",
  "Dirty girl,",
  "Thumb stump.")

always <- paste("a", strrep(x = "l", 0:5), "ways", sep = "")
alLways <- paste("a", strrep(x = "lL", 0:4), "ways", sep = "")

.rst_words_pattern <- "\\b[r-tR-T][[:alnum:]]*\\b"

