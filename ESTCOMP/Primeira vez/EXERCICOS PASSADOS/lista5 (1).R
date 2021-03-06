#EQUIPE:
#Andre Luiz Morais Peres de Quinta - 11821BCC003
#Giullia Rodrigues de Menezes - 11621BCC016
#Lais Saloum Deghaide - 11821BCC001
#Vinicius Calixto Rocha - 11911BCC039

#################################################
#Questao 1

# Conjunto de dados utilizado
pinguins <- read.csv("penguins_size.csv", header = TRUE)
str(pinguins)

#a)
#M�dia do peso e comprimento
mean(pinguins$body_mass_g, na.rm = TRUE)
mean(pinguins$flipper_length_mm, na.rm = TRUE)

#Desvio padr�o 
sd(pinguins$body_mass_g, na.rm = TRUE)
sd(pinguins$flipper_length_mm, na.rm = TRUE)

#b)
#media e desvio padrao do peso em cada especie
aggregate(cbind(body_mass_g, flipper_length_mm) ~ species, pinguins, mean)
aggregate(cbind(body_mass_g, flipper_length_mm) ~ species, pinguins, sd)

#c)
#media e desvio padrao do peso em cada especie separado por sexo
aggregate(cbind(body_mass_g, flipper_length_mm) ~ sex, pinguins, mean, subset = sex != ".")
aggregate(cbind(body_mass_g, flipper_length_mm) ~ sex, pinguins, sd, subset = sex != ".")

#d)
plot(pinguins$flipper_length_mm, pinguins$body_mass_g, pch = 16,
     xlab = "Tamanho da asa em milimetros",
     ylab = "Peso em gramas",
     main = "Tamanho da asa versus Peso", cex = 1.5)

#e)
# Considerando que a base de dados n�o possui valores inv�lidos NA a correla��o ser� 0.8712018
print(cor(pinguins$flipper_length_mm, pinguins$body_mass_g))


#f) DISSERTATIVA
# Como estamos levando em conta os resultados obtidos anteriormente espera-se uma an�lise baseada no n�mero em que obtivemos com a fun��o cor 0.87 e o que pode ser visto no gr�fico em que plotamos. Se trata de uma correla��o linear positiva e forte.

#g)
writeLines("\nCoeficiente e Intercept:")
print(lm(pinguins$body_mass_g ~ pinguins$flipper_length_mm))
# Reta de regress�o: y = 49.69x - 5780.83

#h)
# O coeficiente angular da reta de regress�o indica o quanto varia y em m�dia a cada itera��o de x na reta
#   Neste caso, a cada valor acrescentado nos mil�metros da asa (X) do pinguim  ocorre em m�dia um acr�scimo de 49.69 no peso em m�dia de gramas (Y) do pinguim 

#i)
# O peso medio de um pinguim que possui uma asa de 204 mm � de (204*49.69 - 5780.83) = 4355.93 gramas
#   Podemos observar os intervalos que o modelo aceita para a vari�vel explanat�ria abaixo:

cat("Intervalo de valores para X(flipper_length_mm) : [",
    min(pinguins$flipper_length_mm),",",
    max(pinguins$flipper_length_mm),"]","\n\n")

# como � poss�vel perceber, 168 n�o est� incluso no intervalo onde a reta de regress�o foi definida, e por isso, x=168 n�o pode explicar um valor de restosta y

#################################################
#Questao 2

# Matriz de distancias
elem <- 1:5
data_matrix = c(
  0, 9, 3, 6,11,
  9, 0, 7, 5,10,
  3, 7, 0, 9, 2,
  6, 5, 9, 0, 8,
  11,10,2, 8, 0) 

dist_matrix <- as.dist(matrix(data_matrix,5,5))

# a)
dendoA <- hclust(dist_matrix, method = "complete")
plot(dendoA)

# b)
dendoB <- hclust(dist_matrix, method = "single")
plot(dendoB)

# c)
agl_complete <- cutree (dendoA , k = 2)
writeLines("Aglomerados com o m�todo 'complete'")
writeLines("Primeiro aglomerado:")
print(elem[agl_complete[elem] == 1])
writeLines("Segundo aglomerado:")
print(elem[agl_complete[elem] == 2])

# d)
agl_single <- cutree (dendoB , k = 2)
writeLines("\n\nAglomerados com o m�todo 'single'")
writeLines("Primeiro aglomerado:")
print(elem[agl_single[elem] == 1])
writeLines("Segundo aglomerado:")
print(elem[agl_single[elem] == 2])
