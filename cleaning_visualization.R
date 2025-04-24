# Load required packages
library(dplyr)
library(readr)

# Read the dataset, skipping metadata rows 
df <- read_csv("messy_ice_detention.csv", skip = 6)

# View column names and first few rows to confirm it loaded correctly

print(colnames(df))
print(head(df, 5))

# Clean the column names to avoid issues later
colnames(df) <- c("Name", "City", "State", "Level_A", "Level_B", "Level_C", "Level_D", "Last_Inspection_End_Date")

# Check for blank strings in key columns
sum(is.na(df$Name))
sum(is.na(df$City))
sum(is.na(df$State))

# View rows with missing Name
df[is.na(df$Name), ]

# View rows with missing City
df[is.na(df$City), ]

# View rows with missing State
df[is.na(df$State), ]

# Find the row numbers with missing Name
which(is.na(df$Name))

# Fill missing Name in row 117
df$Name[117] <- "SHER-BURNE COUNTY JAIL"

df$Name[124] <- "MARILYN ALLEN JAIL"

which(is.na(df$Name))

which(is.na(df$City))

# Fill missing City in row 52
df$City[52] <- "CHARDON"

which(is.na(df$State))

df$State[7] <- "GA"

df$State[72] <- "TX"

# Convert only numeric-like values to dates; keep others as NA
df$Last_Inspection_End_Date <- suppressWarnings(
  as.Date(as.numeric(df$Last_Inspection_End_Date), origin = "1899-12-30")
)

#  Remove obvious strange characters from 'Name' (ONLY if you want to clean up graph labels)
# Fix encoding issues in Name column (minimum fix to avoid error)
# df$Name <- iconv(df$Name, from = "", to = "UTF-8", sub = "")

sum(is.na(df$Last_Inspection_End_Date))


df[is.na(df$Last_Inspection_End_Date), ]
write_csv(df, "cleaned_ice_detention.csv")

# Print cleaned preview
print(head(df, 10))




