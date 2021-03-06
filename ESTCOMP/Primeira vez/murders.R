#matrizes
A <- matrix(data = c(3,2,6,6,7,"a"), ncol = 3, byrow = TRUE) #criando uma matriz
B <- matrix(data = c(31,2,4,6,21,10), ncol = 3, byrow = TRUE)
A*B #multiplica��o elemento por elemento
D <- matrix(data = 1:9, nrow = 3)
E <- A%*%D #multiplica��o usual de matrizes

#data frames
dados <- data.frame(nome = c("pedro", "jos�", "maria"), idade = c(23, 12, 33), peso = c(62, 45, 55))
dados <- rbind(dados, c("mariana", 21, 67))
dados <- cbind(dados, estado = c("mg", "sp", "mg", "go"))

#trabalhando com o conjunto de dados murders
library(dslabs)
data(murders)

#criando uma nova coluna com a taxa de mortes por 100 mil habitantes
murders <- cbind(murders, taxa = 100000*murders$total/murders$population)

#outra maneira de criar uma nova coluna chamada taxa no data frame original
murders$taxa <- 100000*murders$total/murders$population

#a fun��o sort ordena um vetor de maneira crescente
sort(murders$taxa)

#a fun��o max retorna o maior valor de um vetor
max(murders$taxa)

#verificando quais entradas s�o iguais ao valor maximo do vetor taxa
#se TRUE  a entrada tem valor m�ximo
#se FALSE tem valor menor do que valor maximo
maior <- murders$taxa == max(murders$taxa)

#extraindo as informa��es da observa��o que possui a maior taxa
murders[maior,]

#o vetor order retorna os indices dos elementos de um vetor que
#deixam esse vetor ordenado em forma crescente
order(murders$taxa)

#o comando abaixo apresenta o conjunto de dados ordenando as
#oserva��es da menor taxa para a maior taxa
murders[order(murders$taxa),]

