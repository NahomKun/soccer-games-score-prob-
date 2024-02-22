library(rvest)
library(dplyr)
library(janitor)

eplhome <-read_html("https://www.soccerstats.com/formtable.asp?league=england") %>% html_nodes("table") %>%
  .[[17]] %>%
  html_table()
eplhome$X1 <- as.character(eplhome$X1)
eplhome[1,1] <- "Position"
eplhome[1,2] <- "Team"
eplhome<- row_to_names(eplhome,1)
eplhome<-eplhome[,-c(11,12)]
eplhome[,c(3:10)] <- lapply(eplhome[,c(3:10)], as.numeric)
eplhome<- eplhome%>%mutate(GFper=GF/GP, GAper= GA/GP, AttStr=GFper/(mean(GFper)), DefStr=GAper/(mean(GAper)))

eplaway <-read_html("https://www.soccerstats.com/formtable.asp?league=england") %>% html_nodes("table") %>%
  .[[19]] %>%
  html_table()
eplaway$X1 <- as.character(eplaway$X1)
eplaway[1,1] <- "Position"
eplaway[1,2] <- "Team"
eplaway<- row_to_names(eplaway,1)
eplaway<-eplaway[,-c(11,12)]
eplaway[,c(3:10)] <- lapply(eplaway[,c(3:10)], as.numeric)
eplaway<- eplaway%>%mutate(GFper=GF/GP, GAper= GA/GP, AttStr=GFper/(mean(GFper)), DefStr=GAper/(mean(GAper)))


itlhome <-read_html("https://www.soccerstats.com/formtable.asp?league=italy") %>% html_nodes("table") %>%
  .[[17]] %>%
  html_table()
itlhome$X1 <- as.character(itlhome$X1)
itlhome[1,1] <- "Position"
itlhome[1,2] <- "Team"
itlhome<- row_to_names(itlhome,1)
itlhome<-itlhome[,-c(11,12)]
itlhome[,c(3:10)] <- lapply(itlhome[,c(3:10)], as.numeric)
itlhome<- itlhome%>%mutate(GFper=GF/GP, GAper= GA/GP, AttStr=GFper/(mean(GFper)), DefStr=GAper/(mean(GAper)))

itlaway <-read_html("https://www.soccerstats.com/formtable.asp?league=italy") %>% html_nodes("table") %>%
  .[[19]] %>%
  html_table()
itlaway$X1 <- as.character(itlaway$X1)
itlaway[1,1] <- "Position"
itlaway[1,2] <- "Team"
itlaway<- row_to_names(itlaway,1)
itlaway<-itlaway[,-c(11,12)]
itlaway[,c(3:10)] <- lapply(itlaway[,c(3:10)], as.numeric)
itlaway<- itlaway%>%mutate(GFper=GF/GP, GAper= GA/GP, AttStr=GFper/(mean(GFper)), DefStr=GAper/(mean(GAper)))

# Function to calculate lambdas
calculate_lambdas <- function(home_team, away_team, home_table, away_table) {
  
  # Extract relevant information for the home team
  home_info <- home_table %>% filter(Team == home_team) 
  home_AttStr <- home_info$AttStr
  home_DefStr <- home_info$DefStr
  home_league_avg <- mean(home_table$GFper)
  
  # Extract relevant information for the away team
  away_info <- away_table %>% filter(Team == away_team)
  away_AttStr <- away_info$AttStr
  away_DefStr <- away_info$DefStr
  away_league_avg <- mean(away_table$GFper)
  
  # Example: Replace this with your desired calculation
  lambda_home <- home_AttStr * away_DefStr * home_league_avg
  lambda_away <- away_AttStr * home_DefStr * away_league_avg
  
  return(list(lambda_home = lambda_home, lambda_away = lambda_away))
}

# Example: Calculate lambdas for given home and away teams
home_team <- "Liverpool"
away_team <- "Luton Town"
lambdas <- calculate_lambdas(home_team, away_team, eplhome, eplaway)
print(lambdas$lambda_home)
print(lambdas$lambda_away)


# Example: Calculate lambdas for given home and away teams
home_team <- "Torino"
away_team <- "Lazio"
lambdas <- calculate_lambdas(home_team, away_team, itlhome, itlaway)
print(lambdas$lambda_home)
print(lambdas$lambda_away)
