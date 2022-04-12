#####################
#Questao 1
library ( dslabs )
data ( heights )
heights <- read.csv("heights.csv", header = TRUE)
#a 
heights$alt.cm = heights$height*2.54
heights

#b
homem <- 0
mulher <- 0
for(i in 1:length(heights$sex)){
  if(heights$sex[i] == "Male"){
    homem <- homem + 1
  }else{
    mulher <- mulher + 1
  }
}
proporcao <- homem / length(heights$sex)
proporcao

#c
primeiraPosAltura <- heights$alt.cm[1]
i <- 1
for(i in 1:length(heights$sex)){
  if(heights$alt.cm[i] > primeiraPosAltura){
    primeiraPosAltura <- heights$alt.cm[i]
  }
}
i
primeiraPosAltura
heights$sex[i]

#d
primeiraPosAltura <- heights$alt.cm[1]
i <- 1
for(i in 1:length(heights$sex)){
  if(heights$alt.cm[i] < primeiraPosAltura){
    primeiraPosAltura <- heights$alt.cm[i]
  }
}
i
primeiraPosAltura
heights$sex[i]

#e
mediaAlturas <- mean(heights$alt.cm)
mediaAlturas

desvioPadrao <- sd(heights$alt.cm)
desvioPadrao

#f
dataHomens <- heights[heights$sex == "Male",]
dataMulheres <- heights[heights$sex == "Female",]

mediaHomens <- mean(dataHomens$alt.cm)
mediaHomens

mediaMulheres <- mean(dataMulheres$alt.cm)
mediaMulheres


desvioPadraoHomens <- sd(dataHomens$alt.cm)
desvioPadraoHomens

desvioPadraoMulheres <- sd(dataMulheres$alt.cm)
desvioPadraoMulheres

#g
boxplot(dataHomens$alt.cm)
boxplot(dataMulheres$alt.cm)

######################
#Questao 2
jorelGanhar <- 0

jorel <- 7
juju <- 18

moeda <- sample(x = 0:1, size = 10000, replace = TRUE) #cara = 1 e coroa = 1
for(i in 1:10000){
  while(juju != 0 || jorel != 0){
    if(moeda[i] == 1){
      juju <- juju + 1
      jorel <- jorel - 1
    }else if(moeda[i] == 0){
      jorel <- jorel + 1
      juju <- juju - 1
    }
    if(juju == 0){
      jorel <- 7
      juju <- 18
      jorelGanhar <- jorelGanhar + 1
      break
    }else if(jorel == 0){
      jorel <- 7
      juju <- 18
      break
    }
  }
}

probabilidade <- jorelGanhar / 10000
probabilidade

###########################
#Questao 3
#a
gerador <- function(n){
  variavel <- c()
  
  distribuicao <- runif(1, min=0, max=1)
  
  if(distribuicao <= 1/6){
    variavel[i] <- 1
  }else if(distribuicao <= 2/6){
    variavel[i] <- 2
  }else if(distribuicao <= 3/6){
    variavel[i] <- 3
  }else if(distribuicao <= 4/6){
    variavel[i] <- 4
  }else if(distribuicao <= 5/6){
    variavel[i] <- 5
  }else if(distribuicao <= 1){
    variavel[i] <- 6
  }
  return(variavel)
}

#b


















