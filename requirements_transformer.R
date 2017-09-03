require("tm")

#function peforms text transormations on jobs' requirements
requirements_transformer <- function (jobs) {
  # remove 'i.e.', 'e.g.'
  jobs <- tm_map(jobs, content_transformer(gsub), pattern = "(e\\.g\\.)|(i\\.e\\.)", 
                 replacement = "")
  # replace names C++ and C# with literal equivalents BEFORE removing the punctuation
  jobs <- tm_map(jobs, content_transformer(gsub), pattern = "C ?[+]{2}", 
                 replacement = "cplus")
  jobs <- tm_map(jobs, content_transformer(gsub), pattern = "C ?[#]{1}", 
                 replacement = "csharp")
  # replace punctuation marks with spaces
  jobs <- tm_map(jobs, content_transformer(gsub), pattern = "[[:punct:]]", 
                 replacement = " ")
  # replace names R and C with literal equivalents AFTER removing the punctuation
  jobs <- tm_map(jobs, content_transformer(gsub), pattern = " R ", 
                 replacement = " rlang ")
  jobs <- tm_map(jobs, content_transformer(gsub), pattern = " C ", 
                 replacement = " clang ")
  jobs <- tm_map(jobs, stripWhitespace)
  #jobs <- tm_map(jobs, removePunctuation) - is done above
  #jobs <- tm_map(jobs, removeNumbers)
  jobs <- tm_map(jobs, content_transformer(tolower))
  #jobs <- tm_map(jobs, stemDocument)
  # remove words that don't have much sence 
  customStopWords <- c("and", "very", "for", "good", "etc", "eg", "in", "of"
                       , "or", "such", "as")
  jobs <- tm_map(jobs, removeWords, customStopWords)
  jobs
}