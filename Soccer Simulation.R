myData <- read.csv("Downloads/Soccer Simulation/Soccer Teams Rating - Data.csv" , header = TRUE)
head(myData)

homeTeam = 'Arsenal'
awayTeam = 'Sheffield_Utd'

outputHomeTeam = c()
outputAwayTeam = c()
numberOfTimesToRunSim = 10
randomNumber = NULL
countGoalsScoredByHomeTeam = 0
countGoalsScoredByAwayTeam = 0


for (x in 1:numberOfTimesToRunSim) {
  for (i in 1:length(myData$team)) {
    if(myData$team[i]==homeTeam){
      print("The home team Arsenal took the shot")
    }else if (myData$team[i]==awayTeam){
      print("The away team Sheffield_Utd took the shot")
    }
  }
} # end of numberOfTimesToRunSimLoop


