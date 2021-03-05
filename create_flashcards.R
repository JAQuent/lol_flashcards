# This scripts takes .txt files and make a flashcard out of each by creating a .csv file that can 
# be imported to https://apps.ankiweb.net/

# Set wd
setwd("~/lol_flashcards")

# Get names of all text files
path2folder    <- "items/descriptions/"
all_text_files <- list.files(path2folder)
n              <- length(all_text_files)

# Create empty DF
df <- data.frame(front = rep(NA, n), back = rep(NA, n))

# Loop through all files
for(i in 1:n){
  # Create frontside
  # Take file name and remove .txt
  temp        <- substr( all_text_files[i], 1, nchar(all_text_files[i]) - 4)
  
  # Make html text and save to df
  df$front[i] <- paste0('<img src="items/images/', temp, '.png">')
  
  # Load file
  file2load <- paste0(path2folder, all_text_files[i])
  
  # Create string 
  string    <- readChar(file2load, file.info(file2load)$size)
  # Replace \n & \r
  string    <- gsub("\n", "<br>", string)
  string    <- gsub("\r", "<br>", string)
  
  # Add backside to df
  df$back[i] <- string
}

# Write .csv file
write.table(df, 'item_flashcards.csv', row.names = FALSE, col.names = FALSE, sep = '\t', quote = FALSE)
