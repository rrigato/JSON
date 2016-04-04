### JSON
Couple R scripts used to read and deal with JSON files

#####Using JSON file that get read in as a character vector
[redditJSON.R](https://github.com/rrigato/JSON/blob/master/redditJSON.R) is a script that is used to read and parse JSON files that are read into a character vector.
* The assumption of this file is that each JSON is seperated by a single whitespace
* If you are using this script remember to replace the working directory with your 
```
  setwd("C:\\Users\\workingDirectoryOfJSON")
```

* And replace the filename
```
  file = "fileNAME.JSON"
```
* Dependencies: rjson, jsonlite and stringr
* [An Example JSON file used can be found here](https://github.com/rrigato/JSON/blob/master/reddit.JSON)
* All JSON's are parsed into one list that can be easily iterated through



#####Using JSON files that get read in as a character matrix
[charMatrix.R](https://github.com/rrigato/JSON/blob/master/charMatrix.R) is a script that is used to read and parse JSON files that are read into a character matrix.
* The unique problem with this script was created to address is when a json gets read in as an N element character matrix instead of a simple character vector
* Where N is the number of JSONs read into the matrix
* If you are using this script remember to replace the working directory with your 
```
  setwd("C:\\Users\\workingDirectoryOfJSON")
```

* And replace the filename
```
  file = "fileNAME.JSON"
```
* [An Example JSON file can be found here](https://github.com/rrigato/JSON/blob/master/charMatrix.R)
