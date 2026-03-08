# -----------------------------------------
# Homework 6
# Syed Abu Hasnat
# -----------------------------------------

# ------------------------------------------------------
# Question 1 - Count properties worth $1,000,000 or more
# ------------------------------------------------------

# Storing the URL of the dataset
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# Downloading the dataset from the internet
# The file will be saved to the working directory as "housing.csv"
download.file(url1, destfile = "housing.csv", method = "curl")

# Loading the dataset
housing <- read.csv("housing.csv")

# VAL represents the property value category of a house
# According to the data dictionary:
# VAL = 24 represents properties valued at $1,000,000 or more

# Identifying houses worth $1,000,000 or more
million_dollar <- sum(housing$VAL >= 24, na.rm = TRUE)

# Printing the result
# This will show the total number of houses worth $1,000,000 or more
million_dollar


# -------------------------------------------------
# Question 2
# Read specific rows and columns from an Excel file
# and calculate the sum of Zip * Ext
# -------------------------------------------------

# Installing the package 
install.packages("readxl")

# Loading the package
library(readxl)

# Downloading the Excel dataset from the provided URL
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url2, destfile = "NGAP.xlsx", mode = "wb")

# Reading specific rows and columns from the Excel file
dat <- read_excel("NGAP.xlsx", skip = 17, n_max = 6)[,7:15]

# Calculating the required result
# Multiplying the Zip column by the Ext column
# sum() adds all the products together
# na.rm = TRUE removes missing values during calculation
result <- sum(dat$Zip * dat$Ext, na.rm = TRUE)

# Printing the result
# The result is the sum of the product of Zip and Ext values
result


# ------------------------------------------------
# Question 3: Count restaurants with zipcode 21231
# ------------------------------------------------

# Installing and loading the XML package
install.packages("XML")
library(XML)

# Downloading the XML file from the provided URL
url3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(url3, destfile = "restaurants.xml")

# Parsing the XML file
# Now parsing the file into an XML tree structure
doc <- xmlTreeParse("restaurants.xml", useInternalNodes = TRUE)

# Accessing the root node of the XML document
rootNode <- xmlRoot(doc)

# Extracting all 'zipcode' nodes using an XPath query
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)

# Counting how many restaurants have zipcode equal to "21231"
# Sum the number of occurrences where the zipcode matches "21231"
sum(zipcodes == "21231")
