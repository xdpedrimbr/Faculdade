#EQUIPE:
#Andre Luiz Morais Peres de Quinta - 11821BCC003
#Giullia Rodrigues de Menezes - 11621BCC016
#Lais Saloum Deghaide - 11821BCC001
#Vinicius Calixto Rocha - 11911BCC039

#################################################
#Questao 1

bernoulli <- function(n) {
  x <- c()                #vetor que receberá o resultado a cada rodada
  
  for(i in 1:n){
    u <- runif (1, 0, 1)
    
    if( u < 1/3){         #se o valor que saiu for menor que 1/3, então x=1
      x[i] <- 1
    } 
    else {
      x[i] <- 2
    }
  }
  sum(x == 2) / n
}

bernoulli(100)
bernoulli(1000)
bernoulli(10000)

#################################################
#Questao 2

simu_prob <- function(p){         
  
  # se o somatório de p não for 1, erro, retorna -1  
  if(sum(p)!=1){
    return -1
  }
  
  # sorteio de u[0,1] e inicialização de variáveis
  u <- runif(1,0,1)
  vFDA <- 0
  i <- 1
  
  # apartir de u sorteado a variável vFDA acumula as probabilidades de p até ser maior ou igual à u sorteado
  repeat{
    vFDA <- vFDA + p[i]
    if(u <= vFDA){
      break
    }
    i <- i+1
  }
  
  # a posição do elemento em p ou da VA sorteada que é xi de P(X=xi) é retornada, pois P(X=i)=pi
  return(i)
}

simu_prob(c(0.25,0.60,0.15)) # teste, deve retornar neste caso 1, 2 ou 3


#################################################
#Questao 3

# Funcao para se obter um valor de acordo com a 
# variavel aleatória X
valorX <- function(p) {
  k <- 1
  repeat{
    ehSucesso <- runif(1,0,1)
    if(ehSucesso <= p){
      break
    }
    k <- k + 1
  }
  return (k)
}

# Funcao para se obter um valor de acordo com a 
# variavel aleatoria Y
valorY <- function(p, k) {
  n <- 0
  repeat{
    if(k <= 0){
      break
    }
    ehSucesso <- runif(1,0,1)
    if(ehSucesso <= p){
      k <- k - 1
    }
    n <- n + 1
  }
  return (n)
}

# Usando a funçao getY com 
# p= 4/7 e k= 3, para estimar P(Y >8),
# com Metodo de Monte Carlos.

nExperimentos <- 10000
prob <- 0
for (i in 1:nExperimentos) {
  n <- valorY(4/7, 3)
  if(n > 8){
    prob <- prob + 1
  }
}
prob <- prob / nExperimentos
print(prob)

#################################################
#Questao 4

continua <- function() {
  x <- c()
  for(i in 1:10000) {
    u <- runif(1,0,1)
    x[i] <- ((-1 + sqrt(1 + 8*u)) / 2)
  }
  soma <- sum(x[x < 7]) / 10000
  return(soma)
}

print(continua())

