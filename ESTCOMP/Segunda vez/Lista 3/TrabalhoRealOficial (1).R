#GRUPO:
#Pedro Henrique Goncalves Teixeira - 11821BCC008
#Antonio Pedro Rodrigues Santos - 11821BCC021
#Gabriel Ribeiro Bernardi - 11821BCC036
#Marillia Soares Rodrigues - 11821BCC020


dezMil <- 10000
cemMil <- 100000


#Exercicio 1
dado1 <- sample(x = 1:6, size=dezMil, replace=TRUE)
dado2 <- sample(x = 1:6, size=dezMil, replace=TRUE)

sucesso1 <- c()
for(i in 1:dezMil){
  if((dado1[i] + dado2[i] == 7) || (dado1[i] + dado2[i] == 11)){
    sucesso1[i] <- 1
  }else{
    sucesso1[i] <- 0
  }
}
probabilidade1 <- sum(sucesso1)/dezMil
probabilidade1


#Exercicio 2
dado3 <- sample(x = 1:6, size = dezMil, replace = TRUE)
qtdVermelho <- 0

for(i in 1:dezMil){
  if(dado3[i] == 5){
    #urna 1
    urna1 <- sample(x = 1:3, size = 1, replace = TRUE, prob = c(6/13, 3/13, 4/13))
    if(urna1 == 3){
      qtdVermelho <- qtdVermelho + 1
    }
  }
  if((dado3[i] == 1) || (dado3[i] == 4) || (dado3[i] = 6)){
    #urna 2
    urna2 <- sample(x = 1:3, size = 1, replace = TRUE, prob = c(3/10, 5/10, 2/10))
    if(urna2 == 3){
      qtdVermelho <- qtdVermelho + 1
    }
  }
  if(dado3[i] == 2 || dado3[i] == 3){
    #urna 3
    urna3 <- sample(x = 1:3, size = 1, replace = TRUE, prob = c(4/8, 2/8, 2/8))
    if(urna3 == 3){
      qtdVermelho <- qtdVermelho + 1
    }
  }
}
probVermelho <- qtdVermelho/dezMil
probVermelho


#Exercicio 3
sucessos <- 0
craps <- c(2, 3, 12)
vitoria <- c(7,11)
for(i in 1:cemMil){
  somaex31 <- sum(sample(x = 1:6, size = 2, replace = TRUE))
  if(any(somaex31 == c(2, 3, 7, 11, 12))){  
    if(any(somaex31 == vitoria)){
      sucessos <- sucessos + 1
    }
  }
  else{
    somaex32 <- sum(sample(x = 1:6, size = 2, replace = TRUE))
    while (somaex32 != somaex31 & somaex32 != 7){
      somaex32 <- sum(sample(x = 1:6, size = 2, replace = TRUE))
    }
    if(any(somaex32 == c(7, somaex31))){
      if(somaex32 == somaex31){
        sucessos <- sucessos + 1
      }
    }
  }
}
sucessos/cemMil


#Exercicio 4
bran <- c(0,1,0)
arya <- c(0,0,1)
vitoria <- 0
perdeu <- 0
count <- 0
seq <- c(0,0,0)
for(i in 1:10000){
  seq <- c(seq, sample(x = 0:1, size = 1, replace = T))
  while(identical(seq,arya) == FALSE){
    if(identical(seq,bran) == T){
      perdeu <- perdeu + 1
      break
    }
    seq <- c(seq, sample(x = 0:1, size = 1, replace = T))
    seq <- seq[(length(seq)-2):length(seq)]
    count <- count +1
  }
  if(identical(seq,arya) == T){
    vitoria <- vitoria + 1
  }
}


#Exercicio 5
#A) Concordo, porque para cada jogada feita, para desfaze-la, 
#sera contabilizada mais uma, dessa forma sempre tera um numero par de 
#jogadas para chegar ao destino

#B 
#para 4 passos:
caminho <- 0
qtdPassos <-0
for(i in 1:10000){
  prob <- sample(x = 0:1, size = 4, replace = TRUE)
  if(any(prob == 0)){
    caminho <- caminho - 1
  }
  if(any(prob == 1)){
    caminho <- caminho + 1
  }
  if(any(caminho == 0)){
    qtdPassos <- qtdPassos + 1
  }
}  
qtdPassos/dezMil

#para 6 passos:
caminho2 <- 0
qtdPassos2 <-0
for(i in 1:10000){
  moeda <- sample(x = 0:1, size = 6, replace = TRUE)
  if(any(moeda == 0)){
    caminho2 <- caminho2 - 1
  }
  if(any(moeda == 1)){
    caminho2 <- caminho2 + 1
  }
  if(any(caminho2 == 0)){
    qtdPassos2 <- qtdPassos2 + 1
  }
}  
qtdPassos2/dezMil

#para 8 passos:
caminho3 <- 0
qtdPassos3 <-0
for(i in 1:10000){
  moeda <- sample(x = 0:1, size = 10, replace = TRUE)
  if(any(moeda == 0)){
    caminho3 <- caminho3 - 1
  }
  if(any(moeda == 1)){
    caminho3 <- caminho3 + 1
  }
  if(any(caminho3 == 0)){
    qtdPassos3 <- qtdPassos3 + 1
  }
}  
qtdPassos3/dezMil


#Exercicio 6
#A)
x <- runif(dezMil ,-1, 2)
y <- runif(dezMil, 0, (1/sqrt(2*pi)))
integral1 <- y <= (1/sqrt(2*pi))*exp(-(x^2)/2)
p <- mean(integral1)
p

#B)
x <- runif(100000 ,0, pi)
y <- runif(100000, 0, 1)
integral2 <- y <= (cos(x)^2)
p <- mean(integral2)
p


#Exercicio 7
funcao <- function(n){
  y <- 0
  for(i in 1:n){
    sorteio <- sample(x = 1:2, size = 1, replace = T, prob = c(1/3, 2/3))
    if(sorteio == 2){
      y <- y + 1
    }
  }
  y/n
}
#para n = 100:
funcao(100)
#para n = 1000:
funcao(1000)
#para n = 10000;
funcao(10000)


#Exercio 8
funcao <- function(p, k){
  estimativa <- 0
  for(i in 1:10000){
    moeda <- sample(x = 0:1, size = k, replace = T, prob = c(1-p, p))
    while(i){
      if(sum(moeda) == k){
        y <- length(moeda)
        break
      }
      else{
        moeda <- c(moeda, sample(x = 0:1, size = 1, replace = T, prob = c(1-p, p)))
      }
    }
    if(y > 8){
      estimativa <- estimativa + 1
    }
  }
  estimativa/dezMil
}
#para p = 4/7 e k = 3:
funcao(4/7, 3)


#Exercico 9
funcao <- function(n){
  y <- 0
  somaex9 <- 0
  for(i in 1:n){
    x <- runif(1 ,0, 1)
    formula <- (x^2 + x)/2
    if(formula < 0.7){
      y <- y + 1
    }
    somaex9 <- somaex9 + formula
  }
  estimativa <- y/n
  esperanca <- somaex9/n
  return(estimativa)
}
#para n = 10000
funcao(10000)