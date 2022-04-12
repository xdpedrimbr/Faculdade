#Pedro Henrique Goncalves Teixeira - 11821BCC008

#Questao 1
mil <- 1000
cemMil <- 100000
qtdVezes <- c()

for(j in 1:mil){
  urna <- c()
  vetorVerificacao <- c(1:30)
  i <- 1
  while (TRUE){
    urna[i] <- sample(1:30, 1, replace=T)
    i <- i + 1
    valores <- (vetorVerificacao %in% urna)
    urna
    if(sum(valores) == 30){
      qtdVezes[j] <- i
      break
    }
  }
}

esperanca <- sum(qtdVezes)/length(qtdVezes)
esperanca

# calculando a P(N <= 40)

valor <- sum(qtdVezes <= 40)
probabilidade <- valor/mil
probabilidade



#Questao 2
#Letra A
aves <- read.table(file = "C:/Users/rober/Desktop/FACULDADE/ESTCOMP/Segunda vez/ProvaSub/aves.txt", header = TRUE, sep = ",")

head(aves)
tail(aves)
str(aves)
summary(aves)

#Letra B
n <- sample(1:nrow(aves))
aves <- aves[n,]

#Letra C
aves_dinamarca <- aves[aves$local == "dinamarca",]
aves_islandia <- aves[aves$local == "islandia",]
aves_noruega <- aves[aves$local == "noruega",]
aves_suecia <- aves[aves$local == "suecia",]

plot(aves_islandia$comprimento_asa, aves_islandia$peso, type = "p", col = "red", xlab = "comprimento asa", ylab = "peso")
plot(aves_dinamarca$comprimento_asa, aves_dinamarca$peso, type = "p", col = "blue", xlab = "comprimento asa", ylab = "peso")
plot(aves_noruega$comprimento_asa, aves_noruega$peso, type = "p", col = "green", xlab = "comprimento asa", ylab = "peso")
plot(aves_suecia$comprimento_asa, aves_suecia$peso, type = "p", col = "yellow", xlab = "comprimento asa", ylab = "peso")

#Letra D
treino <- sample(1:nrow(aves), nrow(aves) * 0.75, replace = FALSE)
teste <- !(1:nrow(aves) %in% treino)

conjunto_treino <- aves[treino,]
conjunto_teste <- aves[teste,]

#Letra E
library(tree)
library(rpart)
library(rpart.plot)
local_aves = rpart(local~., data = conjunto_treino)
rpart.plot(local_aves, extra = 101)
previsao = predict(local_aves, newdata = conjunto_teste, type = "class")

#Letra F
mean(previsao == conjunto_teste$local)
table(conjunto_teste$local, previsao)

#Letra G
aves_dinamarca <- aves[aves$local == "dinamarca",]
aves_islandia <- aves[aves$local == "islandia",]
aves_noruega <- aves[aves$local == "noruega",]
aves_suecia <- aves[aves$local == "suecia",]

r_islandia <- cor(aves_islandia$comprimento_asa, aves_islandia$peso)
r_islandia  #0.9212377

r_dinamarca <- cor(aves_dinamarca$comprimento_asa, aves_dinamarca$peso)
r_dinamarca  #0.9769682

r_noruega <- cor(aves_noruega$comprimento_asa, aves_noruega$peso)
r_noruega  #0.9397292

r_suecia <- cor(aves_suecia$comprimento_asa, aves_suecia$peso)
r_suecia  #0.3195496
#As variaveis sao mais correlacionadas na dinamarca, onde ha menos variedade


#Letra H
lm(comprimento_asa~peso, aves_dinamarca)

#Letra I
#para aves com comprimento de asa de 23cm
asa23 <- (23 - 1.0031) / 0.2332
asa23 #94.32633
#sim é possivel prever o peso da arvore









