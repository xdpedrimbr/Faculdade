# Aluna: Giullia Rodrigues de Menezes
# Matr�cula: 11621BCC016

#1
# Foi caculada a inversa da fun��o dada na prova obtendo assim (-50*log(1-u))
# a
questao_1_a <- function(n) {
  x <- c()
  for(i in 1:n) {
    u <- runif(1,0,1)
    x[i] <- (-50*log(1-u))
  }
  print(x)
}

questao_1_a(9)

# b
questao_1_b <- function(n) {
  x <- c()
  for(i in 1:100000) {
    u <- runif(1,0,1)
    x[i] <- (-50*log(1-u))
  }
  soma <- sum(x[x > 6]) / 100000
  return(soma)
}

print(questao_1_b())

# c
questao_1_c <- function(n) {
  x <- c()
  for(i in 1:100000) {
    u <- runif(1,0,1)
    x[i] <- (-50*log(1-u))
  }
  
  soma <- (sum(x[x > 18])/sum(x[x > 12])) / 100000
  
  return(soma)
}

print(questao_1_c())


#2
# para a quest�o a foi criada a fun��o j� incluindo a esperan�a
questao_b <- function(n) {
  x <- c()
  for(k in 1:n){
    soma <- 0
    qtd <- 1
    repeat{
      u <- runif(1, 0, 1)
      soma <- soma + u
      if(soma > 1){
        break
      } else{
        qtd <- qtd + 1
      }
    }
    print(qtd)
    x[k] <- qtd
  }
  print("E[X]:")
  med <- mean(x)
  print(med)
}
b <- questao_b(10000)




# 3
# a
iris <- read.table("iris.txt", sep = ",", header = TRUE)
str(iris)

# b
#m�dia e desvio padr�o do comprimento da p�tala em cada esp�cie
aggregate(comprimento_petala ~ especie, iris, mean,  na.rm = TRUE)
aggregate(comprimento_petala ~ especie, iris, sd,  na.rm = TRUE)

#m�dia e desvio padr�o da largura da p�tala em cada esp�cie
aggregate(largura_petala ~ especie, iris, mean,  na.rm = TRUE)
aggregate(largura_petala ~ especie, iris, sd,  na.rm = TRUE)

#c
plot(iris$largura_petala, iris$comprimento_petala, pch = 16,
     xlab = "Largura da P�tala",
     ylab = "Comprimento da P�tala",
     main = "Largura da P�tala versus Comprimento da P�tala", cex = 1.5)

#d
# foi deletado no arquivo de dados o NA
cor(iris$largura_petala, iris$comprimento_petala)

#e
fit <- lm(iris$comprimento_petala ~ iris$largura_petala)
print(fit)
# com isso a reta ir� ficar y = 2.222 * x + 1.099

#f
y <- 2.222 * 0.5 + 1.099
print(y)
# com a avaria��o agora se tem uma p�tala de comprimento de 2.21 centimetros

#g
# foi deletado no arquivo de dados o NA
cd <- (cor(iris$largura_petala, iris$comprimento_petala)
 * cor(iris$largura_petala, iris$comprimento_petala))
print(cd)
# isso significa o quanto essa minha reta está errada dos meus dados reais

#h
# esse modelo foi construido com base no intervalo de larguras dada no nosso arquivo txt e 2.8cm está fora desse intervalo