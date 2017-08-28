library("RWeka")
library("tm")
library("SnowballC")

conn <- file("./job/data.frame/17_jobs.txt", open="r")
jobsData <- readLines(conn)
close(conn)

jobs <- VCorpus(VectorSource(jobsData))

jobs <- tm_map(jobs, stripWhitespace)
jobs <- tm_map(jobs, removePunctuation)
#jobs <- tm_map(jobs, removeNumbers)
jobs <- tm_map(jobs, content_transformer(tolower))
jobs <- tm_map(jobs, stemDocument)


nGramTok <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 4))
termJobMatrix <- 
  TermDocumentMatrix(jobs, list(tokenize = nGramTok, stopwords = TRUE))


findFreqTerms(termJobMatrix, 5)

findMostFreqTerms(termJobMatrix)

inspect(termJobMatrix)
