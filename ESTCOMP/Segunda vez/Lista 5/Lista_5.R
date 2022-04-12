#Gabriel Ribeiro Bernardi - 11821BCC036
#Hendrik Abdalla Hermann - 11911BCC034
#Pedro Henrique Goncalves Teixeira - 11821BCC008

#Exercicio 1
penguins_size <- read.csv("./penguins_size.csv")

#Letra A
pesoMedio <- mean(penguins_size$body_mass_g, na.rm = TRUE)
comprimentoAsaMedio <- mean(penguins_size$flipper_length_mm, na.rm = TRUE)

desvPadPeso <- sd(penguins_size$body_mass_g, na.rm = TRUE)
desvPadAsa <- sd(penguins_size$flipper_length_mm, na.rm = TRUE)

#Letra B
#separando o dataframe por especie
adelie <- penguins_size[penguins_size$species == 'Adelie',]
chinstrap <- penguins_size[penguins_size$species == 'Chinstrap',] 
gentoo <- penguins_size[penguins_size$species == 'Gentoo',]

#calculo dos valores baseados nas especies
pesoMedioAdelie <- mean(adelie$body_mass_g,na.rm = TRUE)
comprimentoAsaMedioAdelie <- mean(adelie$flipper_length_mm, na.rm = TRUE)
desvPadPesoAdelie <- sd(adelie$body_mass_g, na.rm = TRUE)
desvPadAsaAdelie <- sd(adelie$flipper_length_mm, na.rm = TRUE)

pesoMedioChinstrap <- mean(chinstrap$body_mass_g,na.rm = TRUE)
comprimentoAsaMedioChinstrap <- mean(chinstrap$flipper_length_mm, na.rm = TRUE)
desvPadPesoChinstrap <- sd(chinstrap$body_mass_g, na.rm = TRUE)
desvPadAsaChinstrap <- sd(chinstrap$flipper_length_mm, na.rm = TRUE)

pesoMedioGentoo <- mean(gentoo$body_mass_g,na.rm = TRUE)
comprimentoAsaMedioGentoo <- mean(gentoo$flipper_length_mm, na.rm = TRUE)
desvPadPesoGentoo <- sd(gentoo$body_mass_g, na.rm = TRUE)
desvPadAsaGentoo <- sd(gentoo$flipper_length_mm, na.rm = TRUE)

#Letra c
#separando o dataframe por sexo
macho <- penguins_size[penguins_size$sex == 'MALE',]
femea <- penguins_size[penguins_size$sex == 'FEMALE',]

pesoMedioMacho <- mean(macho$body_mass_g,na.rm = TRUE)
comprimentoAsaMedioMacho <- mean(macho$flipper_length_mm, na.rm = TRUE)
desvPadPesoMacho <- sd(macho$body_mass_g, na.rm = TRUE)
desvPadAsaMacho <- sd(macho$flipper_length_mm, na.rm = TRUE)

pesoMedioFemea <- mean(femea$body_mass_g,na.rm = TRUE)
comprimentoAsaMedioFemea <- mean(femea$flipper_length_mm, na.rm = TRUE)
desvPadPesoFemea <- sd(femea$body_mass_g, na.rm = TRUE)
desvPadAsaFemea <- sd(femea$flipper_length_mm, na.rm = TRUE)

#Letra D
plot(penguins_size$flipper_length_mm, penguins_size$body_mass_g, pch=16)

#Letra E
massaFlipper <- penguins_size[,c(5,6)]
i = nrow(massaFlipper)
repeat{
  if(is.na(massaFlipper$flipper_length_mm[i]) == TRUE){
    massaFlipper <- massaFlipper[-i,]
  }
  else{
    i <- i - 1
  }
  if(sum(is.na(massaFlipper)==TRUE)==0){
    break
  }
}
correlacaoPenguins <- cor(massaFlipper$flipper_length_mm, massaFlipper$body_mass_g)

#Letra F
# Sim, existe relacao entre peso e o comprimento das asas dos penguins, sendo que esta relacao eh muito forte e positiva

#Letra G
modeloLinear <- lm(massaFlipper$flipper_length_mm ~ massaFlipper$body_mass_g)

#Letra H
# com o "modeloLinear" eh encontrado o coeficiente angular que eh que caracterizado pela declividade da reta, nesse caso, representado pelo coeficiente do peso.

#Letra I
# para penguim com asa de 204 mm
asa204 <- (204 - 136.72956) / 0.01528
# Eh possivel sim, pois eh encontrando o valor do peso atraves da formula:
# (coefieciente linear (Intercept) + coeficiente angular) * peso = tamanho da asa

# para penguim com asa de 168 mm
asa168 <- (168 - 136.72956) / 0.01528



