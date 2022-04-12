#Gabriel Ribeiro Bernardi - 11821BCC036
#Hendrik Abdalla Hermann - 11911BCC034
#Marillia Soares Rodrigues - 11821BCC020
#Pedro Henrique Goncalves Teixeira - 11821BCC008

dezMil <- 10000
cemMil <- 100000

#Exercicio 1:
dado <- sample(x = 1:6, size = dezMil, replace = TRUE)
dado2 <- sample(x = 1:6, size = dezMil, replace = TRUE)

sucesso <- c()
for(i in 1:dezMil){
  if(dado[i] + dado2[i] == 7 || dado[i] + dado2[i] == 11){
    sucesso[i] <- 1
  }else{
    sucesso[i] <- 0
  }
}

probabilidade <- sum(sucesso) / dezMil
probabilidade

#Exercicio 6
sucesso <- 0
fracasso <- 0

caminho <- function(l){
  linicial <- l
  for(i in 1:10000){
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
  probFracasso
}
caminho(10)

