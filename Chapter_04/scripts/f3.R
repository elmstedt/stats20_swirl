f3 <- function(x){
	n <- length(x)
	for(j in 1:(n - 1)){
		for(i in 1:(n - j)){
			if(x[i] > x[i + 1]){
				temp <- x[i]
				x[i] <- x[i + 1]
				x[i + 1]<-temp
			}
		}
	}
	x
}
