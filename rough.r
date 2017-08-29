library("RWeka")
library("tm")
library("SnowballC")

conn <- file("./job/data.frame/27jobs.txt", open="r")
jobsData <- readLines(conn)
close(conn)

jobs <- VCorpus(VectorSource(jobsData))
jobs <- tm_map(jobs, content_transformer(gsub), pattern = "[[:punct:]]", conn <- file("./job/data.frame/27jobs.txt", open="r")
               jobsData <- readLines(conn)
               close(conn)
               
               jobs <- VCorpus(VectorSource(jobsData))
               jobs <- tm_map(jobs, content_transformer(gsub), pattern = "[[:punct:]]", 
                              replacement = " ")
               jobs <- tm_map(jobs, stripWhitespace)
               #jobs <- tm_map(jobs, removePunctuation) - is done above
               #jobs <- tm_map(jobs, removeNumbers)
               jobs <- tm_map(jobs, content_transformer(tolower))
               jobs <- tm_map(jobs, stemDocument)
               customStopWords <- c("and", "veri", "for")
               jobs <- tm_map(jobs, removeWords, customStopWords)
               replacement = " ")
jobs <- tm_map(jobs, stripWhitespace)
#jobs <- tm_map(jobs, removePunctuation) - is done above
#jobs <- tm_map(jobs, removeNumbers)
jobs <- tm_map(jobs, content_transformer(tolower))
jobs <- tm_map(jobs, stemDocument)
customStopWords <- c("and", "veri", "for")
jobs <- tm_map(jobs, removeWords, customStopWords)


nGramTok <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 1))
tdm <- 
  TermDocumentMatrix(jobs, list(tokenize = nGramTok, stopwords = TRUE))


findFreqTerms(tdm, 4)

#findMostFreqTerms(tdm)

inspect(tdm)

