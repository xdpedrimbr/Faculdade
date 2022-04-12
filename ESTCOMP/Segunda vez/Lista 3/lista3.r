#Gabriel Ribeiro Bernardi - 11821BCC036
#Hendrik Abdalla Hermann - 11911BCC034
#Marillia Soares Rodrigues - 11821BCC020
#Pedro Henrique Goncalves Teixeira - 11821BCC008

mil <- 1000
dezMil <- 10000
cemMil <- 100000
umMilhao <- 1000000


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
dado4 <- sample(x = 1:6, size = dezMil, replace = TRUE)
qtdVermelho <- 0

for(i in 1:dezMil){
  soma <- dado3[i] + dado4[i]
  if(soma < 4){
    #urna 1
    urna1 <- sample(x = 1:3, size = 1, replace = TRUE, prob = c(8/15, 3/15, 4/15))
    if(urna1 == 3){
      qtdVermelho <- qtdVermelho + 1
    }
  }
  if(soma >= 4 && soma < 7){
    #urna 2
    urna2 <- sample(x = 1:3, size = 1, replace = TRUE, prob = c(3/15, 5/15, 7/10))
    if(urna2 == 3){
      qtdVermelho <- qtdVermelho + 1
    }
  }
  if(soma == 7){
    #urna 3
    urna3 <- sample(x = 1:3, size = 1, replace = TRUE, prob = c(4/9, 3/9, 2/9))
    if(urna3 == 3){
      qtdVermelho <- qtdVermelho + 1
    }
  }
  if(soma > 7){
    #urna 4
    urna4 <- sample(x = 1:3, size = 1, replace = TRUE, prob = c(2/11, 1/11, 8/11))
    if(urna4 == 3){
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

sucessos <- 0
for(i in 1:dezMil){
  dado73 <- sample(x=1:6, size=1, replace = TRUE)
  dado74 <- sample(x=1:6, size=1, replace = TRUE)
  soma <- dado73 + dado74
  
  if(soma == 7 || soma == 11){
    sucessos <- sucessos + 1
  }
}
sucessos/dezMil

#Exercicio 4
jimHalpert <- c(0,1,0)
dwightKSchrute <- c(0,0,1)
vitoria <- 0
perdeu <- 0
count <- 0
seq <- c(0,0,0)
for(i in 1:10000){
  seq <- c(seq, sample(x = 0:1, size = 1, replace = T))
  while(identical(seq,dwightKSchrute) == FALSE){
    if(identical(seq,jimHalpert) == T){
      perdeu <- perdeu + 1
      break
    }
    seq <- c(seq, sample(x = 0:1, size = 1, replace = T))
    seq <- seq[(length(seq)-2):length(seq)]
    count <- count +1
  }
  if(identical(seq,dwightKSchrute) == T){
    vitoria <- vitoria + 1
  }
}

#Exercicio 5

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
sucesso <- 0
fracasso <- 0

caminho <- function(l){
  linicial <- l
  for(i in 1:dezMil){
    repeat{
      anda <- sample(x=c(0,1), size=1, replace = TRUE)
      
      if(anda == 1){
        l <- l + 1
      }else if(anda == 0){
        l <- l - 1
      }
      
      if(l == 0){
        fracasso <- fracasso + 1
        l <- linicial
        break
      }else if(l == 20){
        sucesso <- sucesso + 1
        l <- linicial
        break
      }
    }
  }
  probFracasso <- (fracasso/(fracasso + sucesso))
  return (probFracasso)
  #probFracasso
}
caminho(10)

#Exercicio 7
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


#Exercicio 8
funcao <- function(n){
  y <- 0
  for(i in 1:n){
    sorteio <- sample(x = c(1, 5, 10), size = 1, replace = T, prob = c(1/7, 2/7, 4/7))
    if(sorteio == 5){
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

#Exercicio 9
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


