#ex4:
vet1 <- c()
for(i in 1:10000){
  vet1[i] <- 2
}

for(i in 1:10000){
  s <- 0
  
  u <- runif(1, 0, 1)
  s <- s + u
  
  u <- runif(1, 0, 1)
  s <- s + u
  
  if(s <= 1){
    while(s <= 1){
      u <- runif(1, 0, 1)
      s <- s + u
      vet1[i] <- vet1[i] + 1
    }
  }
}

resultadoesp <- mean(vet1)
tamvet1 <- length(vet1)
sorteio <- 0
i <- 1
while(i <= tamvet1){
  if(vet1[i] == 3){
    sorteio <- sorteio + 1
  }
  i <- i + 1
}

resultado <- sorteio/10000
resultadoesp
resultado


#ex5:
#a:
cartas <- 0 
for(i in 1:100000){
  deck <- sample(1:13, 5, replace=TRUE)
  iguais <- 0 
  diferente <- 0
  for(i in 1:13){
    if(sum(deck == i) == 2){ 
      iguais <- iguais + 1
      
      for(j in 1:13){
        if(sum(deck == j) == 1){ 
          diferente <- diferente  + 1
        }
      }
    }
  }
  
  if(diferente + iguais == 4){ 
    cartas <- cartas + 1
  }
  
}
resultado <- cartas/100000
resultado

#b:
cartas <- 0 
for(i in 1:100000){
  deck <- sample(1:13, 5, replace=TRUE)
  iguais <- 0 
  
  for(i in 1:13){
    if(sum(deck == i) == 2){ 
      iguais <- iguais + 1
    }
  }
  if(iguais == 2){ 
    cartas <- cartas + 1
  }
}
resultado <- cartas/100000
resultado

#c:
cartas <- 0 
for(i in 1:100000){
  deck <- sample(1:13, 5, replace=TRUE)
  iguais <- 0 

  for(i in 1:13){
    if(sum(deck == i) == 2){ 
      iguais <- iguais + 1
    }
    if(sum(deck == i) == 3){ 
      iguais <- iguais + 1
    }
  }
  if(iguais == 2){ 
    cartas <- cartas + 1
  }
}
resultado <- cartas/100000
resultado

#d:
cartas <- 0 
for(i in 1:100000){
  deck <- sample(1:13, 5, replace=TRUE)
  iguais <- 0 
  
  for(i in 1:13){
    if(sum(deck == i) == 4){ 
      iguais <- iguais + 1
    }
  }
  if(iguais == 1){ 
    cartas <- cartas + 1
  }
}
resultado <- cartas/100000
resultado

















