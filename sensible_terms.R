require(tm) 

stopList <- c("analysis", "big", "data", "development"
              , "good", "language", "learning", "machine", "mining"
              , "model" , "programming",  "software", "tool"
              , "ibm", "integration", "mathematical", "visualization"
              , "business", "fluent", "high",  "intelligence", "level"
              , "management", "multivariable",  "network", "neural", "continuous"
              , "deep", "distributed", "exploratory" , "feature", "vision"
              , "function", "google", "microsoft", "predictive", "procedures"
              , "science", "sensor", "technology", "unstructured", "write"
              , "speak", "large", "applications", "excellent", "frameworks"
              , "processing", "systems"
              , "statistics", "algorithms", "automated", "embedded"
              , "image", "scene", "technologies", "computer"
              , "methods", "amounts", "engineering", "series"
              , "techniques", "time", "analytical", "especially", "structures"
              , "written", "spoken", "search", "project", "preferably", "knowledge"
              , "natural", "granular", "trees", "sets")

sensible_terms <- function(x) {
  stopStem <- stemDocument(stopList)
  xStem <- stemDocument(x)
  sensStem <- setdiff(xStem, stopStem)
  x [xStem %in% sensStem]
}