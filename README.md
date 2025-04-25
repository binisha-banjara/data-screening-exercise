# Data Screening Exercise

This repository contains my solution to a data screening exercise using R. The goal was to clean, analyze, and visualize data on ICE detention facilities in
the U.S.

## Project Structure
```
data-screening-exercise/
├── messy_ice_detention.csv        # Original version of the dataset
├── cleaning_visualization.R       # R script for cleaning, analyzing and visualizing
├── cleaned_ice_detention.csv      # Cleaned version of the messy dataset
├── top10_facilities.png           # Visualization of the top 10 largest detention facilities
└── README.md                      # Documentation and usage instructions
```
## Objective

- **Clean** the messy dataset (`messy_ice_detention.csv`) by removing headers, strange characters, and fixing malformed/missing values.
- **Analyze** population levels by summing Level A through D into a `Total_Population` column.
- **Visualize** the top 10 detention facilities by total population using a bar chart.

## Requirements

- **R** (≥ 4.0.0)
- The following R packages:
  - `tidyverse`
  - `ggplot2`

Install the required packages by running:

```r
install.packages("tidyverse")
install.packages("ggplot2")
```
## Usage Instructions
1. Open cleaning_visualization.R in RStudio.

2. Run the script step-by-step in the Console.

3. The script will:

  -Load and clean the dataset

  -Fix character encoding and blank fields

  -Calculate total population per facility

  -Identify the top 10 facilities by population

  -Export the cleaned CSV

  -Create and save a PNG visualization (top10_facilities.png)

## Output Files

cleaned_ice_detention.csv->	Cleaned and processed dataset<br>
top10_facilities.png->	Bar chart showing the top 10 detention facilities

## Interpretation
The bar chart shows the top 10 ICE detention facilities ranked by total population. This visualization provides insight into which facilities hold the 
largest number of individuals, supporting transparency and further analysis.
