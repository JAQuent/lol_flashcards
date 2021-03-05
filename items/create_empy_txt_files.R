# Create empty text files
# WD
setwd("~/lol_flashcards/items")

for(i in 1:192){
  file.create(paste0('descriptions/', i, '.txt'))
}