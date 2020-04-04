# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

rm(list = ls())
swirl_options(swirl_logging = TRUE)
swirl_options(swirl_is_fun = FALSE)
x <- 1:10
.get_course_path <- function(){
	tryCatch(swirl:::swirl_courses_dir(),
					 error = function(c) {file.path(find.package("swirl"),"Courses")}
	)
}

.pathtofile <<- function(fileName){
	file.path(.get_course_path(),
						"stats20_swirl", "Chapter_4",
						fileName)
}
#.datapath <- file.path(.get_course_path(),
#                       'stats20s19swirl', 'Week_2.2', 'data')

.filepath <- file.path(.get_course_path(),
											 'stats20_swirl', 'Chapter_4', 'files')

.files <- dir(.filepath)

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
