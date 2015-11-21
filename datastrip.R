# data source
# http://www.hscic.gov.uk/catalogue/PUB16988/Obes-phys-acti-diet-eng-2015-tab.csv
# retrieved 17/11/2015
# info
# https://data.gov.uk/dataset/statistics_on_obesity_physical_activity_and_diet_england


#setwd("r programming/data products/project")
datfile <- "data/Obes-phys-acti-diet-eng-2015-tab.csv"
data <- read.csv(datfile, header = FALSE, stringsAsFactors = F )

# format is horrendous, will need to strip out relevant data tables

# grab wanted columns
# coerce variables to numeric
# set column names
# clean up year characters

#7.1
yeartotals <- data[34:44, c(1,3:6)]
yeartotals[,2:5] <- sapply(yeartotals[,2:5],as.numeric) 
colnames(yeartotals) <- data[32,c(1,3:6)]
yeartotals[,1] <- gsub("[5]","",yeartotals[,1],fixed=T)
yeartotals[,1] <- gsub("[6]","",yeartotals[,1],fixed=T)

#7.2
totalsbyage <- data[66:76, c(1,3:12)]
totalsbyage[,2:11] <- sapply(totalsbyage[,2:11],as.numeric)
colnames(totalsbyage) <- data[64, c(1,3:12)]
totalsbyage[,1] <- gsub("[5]","",totalsbyage[,1],fixed=T)
totalsbyage[,1] <- gsub("[6]","",totalsbyage[,1],fixed=T)

#7.5
secyeartotals <- data[593:603,c(1,3:6)]
secyeartotals[,2:5] <- sapply(secyeartotals[,2:5],as.numeric)
colnames(secyeartotals) <- data[591,c(1,3:6)]
secyeartotals[,1] <- gsub("[5]","",secyeartotals[,1],fixed=T)
secyeartotals[,1] <- gsub("[6]","",secyeartotals[,1],fixed=T)

#7.6
sectotalsbyage <- data[625:635,c(1,3:12)]
sectotalsbyage[,2:11] <- sapply(sectotalsbyage[,2:11],as.numeric)
colnames(sectotalsbyage) <- data[623,c(1,3:12)]
sectotalsbyage[,1] <- gsub("[5]","",sectotalsbyage[,1],fixed=T)
sectotalsbyage[,1] <- gsub("[6]","",sectotalsbyage[,1],fixed=T)

#7.9
surgerytotals <- data[1152:1162,3:7]
surgerytotals[,2:5] <- sapply(surgerytotals[,2:5],as.numeric)
colnames(surgerytotals) <- data[1150,3:7]
surgerytotals[,1] <- gsub("[6]","",surgerytotals[,1],fixed=T)
surgerytotals[,1] <- gsub("[8]","",surgerytotals[,1],fixed=T)
surgerytotals[,1] <- gsub("[9]","",surgerytotals[,1],fixed=T)
surgerytotals[,1] <- gsub(",","",surgerytotals[,1],fixed=T)

#7.10
surgerybyage <- data[1190:1200, 3:13]
surgerybyage[,2:11] <- sapply(surgerybyage[,2:11],as.numeric)
colnames(surgerybyage) <- data[1188,3:13]
surgerybyage[,1] <- gsub("[6]","",surgerybyage[,1],fixed=T)
surgerybyage[,1] <- gsub("[9]","",surgerybyage[,1],fixed=T)
surgerybyage[,1] <- gsub("[10]","",surgerybyage[,1],fixed=T)
surgerybyage[,1] <- gsub(",","",surgerybyage[,1],fixed=T)

# location data later ?
