
# Prepares tidy dataset from Human Activity Recognition Using Smartphones Data Set project

# Usage: x <- run_analysis(WRITE=T)
# function returns a data frame of means of all observational variables by Measure, Subject and Activity
# if WRITE=T is specified, a text file "TidyHARMeans.txt" will also be created in the working directory.

run_analysis <- function(WRITE=F) {

# read in features.txt dataset for use as column names
  Feat = read.table("features.txt", sep=" ", col.names=c("Fnum","Feature"))
  Acodes <- read.table("activity_labels.txt")
  
  
# Read in test and training data, assigning col names from Feat. 
  # Important to use colClasses="numeric" for performance
  
  tesdat = read.table("test//X_test.txt", nrows=3000 , 
                     col.names=Feat$Feature, colClasses="numeric")
  tradat = read.table("train//X_train.txt", nrows=9000 , 
                     col.names=Feat$Feature, colClasses="numeric")
  
  # Add variables for summarizing data by Activity and Subject
  tesSubj <- read.table("test//subject_test.txt")
  tesAct <- read.table("test//y_test.txt")
  tesdat$Subject = tesSubj[,1]
  tesdat$Activity = tesAct[,1]
  
  traSubj <- read.table("train//subject_train.txt")
  traAct <- read.table("train//y_train.txt")
  tradat$Subject = traSubj[,1]
  tradat$Activity = traAct[,1]
  
  # Combine the two datasets "vertically"
  alldat <- rbind(tesdat,tradat)
  
  # Cut down alldat to just variables of interest by defining vector goodCols
  goodCols = c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,
               266:271,345:350,424:429,503,504,516,517,529,530,542,543,562,563)
  
  
  td1 <- alldat[,goodCols]

#Next task: summarize (i.e., means) the data by Activity, Subject and Measure
# Measures are the observed means and std deviations measurement variables)

library(reshape2)

m1 = melt(td1,id=c(67,68),measure.vars=c(1:66))

# Now used aggregate() function to compute means for all combinations  ...

ag = aggregate(m1, by=list(m1$Subject,m1$Activity,m1$variable), FUN="mean")

# And clean up (eliminate superflous variables and prettify Names)

ag <- ag[,c(3,4,5,7)]
names(ag)[1] = "Measure"
names(ag)[4] = "Arithmetic Mean"

# and finally, if WRITE=T, write out the data frame as a txt file

if (WRITE) {x = write.table(ag, "TidyHARMeans.txt", row.names=F)}

return(ag)

