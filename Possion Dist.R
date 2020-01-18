data <- read.csv("/Soccer Simulation/Soccer Teams Rating - Data.csv", header = TRUE)
head(data)

n <- 0:6
#Arsenal Lambda = 1.355611
Arsenal <-dpois(n, lambda = 1.355700)*100
#odds <- ppois(n, lambda = 1.355611, lower = FALSE)*100
Sheffield_Utd <-dpois(n, lambda = 1.013155)*100

data.frame(Arsenal,Sheffield_Utd)
