library("RWeka")
library("tm")
library("SnowballC")

# at first read dictionary
#dict <- VCorpus(DirSource("./dictionary/"))
#dict <- tm_map(dict, stripWhitespace)
#dict <- tm_map(dict, removePunctuation)
#dict <- tm_map(dict, removeNumbers)
#dict <- tm_map(dict, stemDocument)
#dict <- tm_map(dict, content_transformer(tolower))

# stop words
stopList <- scan("./stop/stop.txt", what = character(), flush = TRUE)

# jobs
jobs <- VCorpus(DirSource("./job/"))
jobs <- tm_map(jobs, stripWhitespace)
jobs <- tm_map(jobs, removePunctuation)
jobs <- tm_map(jobs, removeNumbers)
jobs <- tm_map(jobs, stemDocument)
jobs <- tm_map(jobs, content_transformer(tolower))

# mining
nGramTok <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 3))
tdm <- TermDocumentMatrix(jobs, list(#dictionary = dict[[1]]$content,
                                     tokenize = nGramTok,
                                     stopwords = stopList))

findFreqTerms(tdm, 3)

findMostFreqTerms(tdm)
inspect(tdm)
