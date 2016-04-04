#if you havent installed it yet
install.packages("jsonlite")
install.packages("stringr")
install.packages("rjson")

library(rjson)
library(jsonlite)
library(stringr)

#make sure to set to the directory where the json is
setwd("C:\\Users\\Punkiehome1\\Documents")

#name of json file
file = "reddit2.JSON"

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

numJSON = length(numJSON)

allJSON = numeric()

#gets each json and adds it to the list
for (i in 1:numJSON)
{

	#gets the substring of the next json
	nextJson = input[i]



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
	#gets the upvote variable for each json
	upvotes[z] = allJSON[[z]]$ups	
}

#shows the upvotes for each JSON that represents a reddit post
print(upvotes)
