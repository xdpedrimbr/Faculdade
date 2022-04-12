# Aluna: Giullia Rodrigues
# Matrícula: 11621BCC016
# Prova 1 - Parte 2

print("**********************************")
print("Questão 1:")
print("----------------------------------")
print("Questão 1 - a")
# Iniciando minha variável como valor 0
questao_1_a <- 0
a <- 1
b <- 0
x <- b-a
# Gerando cem mil números da distribuição uniforme em [0,1]
y <- runif(100000, 0, 1)
# Aplicando a função h no vetor y
# Vamos guardar esta operção dentro da variável h
h <- ((((1/y)-1)/((1)+(2*((1/y)-1)*((1/y)-1))+(((1/y)-1)*((1/y)-1)*((1/y)-1)*((1/y)-1))))*(((-1)/(y*y))))
# Somando os cem mil valores e divindo a soma por cem mil e guardando em questao_1_a
questao_1_a <- sum(h)/100000
# Mostrando questao_1_a na tela
resposta_final_1_a <- questao_1_a * x
print(resposta_final_1_a)

#######################################
print("----------------------------------")
print("Questão 1 - b")

eixox <- c()
# Gerando sequencia
eixox <- seq(0:1000)
# Aplicando a função h no vetor eixox
# Vamos guardar esta operação dentro da variável y
y <- ((((1/eixox)-1)/((1)+(2*((1/eixox)-1)*((1/eixox)-1))+(((1/eixox)-1)*((1/eixox)-1)*((1/eixox)-1)*((1/eixox)-1))))*(((-1)/(eixox*eixox))))

plot(eixox,y,type="l")
#######################################
print("**********************************")
print("Questão 2:")
print("----------------------------------")
# Coroa = Esquerda = 0
# Cara = Direita = 1

soma <- 0

print("Questão 2 - a")
print("Teórica")
print("----------------------------------")
#
#
#
# Nesse caso vamos considerar os valores que realmente representam cara e coroa. 
#
# Se eu obtenho cara, vou andar uma casa para a direita, ou seja, considerando a reta numérica, vou aumentar uma unidade. Exemplo: Se estou na casa 6 e obtenho cara eu avanço para a casinha 7, pois 6+1=7. Vamos chamar cara de X.
# X = +1
#
# Se eu obtenho coroa, vou andar uma casa para a esquerda, ou seja, considerando a reta numérica, vou diminuir uma unidade. Exemplo: Se estou na casa 6 e obtenho coroa eu volto para a casinha 5, pois 6-1=5. Vamos chamar coroa de Y.
# Y = -1
#
# Sabemos que voltar a origem é: depois de um número de rodadas (R) é parar na casinha 0. Então meu interesse é que depois de obter N vezes cara e M vezes coroa eu volte a casinha 0. (R = M + N)
# M - N = 0 
# Passando o N para o lado direito da minha igualdade, ficamos com:
# M = N (*)
# Como dito acima, o meu número de rodadas (R) vai ser sempre a soma da quantidade de vezes que tirei cara (M) mais a quantidade de vezes que tirei coroa (N), com isso temos :
# R = M + N
# Como obtido anteriormente em (*), eu tenho que M = N.
# Vamos utilizar isso substituindo em R = M + N:
# R = M + M
# Somando meus M's eu tenho que:
# R = 2*M
#
# De acordo com a "Propriedades dos números pares e ímpares":
# Qualquer número par pode ser escrito na forma 2n (2 vezes n). Por exemplo o número 8, que é par e pode ser escrito como 2*4.
# https://mundoeducacao.uol.com.br/matematica/propriedades-dos-numeros-pares-impares.htm
#
# Então por essa propriedade: 2*M vai ser sempre um número par. 
#
# Ou então, eu poderia dizer que para cancelar uma cara eu teria que tirar uma coroa. Pois X + Y = 0.
#
#
#
#######################################
print("Questão 2 - b - i")
# Iniciando meu vetor de sucesso nulo 
sucesso_i <- c()

for(i in 1:100000){
  # Gerando quatro números aleatórios entre 0 e 1 simbolizando os quatro lançamentos da moeda
  moeda <- sample(0:1, size=4, replace=TRUE)
  # Aqui estou somando os valores sorteados
  # Como estou simbolizando cara = +1
  # E coroa = 0
  soma <- sum(moeda)
  # Se a soma for igual a metade dos meus valores eu posso garantir que a quantidade de caras e coroas sorteadas foram iguais
  # 4 = CCKK = 1+1+0+0 
  # Então ele anda duas casas para a direita depois duas para a esquerda voltando para a origem 
  if(soma==2){
    # Chamo de sucesso quando teoricamente volto para a origem
    # Entra no if se soma é igual a 2
    sucesso_i[i] <- 1
  } else{
    # Entra no else quando essa soma é:
    # maior que j/2 -> mais caras que coroas
    # menor que j/2 -> mais coroas que caras
    sucesso_i[i] <- 0
  }
}
# Para obter a probabilidade eu divido a soma de sucesso e divido pela quantidade de testes que eu fiz
resultado <- (sum(sucesso_i)/100000)
# Mostro na tela essa minha probabilidade
print(resultado)
print("----------------------------------")

#######################################
print("Questão 2 - b - ii")

# Iniciando meu vetor de sucesso nulo 
sucesso_ii <- c()

for(i in 1:100000){
  # Gerando seis números aleatórios entre 0 e 1 simbolizando os seis lançamentos da moeda
  moeda <- sample(0:1, size=6, replace=TRUE)
  # Aqui estou somando os valores sorteados
  # Como estou simbolizando cara = +1
  # E coroa = 0
  soma <- sum(moeda)
  # Se a soma for igual a metade dos meus valores eu posso garantir que a quantidade de caras e coroas sorteadas foram iguais
  if(soma==3){
    # Chamo de sucesso quando teoricamente volto para a origem
    # Entra no if se soma é igual a 3
    sucesso_ii[i] <- 1
  } else{
    # Entra no else quando essa soma é:
    # maior que j/2 -> mais caras que coroas
    # menor que j/2 -> mais coroas que caras
    sucesso_ii[i] <- 0
  }
}

# Para obter a probabilidade eu divido a soma de sucesso e divido pela quantidade de testes que eu fiz
resultado <- (sum(sucesso_ii)/100000)
# Mostro na tela essa minha probabilidade
print(resultado)
print("----------------------------------")

#######################################
print("Questão 2 - b - iii")

# Iniciando meu vetor de sucesso nulo 
sucesso_iii <- c()

for(i in 1:100000){
  # Gerando dez números aleatórios entre 0 e 1 simbolizando os dez lançamentos da moeda
  moeda <- sample(0:1, size=10, replace=TRUE)
  # Aqui estou somando os valores sorteados
  # Como estou simbolizando cara = +1
  # E coroa = 0
  soma <- sum(moeda)
  # Se a soma for igual a metade dos meus valores eu posso garantir que a quantidade de caras e coroas sorteadas foram iguais
  if(soma==5){
    # Chamo de sucesso quando teoricamente volto para a origem
    # Entra no if se soma é igual a 5
    sucesso_iii[i] <- 1
  } else{
    # Entra no else quando essa soma é:
    # maior que j/2 -> mais caras que coroas
    # menor que j/2 -> mais coroas que caras
    sucesso_iii[i] <- 0
  }
}

# Para obter a probabilidade eu divido a soma de sucesso e divido pela quantidade de testes que eu fiz
resultado <- (sum(sucesso_iii)/100000)
# Mostro na tela essa minha probabilidade
print(resultado)
print("----------------------------------")

#######################################
print("Questão 2 - b - iv")

# Iniciando meu vetor de sucesso nulo 
sucesso_iv <- c()

for(i in 1:100000){
  # Gerando vinte números aleatórios entre 0 e 1 simbolizando os vinte lançamentos da moeda
  moeda <- sample(0:1, size=20, replace=TRUE)
  # Aqui estou somando os valores sorteados
  # Como estou simbolizando cara = +1
  # E coroa = 0
  soma <- sum(moeda)
  # Se a soma for igual a metade dos meus valores eu posso garantir que a quantidade de caras e coroas sorteadas foram iguais
  if(soma==10){
    # Chamo de sucesso quando teoricamente volto para a origem
    # Entra no if se soma é igual a 10
    sucesso_iv[i] <- 1
  } else{
    # Entra no else quando essa soma é:
    # maior que j/2 -> mais caras que coroas
    # menor que j/2 -> mais coroas que caras
    sucesso_iv[i] <- 0
  }
}

# Para obter a probabilidade eu divido a soma de sucesso e divido pela quantidade de testes que eu fiz
resultado <- (sum(sucesso_iv)/100000)
# Mostro na tela essa minha probabilidade
print(resultado)
print("----------------------------------")

