

install.packages("jpeg")
dir.create("data")
getwd()
setwd("C:\\DataScinceTrack\\data-cleaning\\HW\\data")
library(RCurl)
URL <- "https://d396qusza40orc.cloudfront.ne\\getdata%2Fdata%2Fss06hid.csv"
download.file(URL, destfile = "dd.csv", method="curl")
 d<-read.csv("dd.csv")
 str(d)
 strsplit( names(d), "wgtp")
 varNamesSplit <- strsplit(names(d), "wgtp")
 varNamesSplit[[123]]
 dim(data)
head(data)
str(data)

d<-read.csv("fdg.csv")
names(d)
d<- data.table(read.csv("fdg.csv", skip = 4, nrows = 215, stringsAsFactors = FALSE))
d <- d[X != ""]
 
d <- d[, list(X, X.1, X.3, X.4)]
setnames(d, c("X", "X.1" ,"X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))
d<- as.numeric(gsub(",", "", d$gdp ))
mean(  d   , na.rm = TRUE)

d[grepl("^United", d$Long.Name)]

 
library(quantmod)
 
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

str(amzn)
names(amzn)

t<- table(year(sampleTimes), weekdays(sampleTimes) )
sum( t[5,] )

library(data.table)
dt <- data.table(data)
head(dt)
agricultureLogical <- dt$ACR == 3 & dt$AGS == 6
which(agricultureLogical)[1:3]
########

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
f <- file.path(getwd(), "jeff.jpg")
download.file(url, f, mode = "wb")

library(jpeg)
img <- readJPEG(f, native = TRUE)
quantile(img, probs = c(0.3, 0.8))

 
 
GDP <- data.table(read.csv("GDP.csv", skip = 4, nrows = 191))
GDP <- GDP[X != ""]
GDP <- GDP[, list(X, X.1, X.3, X.4)]
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "GDP"))

 
EDSTATS <- data.table(read.csv("EDSTATS_Country.csv"))

data2 <- merge(GDP, EDSTATS, all = TRUE, by = c("CountryCode"))

sum(!is.na(unique(data2$rankingGDP)))

data2[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y, rankingGDP, GDP)][13]


data2[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]

#QUESTION4
#What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group? 

data2[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]



breaks <- quantile(data2$rankingGDP, probs = seq(0, 1, 0.2), na.rm = TRUE)
data2$quantileGDP <- cut(data2$rankingGDP, breaks = breaks)
data2[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]


