#Grupo:
#Antônio Pedro Rodrigues Santos
#Gabriel Ribeiro Bernardi
#Maríllia Soares Rodrigues
#Pedro Henrique Gonçalves Teixeira

#Exercicio 1. a)
vetor1 <- c(1:20)
vetor1

#Exercicio 1. b)
vetor2 <- c(20:1)
vetor2

#Exercicio 1. c)
#vetor3 <- c(seq(from=1, to=20, by=1), seq(from=19, to=1, by=-1))
vetor3 <- c()
contador1 <- 1
for(i in 1:20){
  vetor3[i] <- i
  contador1 <- contador1 + 1
}
for(i in 20:1){
  vetor3[contador1] <- i
  contador1 <- contador1 + 1
}
vetor3

#Exercicio 1. d)
vetor4 <- c()
constante1 <- 0.1
constante2 <- 0.2
valor1 <- 3
valor2 <- 1
contador2 <- 1
while(valor1 <= 36 && valor2 <= 34){
  vetor4[contador2] <- ((constante1 ** valor1) * (constante2 ** valor2))
  valor1 <- valor1 + 3
  valor2 <- valor2 + 3
  contador2 <- contador2 + 1
}
vetor4

#Exercicio 1. e)
rep(c(4,6,3), each = 1, times = 10)

#exercicio 1. f)
rep(c(4,6,3), each = 1, len = 31)

#Exercicio 2.
vetorPontos <- c()
contador3 <- 1
valor3 <- 3
while(valor3 <= 6){                   #Gerando vetor de pontos
  vetorPontos[contador3] <- valor3
  valor3 <- valor3 + 0.1
  contador3 <- contador3 + 1
}
vetor5 <- c()
for(i in 1:length(vetorPontos)){
  vetor5[i] <- (exp(1) ** vetorPontos[i]) * (cos(vetorPontos[i]))
}
vetor5

#Exercicio 3. a)
vetor6 <- c()
contador4 <- 1
for(i in 10:100){
  vetor6[contador4] <- ((i**3) + (4*(i**2)))
  contador4 <- contador4 + 1
}
somatorioVetor6 <- sum(vetor6)
somatorioVetor6

#Exercicio 3. b)
vetor7 <- c()
contador5 <- 1
for(i in 10:25){
  vetor7[contador5] <- (((2 ** i) / i) + ((3 ** i) / (i ** 2)))
  contador5 <- contador5 + 1
}
somatorioVetor7 <- sum(vetor7)
somatorioVetor7

#Exercicio 4. a)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
vetorImpar <- c()
contador6 <- 1
for(i in xVec){
  if(i %% 2 != 0){
    vetorImpar[contador6] <- i
    contador6 <- contador6 + 1
  }
}
vetorImpar

#Exercicio 4. b)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
vetor8 <- c()
for(i in 2:250){
  vetor8[i-1] <- (yVec[i] - xVec[i-1])
}
vetor8

#Exercicio 4. c)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
valor9 <- c()
for(i in 2:250){
  valor9[i-1] <- (sin(yVec[i])/cos(xVec[i-1]))
}
valor9

#Exercicio 4. d)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
valor10 <- c()
for(i in 3:250){
  valor10[i-2] <- (xVec[i-2] + (2*xVec[i-1]) - xVec[i])
}
valor10

#Exercicio 4. e)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
valor11 <- c()
for(i in 1:249){
  valor11[i] <- (exp(1) ** -xVec[i+1]) / (xVec[i] + 10)
}
somatorioVetor11 <- sum(valor11)
somatorioVetor11

#Exercicio 5. a)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
vetorIndices <- c()
for(i in 1:250){
  if(yVec[i] > 600){
    vetorIndices[length(vetorIndices)+1] <- i
  }
}
vetorIndices

#Exercicio 5. b)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
vetor12 <- c()
for(i in yVec){
  if(i > 600){
    vetor12[length(vetor12) + 1] <- i
  }
}
vetor12

#Exercicio 5. c)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
vetor13 <- c()
for(i in 1:250){
  if(yVec[i] > 600){
    vetor13[length(vetor13)+1] <- xVec[i]
  }
}
vetor13

#Exercicio 5. d)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
vetor14 <- c()
mediaxVec <- mean(xVec)
for(i in 1:250){
  vetor14[i] <- (abs(xVec[i] - mediaxVec))**0.5
}
vetor14

#Exercicio 5. e)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
maxyVec <- max(yVec)
contador7 <- 0
for(i in yVec){
  if((maxyVec - i) < 200){
    contador7 <- contador7 + 1
  }
    print(maxyVec - i)
}
contador7

#Exercicio 5. f)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
contador8 <- 0
for(i in xVec){
  if(i %% 2 == 0){
    contador8 <- contador8 + 1
  }
}
contador8

#Exercicio 5. g)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
indicesOrdenacao <- order(yVec)
xVecOrdenado <- c()
for(i in 1:250){
  xVecOrdenado[i] <- xVec[indicesOrdenacao[i]]
}
xVecOrdenado

#Exercicio 5. h)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
contador9 <- 1
vetor15 <- c()
while(contador9 <= 250){
  vetor15[length(vetor15)+1] <- yVec[contador9]
  contador9 <- contador9 + 3
}
vetor15

#Exercicio 6.
constNum <- 2
constDen <- 3
num <- 2
den <- 3

vetor16 <- list()
vetor16[[1]] <- 1
vetor16[[2]] <- constNum/constDen
vetorTemp <- c()

#preparacao vetores de numeradores e denominadores
contador10 <- 2
contador11 <- 3
contador12 <- 1
vetorNumerador <- c()
vetorDenominador <- c()

while(contador10 <= 38){
  vetorNumerador[contador12] <- contador10
  contador10 <- contador10 + 2
  contador12 <- contador12 + 1
}
contador12 <- 1
contador10 <- 2
contador11 <- 3
while(contador11 <= 39){
  vetorDenominador[contador12] <- contador11
  contador11 <- contador11 + 2
  contador12 <- contador12 + 1
}
contador12 <- 1
for(i in 2:20){
  vetor16[[i]] <- c(seq(from=1, to=length(vetor16[[i-1]]+1)))
  for(j in 1:contador12){
    vetor16[[i]][j] <- vetorNumerador[j]/vetorDenominador[j]
  }
  contador12 <- contador12 + 1
}
resultadoCumProd <- c()
for(i in 1:length(vetor16)-2){
  cumProdTemp <- cumprod(vetor16[[i+2]])
  resultadoCumProd[i] <- cumProdTemp[length(cumProdTemp)-1]
}
somaTemp <- cumsum(resultadoCumProd)
somaFinal <- somaTemp[length(somaTemp)]


#Exercicio 7. a)
library(dslabs)
data(murders)
vetor20 <- murders["population"]
mediaVetor20 <- mean(vetor20[[1]])
mediaVetor20

maior <- vetor20[[1]][1]
menor <- vetor20[[1]][1]
posMaior <- 1
posMenor <- 1
for(i in 2:length(vetor20[[1]])){
  if(i < menor){
    menor <- vetor20[[1]][i]
    posMenor <- i
  }
  if(i > maior){
    maior <- vetor20[[1]][i]
    posMaior <- i
  }
}
estadoMaisPopuloso <- murders[["state"]][posMaior]
estadoMenosPopuloso <- murders[["state"]][posMenor]
estadoMaisPopuloso
estadoMenosPopuloso

#Exercicio 7. b)
library(dslabs)
data(murders)
DEZ_MIL <- 10000
murders <- cbind(murders, fireGunDeaths = (DEZ_MIL*murders$total)/murders$population)
murders

#Exercicio 7. c)
library(dslabs)
data(murders)
dataFrameOrdenado <- murders[order(murders$total),]
dataFrameOrdenado <- murders[sort(murders$total),]
#order imprime o indice da ordenacao
#sort vai enumerar
murders$total
dataFrameOrdenado$state

#Exercicio 7. d)
library(dslabs)
data(murders)
dataFrameOrdenado <- murders[order(murders$total),]
estadoMaiorMortalidade <- dataFrameOrdenado$state[length(dataFrameOrdenado$state)]
estadoMenorMortalidade <- dataFrameOrdenado$state[1]
sprintf("O estado com maior taxa de mortalidade eh: %s", estadoMaiorMortalidade)
sprintf("O estado com menor taxa de mortalidade eh: %s", estadoMenorMortalidade)

#Exercicio 7. e)
library(dslabs)
data(murders)
southStates <- murders[murders$region == "South", ]
westStates <- murders[murders$region == "West", ]
northeastStates <- murders[murders$region == "Northeast", ]
northCentralStates <- murders[murders$region == "North Central", ]

mediaTotalSouth <- mean(southStates$total)
mediaTotalWest <- mean(westStates$total)
mediaTotalNortheast <- mean(northeastStates$total)
mediaTotalNorthCentral <- mean(northCentralStates$total)

desvPadTotalSouth <- sd(southStates$total)
desvPadTotalWest <- sd(westStates$total)
desvPadTotalNortheast <- sd(northeastStates$total)
desvpadTotalNorthCentral <- sd(northCentralStates$total)

##Verifica maior media
if(mediaTotalSouth > mediaTotalWest && mediaTotalSouth > mediaTotalNortheast && mediaTotalSouth > mediaTotalNorthCentral){
  print("South")
}else if(mediaTotalWest > mediaTotalSouth && mediaTotalWest > mediaTotalNortheast && mediaTotalWest > mediaTotalNorthCentral){
  print("West")
}else if(mediaTotalNortheast > mediaTotalSouth && mediaTotalNortheast > mediaTotalWest && mediaTotalNortheast > mediaTotalNorthCentral){
  print("Northeast")
}else if(mediaTotalNorthCentral > mediaTotalSouth && mediaTotalNorthCentral > mediaTotalWest && mediaTotalNorthCentral > mediaTotalNortheast){
  print("North Central")
}else{
  print("Existe regioes com valores maximos iguais de taxa de mortalidade")
}

#Verifica menor media
if(mediaTotalSouth < mediaTotalWest && mediaTotalSouth < mediaTotalNortheast && mediaTotalSouth < mediaTotalNorthCentral){
  print("South")
}else if(mediaTotalWest < mediaTotalSouth && mediaTotalWest < mediaTotalNortheast && mediaTotalWest < mediaTotalNorthCentral){
  print("West")
}else if(mediaTotalNortheast < mediaTotalSouth && mediaTotalNortheast < mediaTotalWest && mediaTotalNortheast < mediaTotalNorthCentral){
  print("Northeast")
}else if(mediaTotalNorthCentral < mediaTotalSouth && mediaTotalNorthCentral < mediaTotalWest && mediaTotalNorthCentral < mediaTotalNortheast){
  print("North Central")
}else{
  print("Existe regioes com valores minimos iguais de taxa de mortalidade")
}

#Exercicio 7. f)
library(dslabs)
data(murders)
boxplot(southStates$total, westStates$total, northeastStates$total, northCentralStates$total, main="Sul, Oeste, Nordeste e Centro Norte", ylab="Número de mortes", xlab="Regiões")
#Os boxplots apresentados referem-se a taxa de morte total nas regiões americanas.
#O primeiro gráfico mostra os dados da região Sul dos EUA. Observa-se que dois estados possuem índices muuito discrepantes na quantidade de assassinatos em relação aos demais estados da região.
#O segundo gráfico mostra dos dados da região Oeste dos EUA. Pode-se observar nele que há um estado que destaca-se bastante dos demais, pois ele está bem acima de um estado que tem índices bem acima da média da região.
#O terceiro boxplot refere-se à região Nordeste do EUA. Nele observa-se que a grande maioria dos estados não apresentam números que destoam muito da média. Nesse gráfico é possível notar a não presença de valores outliers.
#Por fim, o último boxplot refere-se à região Centro Norte Americana. Nele é possível observar que a mediana dos valores de morte é bem baixa, mostrando que a maioria dos estados possuem médias de morte baixas.