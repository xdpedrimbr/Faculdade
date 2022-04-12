#Pedro Henrique Goncalves Teixeira - 11821BCC008

library(rpart)
library(rpart.plot)

#Questao 1
papagaio <- read.table(file = 'C:/Users/rober/Desktop/FACULDADE/ESTCOMP/Segunda vez/Prova 2/papagaio.txt', header = TRUE, sep = ",")

#Letra A
head(papagaio)
tail(papagaio)
str(papagaio)
summary(papagaio)

#Letra B
sorteio <- sample(1:nrow(papagaio))
papagaio <- papagaio[sorteio,]

#Letra C
papagaioArctica <- papagaio[papagaio$especie == "arctica",]
papagaioCorniculata <- papagaio[papagaio$especie == "corniculata",]
papagaioCirrhata <- papagaio[papagaio$especie == "cirrhata",]

#MEDIAS
mediaTamanhoArctica <- mean(papagaioArctica$tamanho)
mediaTamanhoCorniculata <- mean(papagaioCorniculata$tamanho)
mediaTamanhoCirrhata <- mean(papagaioCirrhata$tamanho)

mediaPesoArctica <- mean(papagaioArctica$peso)
mediaPesoCorniculata <- mean(papagaioCorniculata$peso)
mediaPesoCirrhata <- mean(papagaioCirrhata$peso)

mediaEnvergaduraArctica <- mean(papagaioArctica$envergadura)
mediaEnvergaduraCorniculata <- mean(papagaioCorniculata $envergadura)
mediaEnvergaduraCirrhata <- mean(papagaioCirrhata$envergadura)

#DESVIO PADRAO
desvioTamanhoArctica <- sd(papagaioArctica$tamanho)
desvioTamanhoCorniculata <- sd(papagaioCorniculata$tamanho)
desvioTamanhoCirrhata <- sd(papagaioCirrhata$tamanho)

desvioPesoArctica <- sd(papagaioArctica$peso)
desvioPesoCorniculata <- sd(papagaioCorniculata$peso)
desvioPesoCirrhata <- sd(papagaioCirrhata$peso)

desvioEnvergaduraArctica <- sd(papagaioArctica$envergadura)
desvioEnvergaduraCorniculata <- sd(papagaioCorniculata $envergadura)
desvioEnvergaduraCirrhata <- sd(papagaioCirrhata$envergadura)

#BOXPLOT
boxplot(papagaioArctica$peso, papagaioCorniculata$peso, papagaioCirrhata$peso)
#os papagaio Arctica tem menor peso e os cirrhata maior

#Letra D
especie <- as.factor(papagaio$especie)

#Letra E
treino <- sample(1:nrow(papagaio), nrow(papagaio) * 0.8, replace = FALSE)
teste <- !(1:nrow(papagaio) %in% treino)

treinos <- papagaio[treino,]
testes <- papagaio[teste,]

#Letra F

#Letra G


#Questao 2
#Letra A
papagaioArctica <- papagaio[papagaio$especie == "arctica",]
papagaioCorniculata <- papagaio[papagaio$especie == "corniculata",]
papagaioCirrhata <- papagaio[papagaio$especie == "cirrhata",]

#Letra B
rArctica <- cor(papagaioArctica$tamanho, papagaioArctica$peso)
rCorniculata <- cor(papagaioCorniculata$tamanho, papagaioCorniculata$peso)
rCirrhata <- cor(papagaioCirrhata$tamanho, papagaioCirrhata$peso)
#as variaveis mais correlacionadas sao da especie corniculatas

#Letra C
regressaoLinear <- lm(papagaioCorniculata$tamanho ~ papagaioCorniculata$peso)

#Letra D
varTam <- (17.318 - 0.5) / 0.0335
varTam2 <- (17.318 + 0.5) / 0.0335
variacaoTotal <- varTam2 - varTam 
#ha uma variacao de aproximadamente 29 gramas no peso do papagaio

#Letra E



