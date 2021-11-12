module Root.Src.Exercise where


{-
Assim como Bool pode assumir os valores True e False, o tipo Naipe pode assumir um dos valores Copas, Espada, Ouro e Paus, tal que
Copas < Espada < Ouro < Paus

>>>Copas > Espada
False

>>> Espada > Ouro
False

>>> Paus > Copas
True

>>>maiorDeTres Copas Espada Paus
Paus

>>>maiorDeTres Copas Copas Copas
Copas

-}
data Naipe = Copas | Espada | Ouro | Paus deriving (Ord,Eq,Show)



{-
Seja o tipo de dados Carta tupla em que 
 - o primeiro elemento é o valor da carta (1,2,3,4,5,6,7,8,9,10,11,12,13) 
 - o segundo é um Naipe
-}
type Carta = (Int, Naipe)


-- Defina as seguintes funções usando apenas casamento de padrões do lado esquerdo das equações.

{-
Uma função que receba uma carta retorne seu Naipe.

Entrada:
    - c1: carta

Resultado: 
    - naipe da carta

Exemplos:
>>>naipe (1,Ouro)
Ouro
-}
naipe :: Carta -> Naipe
naipe (numero, naipe) = naipe


{-
Uma função que receba uma carta retorne seu valor.

Entrada:
    - c1: carta

Resultado: 
    - valor da carta

Exemplos:
>>>valor (1,Ouro)
1
-}
valor :: Carta -> Int
valor (numero, naipe) = numero


{-
Uma função que receba duas cartas retorne se seus naipes são iguais.

Entrada:
    - c1: carta
    - c2: carta

Resultado: 
    - naipe de c1 igual a naipe de c2?

Exemplos:
>>>naipeIgual (1,Ouro) (2,Ouro)
True
>>>naipeIgual (1,Ouro) (2,Paus)
False
-}

naipeIgual :: Carta -> Carta -> Bool
naipeIgual (numero1, naipe1) (numero2, naipe2)
    | naipe1 == naipe2 = True   
    | otherwise = False

{-
Uma função que receba uma carta e retorne seu valor por extenso.

Entrada:
    - c1: carta

Resultado: 
    - valor de c1 por extenso

Exemplos:
>>>valorPorExtenso (1,Ouro)
"Um"
>>>valorPorExtenso (2,Paus)
"Dois"
>>>valorPorExtenso (12,Ouro)
"Dama"
-}


valorPorExtenso :: Carta -> String
valorPorExtenso (numero, naipe)
    | numero == 1 = "Um"
    | numero == 2 = "Dois"
    | numero == 3 = "Tres"
    | numero == 4 = "Quatro"
    | numero == 5 = "Cinco"
    | numero == 6 = "Seis"
    | numero == 7 = "Sete"
    | numero == 8 = "Oito"
    | numero == 9 = "Nove"
    | numero == 10 = "Dez"
    | numero == 11 = "Valete"
    | numero == 12 = "Dama"
    | numero == 13 = "Rei"



{-
Uma função que receba uma carta e retorne seu naipe por extenso.

Entrada:
    - c1: carta

Resultado: 
    - naipe de c1 por extenso

Exemplos:
>>>naipePorExtenso (1,Ouro)
"Ouro"
>>>naipePorExtenso (2,Paus)
"Paus"
>>>naipePorExtenso (12,Ouro)
"Ouro"
-}
naipePorExtenso :: Carta -> String
naipePorExtenso (numero, naipe)
    | naipe == Ouro = "Ouro"
    | naipe == Paus = "Paus"
    | naipe == Espada = "Espada"
    | naipe == Copas = "Copas"

{-
Uma função que receba três cartas e retorne um booleano dizendo se formam uma sequencia, isto é, se estão
aparecem dentro da seguinte sequência: Espada Copas Ouro Paus Espada Copas

Entrada:
    - Carta
    - Carta
    - Carta

Resultado: 
    - Estão em sequência?

Exemplos:
>>>sequênciaDeNaipes (1,Paus) (2,Ouro) (7,Copas)
False

>>>sequênciaDeNaipes (1,Paus) (7,Copas) (2,Ouro) 
False

>>>sequênciaDeNaipes (1,Paus) (2,Espada) (7,Copas)
True

>>>sequênciaDeNaipes (1,Espada) (2,Copas) (7,Ouro)
True
-}
sequênciaDeNaipes :: Carta -> Carta -> Carta -> Bool
sequênciaDeNaipes (numero1, naipe1) (numero2, naipe2) (numero3, naipe3) 
    | naipe1 == Espada && naipe2 == Copas && naipe3 == Ouro = True
    | naipe1 == Copas && naipe2 == Ouro && naipe3 == Paus = True
    | naipe1 == Ouro && naipe2 == Paus && naipe3 == Espada = True
    | naipe1 == Paus && naipe2 == Espada && naipe3 == Copas = True
    | otherwise = False

{-
Uma função que recebe uma data na forma de três inteiros e retorna a da por extenso.

Entrada:
    - Dia
    - Mês
    - Ano

Resultado
    - Data por extenso
    - Quando o dia for 1, usar Primeiro como extenso.

Exemplos:
>>>dataPorExtenso 1 1 2001
"Primeiro de Janeiro de 2001"

>>>dataPorExtenso 10 3 2010
"Dez de Março de 2010"
-}

diaPorExtenso :: Int -> String
diaPorExtenso dia 
    | dia == 1 = "Primeiro"
    | dia == 2 = "Dois"
    | dia == 3 = "Tres"
    | dia == 4 = "Quatro"
    | dia == 5 = "Cinco"
    | dia == 6 = "Seis"
    | dia == 7 = "Sete"
    | dia == 8 = "Oito"
    | dia == 9 = "Nove"
    | dia == 10 = "Dez"
    | dia == 11 = "Onze"
    | dia == 12 = "Doze"
    | dia == 13 = "Treze"
    | dia == 14 = "Quatorze"
    | dia == 15 = "Quinze"
    | dia == 16 = "Dezesseis"
    | dia == 17 = "Dezessete"
    | dia == 18 = "Dezoito"
    | dia == 19 = "Dezenove"
    | dia == 20 = "Vinte"
    | dia == 21 = "Vinte e Um"
    | dia == 22 = "Vinte e Dois"
    | dia == 23 = "Vinte e Tres"
    | dia == 24 = "Vinte e Quatro"
    | dia == 25 = "Vinte e Cinco"
    | dia == 26 = "Vinte e Seis"
    | dia == 27 = "Vinte e Sete"
    | dia == 28 = "Vinte e Oito"
    | dia == 29 = "Vinte e Nove"
    | dia == 30 = "Trinta"
    | dia == 31 = "Trinta e Um"

mesPorExtenso :: Int -> String
mesPorExtenso mes
    | mes == 1 = "Janeiro"
    | mes == 2 = "Fevereiro"
    | mes == 3 = "Março"
    | mes == 4 = "Abril"
    | mes == 5 = "Maio"
    | mes == 6 = "Junho"
    | mes == 7 = "Julho"
    | mes == 8 = "Agosto"
    | mes == 9 = "Setembro"
    | mes == 10 = "Outubro"
    | mes == 11 = "Novembro"
    | mes == 12 = "Dezembro"

anoString :: Int -> String
anoString ano = show ano

dataPorExtenso :: Int -> Int -> Int -> String
dataPorExtenso dia mes ano = diaPorExtenso dia ++ " de " ++ mesPorExtenso mes ++ " de " ++ anoString ano


type Data = (Int, Int, Int)
     dataNasc (d, m, a)
     dataHoje (d1, m1, a1)
     y = a1 - a


valorFinal :: Float-> Float-> Float    -- x=passagem e y= idade
valorFinal x y | i>=70 = x0.6
             | i<=10 && i>2 = x0.4
             |  i <= 2 = x * 0.15
             | otherwise x