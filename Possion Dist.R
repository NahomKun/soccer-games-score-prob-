data <- read.csv(file="/Users/olio/Downloads/Soccer Simulation/Soccer Teams Rating - Data.csv", header = TRUE)
head(data)

#Game 1
#Probability of scoring n amount of goals
n <- 0:6
#Arsenal Lambda = 1.355611
Arsenal <-dpois(n, lambda = 1.355700)*100
#Sheffield_Utd Lambda = 1.013155
Sheffield_Utd <-dpois(n, lambda = 1.013155)*100
Game_1 <- data.frame(Arsenal,Sheffield_Utd)
Game_1$Goals <- c(0:6)
Game_1[, c("Goals", "Arsenal" , "Sheffield_Utd")]

#Teams Odds of winning
Arsenal <- rpois(10000,1.355700)
Sheffield_Utd <- rpois(10000,1.013155)
probs_1 <- data.frame(Arsenal= length(which(Arsenal - Sheffield_Utd>0)), Draw= length(which(Arsenal - Sheffield_Utd==0)),
                      Sheffield_Utd= length(which(Arsenal - Sheffield_Utd<0)))
(probs_1/10000)*100

#Game 2
#Probability of scoring n amount of goals
n <- 0:6
#Southampton Lambda = 0.9762576	
Southampton <-dpois(n, lambda = 0.9762576)*100
#Wolves Lambda = 1.2247378
Wolves <-dpois(n, lambda = 1.2247378)*100
Game_2 <- data.frame(Southampton,Wolves)
Game_2$Goals <- c(0:6)
Game_2[, c("Goals", "Southampton" , "Wolves")]

#Teams Odds of winning
Southampton <- rpois(10000,0.9762576)
Wolves <- rpois(10000,1.2247378)
probs_2 <- data.frame(Southampton= length(which(Southampton - Wolves>0)), Draw= length(which(Southampton - Wolves==0)),
                      Wolves= length(which(Southampton - Wolves<0)))
(probs_2/10000)*100

#Game 3
#Probability of scoring n amount of goals
n <- 0:6
#Burnley Lambda = 1.2490505
Burnley <-dpois(n, lambda = 1.2490505)*100
#Leicester Lambda = 1.9454542
Leicester <-dpois(n, lambda = 1.9454542)*100
Game_3 <- data.frame(Burnley,Leicester)
Game_3$Goals <- c(0:6)
Game_3[, c("Goals", "Burnley" , "Leicester")]

#Teams Odds of winning
Burnley <- rpois(10000,1.2490505)
Leicester <- rpois(10000,1.9454542)
probs_3 <- data.frame(Burnley= length(which(Burnley - Leicester>0)), Draw= length(which(Burnley - Leicester==0)),
                      Leicester= length(which(Burnley - Leicester<0)))
(probs_3/10000)*100


#Game 4
#Probability of scoring n amount of goals
n <- 0:6
#Liverpool Lambda = 1.7041080
Liverpool <-dpois(n, lambda = 1.7041080)*100
#Man_Utd Lambda = 1.64842493574
Man_Utd <-dpois(n, lambda = 1.64842493574)*100
Game_4 <- data.frame(Liverpool,Man_Utd)
Game_4$Goals <- c(0:6)
Game_4[, c("Goals", "Liverpool" , "Man_Utd")]

#Teams Odds of winning
Liverpool_Prob <- rpois(10000,1.7041080)
Man_Utd_Prob <- rpois(10000,1.64842493574)
probs_4 <- data.frame(Liverpool= length(which(Liverpool_Prob - Man_Utd_Prob>0)), Draw= length(which(Liverpool_Prob - Man_Utd_Prob==0)),
                    Man_Utd= length(which(Liverpool_Prob - Man_Utd_Prob<0)))
(probs_4/10000)*100

#probability of Arsenal and Sheffield_Utd scoring 4 or less goals  
#Arsenal_4<- ppois(4, lambda = 1.355611, lower = FALSE)*100
#Sheffield_Utd_4 <- ppois(4, lambda = 1.013155, lower = FALSE)*100
#data.frame(Arsenal_4,Sheffield_Utd_4)
