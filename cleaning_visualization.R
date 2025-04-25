# Load required packages
library(readr)

# Read the dataset, skipping metadata rows 
df <- read_csv("messy_ice_detention.csv", skip = 6)

# View column names and first few rows 
print(colnames(df))
print(head(df, 5))

##PART A : CLEAN

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

# Fill missing Name in row 117 and 124
df$Name[117] <- "SHER-BURNE COUNTY JAIL"

df$Name[124] <- "MARILYN ALLEN JAIL"

# Check if any other missing values are present
which(is.na(df$Name))

# Find the row numbers with missing City
which(is.na(df$City))

# Fill missing City in row 52
df$City[52] <- "CHARDON"

# Find the row numbers with missing State
which(is.na(df$State))

# Fill missing State in row 7 and 72
df$State[7] <- "GA"

df$State[72] <- "TX"

## All the missing values are filled using information from Google

# Convert only numeric-like values to dates, keep others as NA
# Used this as a reference to resolve the date issue:
# https://stackoverflow.com/questions/43230470/how-to-convert-excel-date-format-to-proper-date-in-r/43230524#43230524
df$Last_Inspection_End_Date <- suppressWarnings(
  as.Date(as.numeric(df$Last_Inspection_End_Date), origin = "1899-12-30")
)

sum(is.na(df$Last_Inspection_End_Date))

df[is.na(df$Last_Inspection_End_Date), ]

## Saving the cleaned dataset for further use
write_csv(df, "cleaned_ice_detention.csv")

# Print cleaned preview
print(head(df, 10))


##PART B: ANALYZE

# Checking the data types of Level A to D
str(df[, c("Level_A", "Level_B", "Level_C", "Level_D")])

# Creating Total population Column
df$Total_Population <- rowSums(df[, c("Level_A", "Level_B", "Level_C", "Level_D")], na.rm = TRUE)

df$Total_Population

str(df$Total_Population)

# Sort by Total_Population in descending order
top10 <- df[order(-df$Total_Population), ][1:10, ]


# View result
top10[, c("Name", "Total_Population")]


##Part C: VISUALIZE

library(ggplot2)

ggplot(top10, aes(x = reorder(Name, Total_Population), y = Total_Population, fill = Total_Population)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  scale_fill_gradient(low = "lightblue", high = "steelblue") +
  labs(title = "Top 10 Largest ICE Detention Facilities",
       x = "Detention Facility",
       y = "Total Population") +
  theme_minimal()

ggsave("top10_facilities.png", width = 10, height = 6)



