#INSTRUCTIONS 
#Change .xlsx to .zip
#extract worksheet .xml files from xl/worksheets
#set working directory to the folder you extracted the xml files to
#run script
#copy and replace .xml files back into original .zip
#rename .zip to .xlsx
#done


# Load necessary library
library(stringr)

# Function to remove content between and including "<sheetProtection" and "/>"
remove_sheet_protection <- function(content) {
  pattern <- "<sheetProtection.*?/>"
  gsub(pattern, "", content, perl = TRUE)
}

# Set the working directory to the one with the extracted sheet xml files
setwd(/)
current_directory <- getwd()

# List all .xml files in the current directory
xml_files <- list.files(current_directory, pattern = "\\.xml$", full.names = TRUE)

# Iterate over all .xml files
for (file_path in xml_files) {
  # Read the content of the XML file
  content <- readLines(file_path, warn = FALSE)
  content <- paste(content, collapse = "\n")
  
  # Remove the unwanted content
  new_content <- remove_sheet_protection(content)
  
  # Write the new content back to the file
  writeLines(new_content, file_path)
}

cat("Processing complete.\n")