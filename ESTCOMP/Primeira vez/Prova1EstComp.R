dezMil <- 10000
cemMil <- 100000


#Exercicio 1:
estimativaIntegral <- function(a, b){
  x <- runif(cemMil, a, b)
  y <- exp(2*x + x*x)
  
  resultado <- sum(y)/cemMil
  resultado
}

#para a = -1 e b = 2
estimativaIntegral(-1, 2)

##########################################################

#Exercicio 2:
#A)
sorteio <- c()

for(i in 1:dezMil){
  sucesso <- c()
  acertos <- 0
  tentativa <- 0
  
  for(i in 1:20){
    sucesso[i] <- FALSE
  }
  
  check <- function(vetor){
    for(i in 1:20){
      if(vetor[i] == TRUE){
        acertos <- acertos + 1
      }
    }
    return(acertos)
  }
  
  cont <- 0
  
  while(check(sucesso) < 20){
    x <- sample(1:20, 1, replace=TRUE)
    if(sucesso[x] == FALSE){
      sucesso[x] <- TRUE
      cont <- cont + 1
    }
    tentativa <- tentativa + 1
  }
  sorteio <- append(sorteio, tentativa)
}

esp <- mean(tentativa)
minus30 <- 0

for(i in sorteio){
  if(i <= 30){
    minus30 <- minus30 + 1
  }
}

p30 <- minus30/dezMil
p30

#B)
funcao <- function(n){
  sorteio <- c()
  
  for(i in 1:dezMil){
    sucesso <- c()
    acertos <- 0
    tentativa <- 0
    
    for(i in 1:n){
      sucesso[i] <- FALSE
    }
    
    check <- function(vetor){
      for(i in 1:n){
        if(vetor[i] == TRUE){
          acertos <- acertos + 1
        }
      }
      return(acertos)
    }
    
    cont <- 0
    
    while(check(sucesso) < 20){
      x <- sample(1:20, 1, replace=TRUE)
      if(sucesso[x] == FALSE){
        sucesso[x] <- TRUE
        cont <- cont + 1
      }
      tentativa <- tentativa + 1
    }
    sorteio <- append(sorteio, tentativa)
  }
  
  esp <- mean(tentativa)
  minus30 <- 0
  
  for(i in sorteio){
    if(i <= 30){
      minus30 <- minus30 + 1
    }
  }
  
  p30 <- minus30/dezMil
  p30
}

funcao(10)

#########################################################

#Exercicio 3:
#A)
suc <- 0
frac <- 0

caminho <- function(l) {
  for (i in 1:dezMil) {
    passos <- sample(c(1, 0), 1, replace = TRUE)
    
    if(passos == 1){
      l <- l + 1
    }
    if(passos == 0){
      l <- l - 1
    }
    
    if (l == 20) {
      suc <- suc + 1 
    }
    if (l == 0) {
      frac <- frac + 1
    }
    
  }
  totalfrac <- (frac / (frac + suc))
  totalfrac
}
caminho(20)

#B)
grafico <- c()

for(i in 1:19){
  grafico[i] <- caminho(i)
}

plot(grafico)




