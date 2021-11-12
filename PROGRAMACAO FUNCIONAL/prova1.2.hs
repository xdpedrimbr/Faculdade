-- File containing utility functions for lists.

module Root.Src.Exercise where
import Data.Char

--Eu
nome = "Pedro Henrique Goncalves Teixeira"   -- coloque seu nome e matrícula aqui, como uma String
-- juro pela minha honra, que serei ético na realização desta avaliação, 
-- não consultando nada e nem ninguém, além das notas de aulas e das 
-- minha soluções para exercícios anteriores.



{-
Escreva uma função **recursiva**  que calculo a soma dos quadrados dos números inteiros entre os parâmetros passados, inclusive.

Entrada:
    - i - Inteiro
    - n - Inteiro
Resultado
    - i^2 + (i+1)^2 + ... + n^2

>>>somaDosQuadrados 1 3

>>>somaDosQuadrados 3 6

>>>somaDosQuadrados 5 2

>>>somaDosQuadrados 3 -2

-}

somaDosQuadrados :: Int -> Int -> Int
somaDosQuadrados i n 
    | i > n = (i^2 + somaDosQuadrados(i-1) n)
    | i < n = (i^2 + somaDosQuadrados(i+1) n)
    | i == n = n^2




{-
Dado um período, escreva uma função que decida se é uma afirmação, interrogação, exclamação, ou nenhum.

Entrada:
    - periodo - String

Resultado:
    - "afirmacao", se período termina com ?, ou "exclamacao" se período termina com !, ou "interrogacao" se período
    termina  com ?, ou "nada", caso contrário.
    Ignorar espaços no fim do período.

>>>tipoPeríodo "Oi."
"afirmacao"

>>>tipoPeríodo "Oi?"
"interrogacao"

>>>tipoPeríodo "Oi!"
"exclamacao"

>>>tipoPeríodo "Oi"
"nada"

>>>tipoPeríodo "Oi^"
"nada"

>>>tipoPeríodo "Oi."
"afirmacao"

>>>tipoPeríodo "Oi?     "
"interrogacao"

-}
trim :: String -> String
trim = removeInicio . removeFinal
   where 
       removeInicio = reverse . dropWhile isSpace
       removeFinal = removeInicio

tipoPeríodo :: String -> String
tipoPeríodo período
    | take 1(reverse(trim período)) == "!" = "exclamacao"
    | take 1(reverse(trim período)) == "." = "afirmacao"
    | take 1(reverse(trim período)) == "?" = "interrogacao"
    | otherwise = "nada"



{-
Defina uma função que remova as primeiras duplicatas de uma lista de inteiros.

Entrada:
    - l - lista de inteiros.

Resultado:
    - lista em que as primeiras ocorrências repetidas de qualquer valor foram removidas.

>>>removeDuplicatas [1,2,3,4,5,3,7,8,3]
[1,2,4,5,7,8,3]

-}

removeDuplicatas :: Eq a => [a] -> [a]
removeDuplicatas [] = []
removeDuplicatas (x:xs)   | x `elem` xs = removeDuplicatas xs
                          | otherwise = x : removeDuplicatas xs


{-
Defina uma função que remova as últimas duplicatas de uma lista de inteiros.

Entrada:
    - l - lista de inteiros.

Resultado:
    - lista em que as primeiras ocorrências repetidas de qualquer valor foram removidas.

>>>removeDuplicatas2 [1,2,3,4,5,3,7,8,3]
[1,2,3,4,5,7,8]

-}

removeDuplicatas2 :: Eq a => [a] -> [a]
removeDuplicatas2 [] = []
removeDuplicatas2 (x:xs) = x : filter (/= x) (removeDuplicatas2 xs)



{-
Mastermind 1.

Dado uma lista com 4 de 8 possíveis cores, determinar se a lista é válida.

Entrada:
    - l - Lista de inteiro, onde cada inteiro vai de 1 a 8 e representa uma cor.

Resultado:
    - True se não há repetições e tem tamanho 4
    - False se há repetições ou tamanho diferente de 4

>>>mmVálido [1,2,3,4]
True

>>>mmVálido [1,2,3,9]
False

>>>mmVálido [1,2,3,4,5]
False

>>>mmVálido [1,2,4,4]
False

-}

mmVálido l = error "Implementar"

{-
Mastermind 2

Dado duas listas, se alguma não é válida, lançar uma exceção (use error).
Se as duas são válidas, retornar uma tupla com a quantidade de acertos bons e ótimos da jogada.

Entrada
    - config - lista de inteiro
    - jogada - lista de inteiro

Resultado
    - tupla (o,b) onde o é um inteiro com a quantidade de cores em jogada e que aparecem na mesma posição em config
    e b é quantidade de cores em jogada e que aparecem em posições diferentes em config.


>>>tentativa [1,2,3,4] [5,6,7,8]
(0,0)

>>>tentativa [1,2,3,4] [1,2,3,4]
(4,0)

>>>tentativa [1,2,3,4] [4,3,2,1]
(0,4)

>>>tentativa [1,2,3,4] [2,1,3,4]
(2,2)

>>>tentativa [1,2,3,4,5] [2,1,3,4]
não válido
-}

tentativa config jogada = error "Implementar"
