#Gabriel Ribeiro Bernardi - 11821BCC036
#Hendrik Abdalla Hermann - 11911BCC034
#Marillia Soares Rodrigues - 11821BCC020
#Pedro Henrique Goncalves Teixeira - 11821BCC008

sbi <- read.csv("./SBI.csv", header = TRUE)
#install.packages("rpart")
#install.packages("rpart.plot")
#install.packages("tree")
library(rpart)
library(rpart.plot)
library(tree)


#letra a)
infection <- c()
for(i in 1:nrow(sbi)){
  if(sbi$sbi[i] == 'NotApplicable'){
    infection[i] = 'no'
  }
  else{
    infection[i] = 'yes'
  }
}

infection <- as.factor(infection)
sbi <- cbind(sbi, infection)

#letra b)
sbi$X <- NULL
sbi$id <-NULL
sbi$sbi <- NULL

#letra c)
nLinhas <- sample(1:nrow(sbi))
sbi <- sbi[nLinhas,]
valoresTreino <- sample(1:nrow(sbi), nrow(sbi)*80/100, replace=F)
valoresTeste <- !(1:nrow(sbi) %in% valoresTreino) #valores que nao estao no valoresTreino
treino <- sbi[valoresTreino,]
teste <- sbi[valoresTeste,]

#letra d)
arvoreDecisao <- rpart(infection~., data = treino)
rpart.plot(arvoreDecisao)

predicao = predict(arvoreDecisao, newdata = teste[,-8], type = "class")
table(predicao, teste$infection)

#letra e)
library(randomForest)
infeccao <- randomForest(infection~., data = treino)

predicao <- predict(infeccao, newdata = teste)
table(previsao, teste$infection)



