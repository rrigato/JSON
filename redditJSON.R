#if you havent installed it yet
install.packages("jsonlite")
install.packages("stringr")
install.packages("rjson")

library(rjson)
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


#finds where the first json starts and ends
start1 = 1
end1 = regexpr(pattern = '}', input)[1]

nextJson = substr(input, 1, end1)

#list where the first json is held
allJSON = lapply(X=nextJson,fromJSON)

inputShrunk = input

#takes out the json already used
inputShrunk = substr(inputShrunk, end1 +2, nchar(inputShrunk))


#gets each json and adds it to the list
for (i in 2:numJSON)
{
	#gets the position of the close of the json 
	end1 = regexpr(pattern = '}', inputShrunk)[1]

	#gets the substring of the next json
	nextJson = substr(inputShrunk, 1, end1)

	#removes the json used from the rest of the string
	inputShrunk = substr(inputShrunk, end1 +2, nchar(inputShrunk)) 

	#makes the json into a temporary list
	tempList = lapply(X=nextJson,fromJSON)

	#adds the tempory list to the next json
	allJSON = c(allJSON,tempList)
}



#calculates all the upvotes into a vector from the json files that
#were read
upvotes = numeric(numJSON)
for(z in 1:numJSON)
{
	upvotes[z] = allJSON[[z]]$ups	
}
