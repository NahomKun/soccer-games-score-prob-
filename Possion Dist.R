data <- read.csv("/Soccer Simulation/Soccer Teams Rating - Data.csv", header = TRUE)
head(data)

n <- 0:6
#Arsenal Lambda = 1.355611
Arsenal <-dpois(n, lambda = 1.355700)*100
#Sheffield_Utd Lambda = 1.013155
Sheffield_Utd <-dpois(n, lambda = 1.013155)*100

data.frame(Arsenal,Sheffield_Utd)

#probability of Arsenal and Sheffield_Utd scoring 4 or less goals  
#Arsenal_4<- ppois(4, lambda = 1.355611, lower = FALSE)*100
#Sheffield_Utd_4 <- ppois(4, lambda = 1.013155, lower = FALSE)*100
#data.frame(Arsenal_4,Sheffield_Utd_4)
