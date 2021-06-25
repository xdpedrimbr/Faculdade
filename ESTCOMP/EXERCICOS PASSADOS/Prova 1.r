# Aluna: Giullia Rodrigues
# Matrícula: 11621BCC016

print("Questão 1:")

print("Questão 1 - a")

# Iniciando minha variável como valor 0
questao_1_a <- 0
# Gerando cem mil números da distribuição uniforme em [0,6]
x <- runif(100000, 0, 6)
# Aplicando a função g no vetor x
# Vamos guardar esta operção dentro da variável g
g <- (x/((1)+(2*x*x)+(x*x*x*x)))
# Somando os cem mil valores e divindo a soma por cem mile guardarndo em questao_1_a
questao_1_a <- sum(g)/100000
# Mostrando questao_1_a na tela
resposta_final_1_a <- questao_1_a * 6
print(resposta_final_1_a)

print("Questão 1 - b")

EstimativaIntegral = function(n) {
  # Iniciando minha variável como valor 0
  questao_1_b <- 0
  # Gerando cem mil númeos da distribuição uniforme em [0,n]
  x <- runif(100000, 0, n)
  # Aplicando a função g no vetor x
  # Vamos guardar esta operção dentro da variável g
  g <- (x/((1)+(2*x*x)+(x*x*x*x)))
  # Somando os cem mil valores e divindo a soma por cem mile guardarndo em questao_1_a
  questao_1_b <- sum(g)/100000
  # Mostrando questao_1_a na tela
  resposta_final_1_b <- questao_1_b * n
  return (resposta_final_1_b)
}
# Chamando a função EstimativaIntegral para n = 6 e guardando em resposta_1_b 
resposta_1_b = EstimativaIntegral(6)
# Mostrando questao_1_b na tela  
print(resposta_1_b)


#######################################
print("Questão 2:")
# Gerando cem mil números entre 1 e 6 para cada um dos dados
dado1 <- sample(1:6, size=100000, replace=TRUE)
dado2 <- sample(1:6, size=100000, replace=TRUE)
dado3 <- sample(1:6, size=100000, replace=TRUE)
dado4 <- sample(1:6, size=100000, replace=TRUE)
dado5 <- sample(1:6, size=100000, replace=TRUE)

print("Questão 2 - a")
sucesso_a <- c() 

for(i in 1:100000){
  if((dado1[i]==2)||(dado2[i]==2)||(dado3[i]==2)||(dado4[i]==2)||(dado5[i]==2)){
    # Chamo de sucesso quando algum dos meus dados assumem o valor 2
    # Entra no if se algum dos meus valores são 2
    sucesso_a[i] <- 1 
  } else{
    # Entra no else se nenhum dos meus valores são 2
    sucesso_a[i] <- 0
  }
}
a <- 0
# Para obter a probabilidade eu divido a soma de sucesso e divido pela quantidade de testes que eu fiz
a <- sum(sucesso_a)/100000
# Mostro na tela essa minha probabilidade
print(a)
#######################################
print("Questão 2 - b")
sucesso_b <- c() 

for(i in 1:100000){
  if((dado1[i] + dado2[i] + dado3[i] + dado4[i] + dado5[i])==14){
    # Chamo de sucesso quando a soma dos meus dados assumem o valor 14
    # Entra no if se a soma dos meus valores for 14
    sucesso_b[i] <- 1 
  } else{
    # Entra no else se a soma dos meus valores for diferente de 14
    sucesso_b[i] <- 0
  }
}
b <- 0
# Para obter a probabilidade eu divido a soma de sucesso e divido pela quantidade de testes que eu fiz
b <- sum(sucesso_b)/100000
# Mostro na tela essa minha probabilidade
print(b)
#######################################
print("Questão 2 - c")
sucesso_c <- c() 

for(i in 1:100000){
  if(((dado1[i]!=dado2[i])&&(dado1[i]!=dado3[i])&&(dado1[i]!=dado4[i])&&(dado1[i]!=dado5[i]))&&((dado2[i]!=dado3[i])&&(dado2[i]!=dado4[i])&&(dado2[i]!=dado5[i]))&&((dado3[i]!=dado4[i])&&(dado3[i]!=dado5[i]))&&((dado4[i]!=dado5[i]))){
    sucesso_c[i] <- 1 
  } else{
    sucesso_c[i] <- 0
  }
}
cx <- 0
# Para obter a probabilidade eu divido a soma de sucesso e divido pela quantidade de testes que eu fiz
cx <- sum(sucesso_c)/100000
# Mostro na tela essa minha probabilidade
print(cx)

#######################################
print("Questão 3:")
# Assumindo os valores que Bob e Patti escolheram
escolha_bob_1 <- 0
escolha_bob_2 <- 1
escolha_bob_3 <- 0
escolha_patti_1 <- 0
escolha_patti_2 <- 0
escolha_patti_3 <- 1

sucesso_3 <- c()

for(i in 1:100000){
  # Assumindo valores iiciais para minhas moedas
  moeda_1 <- sample(0:1, size=1, replace=TRUE)
  moeda_2 <- sample(0:1, size=1, replace=TRUE)
  moeda_3 <- sample(0:1, size=1, replace=TRUE)
  # Nesse if estou vendo se Patti ganhou com a sequencia das três primeiras moedas
  if((moeda_1==escolha_patti_1)&&(moeda_2==escolha_patti_2)&&(moeda_3==escolha_patti_3)){
    # Sucesso vai ser quando Patti ganhar
    sucesso_3[i] <- 1
  } else{
      # Nesse if estou vendo se Bob ganhou com a sequencia das três primeiras moedas
      if((moeda_1==escolha_bob_1)&&(moeda_2==escolha_bob_2)&&(moeda_3==escolha_bob_3)){
        # Fracasso vai ser quando Bob ganhar
        sucesso_3[i] <- 0
      } else{
        # Caso nenhum dos dois ganhe preciso gerar uma nova moeda para seguir com a sequência
        # Com o while eu consigo forçar com que essa geração só pare quando um dos dois ganharem
          while(((moeda_1!=escolha_bob_1)||(moeda_2!=escolha_bob_2)||(moeda_3!=escolha_bob_3))&&((moeda_1!=escolha_patti_1)||(moeda_2!=escolha_patti_2)||(moeda_3!=escolha_patti_3))){
            # Com a continuação da sequência eu preciso reposicionar as moedas de acordo com a forma que estou comparando
            # A moeda da rodada anterior que era a minha segunda moeda da sequência agora vai ser a primeira 
            moeda_1 <- moeda_2
            # A moeda da rodada anterior que era a minha terceira moeda da sequência agora vai ser a segunda
            moeda_2 <- moeda_3
            # Gerando de forma aleatória um noco valor para a nova moeda da sequência
            moeda_3 <- sample(0:1, size=1, replace=TRUE)
          }
          # Com a saída do meu while alguém ganhou, e faço as mesmas comparações descritas acima para ver quem realmente ganhou 
          if((moeda_1==escolha_patti_1)&&(moeda_2==escolha_patti_2)&&(moeda_3==escolha_patti_3)){
            sucesso_3[i] <- 1
          } else{
            sucesso_3[i] <- 0
          }
      }
  }
}

tres <- 0
# Para obter a probabilidade eu divido a soma de sucesso e divido pela quantidade de testes que eu fiz
tres <- sum(sucesso_3)/100000
# Mostro na tela essa minha probabilidade
print(tres)
print("Fim, bom descanso Professor :)...")