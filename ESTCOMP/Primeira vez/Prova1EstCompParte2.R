dezMil <- 10000
cemMil <- 100000

#Exercicio 4:
qtdSort <- c()
for(i in 1:dezMil){
  qtdSort[i] <- 2
}

for(i in 1:dezMil){
  soma <- 0
  u <- runif(1, 0, 1)
  soma <- soma + u
  u <- runif(1, 0, 1)
  soma <- soma + u
  
  if(soma <= 1){
    while(soma <= 1){
      u <- runif(1, 0, 1)
      soma <- soma + u
      qtdSort[i] <- qtdSort[i] + 1
    }
  }
}

esp <- mean(qtdSort)

totSort <- 0
i <- 1
while(i <= length(qtdSort)){
  if(qtdSort[i] == 3){
    totSort <- totSort + 1
  }
  i <- i + 1
}

probTot <- totSort/dezMil

esp
probTot

#############################################################################
#Exercicio 5:
#A:
prob <- 0 
for(i in 1:cemMil){
  
  cartas <- sample(1:13, 5, replace=TRUE)
  qtdIgual <- 0 
  nRepete <- 0
  
  for(i in 1:13){
    if(sum(cartas == i) == 2){ 
      qtdIgual <- qtdIgual + 1
      
      for(j in 1:13){
        if(sum(cartas == j) == 1){ 
          nRepete <- nRepete  + 1
        }
      }
    }
  }
  
  if(nRepete + qtdIgual == 4){ 
    prob <- prob + 1
  }
  
}

probTot <- prob/cemMil
probTot

#B:
prob <- 0 
for(i in 1:cemMil){
  
  cartas <- sample(1:13, 5, replace=TRUE)
  qtdIgual <- 0 
  nRepete <- 0
  
  for(i in 1:13){
    if(sum(cartas == i) == 2){ 
      qtdIgual <- qtdIgual + 1
    }
  }
  if(qtdIgual == 2){ 
    prob <- prob + 1
  }
}

probTot <- prob/cemMil
probTot

#C:
prob <- 0 
for(i in 1:cemMil){
  
  cartas <- sample(1:13, 5, replace=TRUE)
  qtdIgual <- 0 
  nRepete <- 0
  
  for(i in 1:13){
    if(sum(cartas == i) == 2){ 
      qtdIgual <- qtdIgual + 1
    }
    if(sum(cartas == i) == 3){ 
      qtdIgual <- qtdIgual + 1
    }
  }
  if(qtdIgual == 2){ 
    prob <- prob + 1
  }
}

probTot <- prob/cemMil
probTot

#D:
prob <- 0 
for(i in 1:cemMil){
  
  cartas <- sample(1:13, 5, replace=TRUE)
  qtdIgual <- 0 
  nRepete <- 0
  
  for(i in 1:13){
    if(sum(cartas == i) == 4){ 
      qtdIgual <- qtdIgual + 1
    }
  }
  if(qtdIgual == 1){ 
    prob <- prob + 1
  }
}

probTot <- prob/cemMil
probTot

















