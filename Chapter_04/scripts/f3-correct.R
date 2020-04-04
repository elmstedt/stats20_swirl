f3 <- function(x){
	for(j in seq_along(x[-1])){
		for(i in seq(length.out = length(x) - j)){
			if(x[i] > x[i + 1]){
				temp <- x[i]
				x[i] <- x[i + 1]
				x[i + 1]<-temp
			}
		}
	}
	x
}
