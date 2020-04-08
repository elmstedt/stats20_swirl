# Choose a pattern which will select only WHOLE words which start with an r, s, or t regardless of case.
ptrn <- ""                                                  # EDIT THIS LINE
reg <- gregexpr(ptrn, plath)                                # DO NOT EDIT THIS LINE
(rst_words <- Reduce("c",regmatches(x = plath, m = reg)))   # DO NOT EDIT THIS LINE