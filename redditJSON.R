#if you havent installed it yet
install.packages("jsonlite")
install.packages("stringr")
library(jsonlite)
library(stringr)

#make sure to set to the directory where the json is
setwd("C:\\Users\\Randy\\Downloads")

#name of json file
file = "reddit.JSON"

#create a connection
connection = file(file, "r")
#read in the json file
input <- readLines(connection, -1L)

#be a good citizen and close the connection to the file you opened
close(connection)




#count how many times a character appears
countOccurrences <- function(char, s) {
    s2 <- gsub(char,"",s)
    return (nchar(s) - nchar(s2))
}

#number of JSON files is equal to }
numJSON = countOccurrences('}', input)

#list where the first json is held
allJSON = lapply(X=input,fromJSON)

#finds where the first json starts and ends
start1 = 1
end1 = regexpr(pattern = '}', input)[1]


inputShrunk = input

inputShrunk = substr(inputShrunk, end1 +2, nchar(inputShrunk))

for (i in 2:numJSON)
{
	end1 = regexpr(pattern = '}', inputShrunk)[1]
	nextJson = substr(inputShrunk, 1, end1)
	inputShrunk = substr(inputShrunk, end1 +2, nchar(inputShrunk)) 
	tempList = lapply(X=nextJson,fromJSON)
	allJSON = c(allJSON,tempList)
}

upvotes = numeric(numJSON)
for(z in 1:numJSON)
{
	upvotes[z] = allJSON[[z]]$ups	
}
