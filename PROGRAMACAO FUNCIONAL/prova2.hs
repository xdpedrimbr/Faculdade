import Data.Char (toLower)
--Questao 1 
éPalíndromo :: Eq a => [a] -> Bool
éPalíndromo frase
    | frase == reverse frase = True
    | otherwise = False
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Questao 2
alfabeto :: String
alfabeto = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

éPangrama :: String -> Bool
éPangrama frase = all (`elem` compare) alfabeto
  where compare = map toLower frase
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Questao 3
--Item 1
data BTree arv = Nulo | No arv (BTree arv) (BTree arv)

--Item 2

--Item 3

--Item 4

----------------------------------------------------------------------------------------------------------------------------------------------------------
--Questao 4
aplicação f x = f $ x

xAplicação f x = f $ (f $ x) 

xXAplicação f x n 
    | n == 0 = x
    | otherwise = xXAplicação f (f $ x) (n-1)
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Questao 5
média lista = fromIntegral(somaRecursao lista) / fromIntegral(length lista)

médias lista 
    | lista == [] = []
    | otherwise = média (head lista) : médias (tail lista) 

somaRecursao[] = 0
somaRecursao (x:xs) = x + somaRecursao xs
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Questao 6
--data BTree arv = Nulo | No arv (BTree arv) (BTree arv)
arv = (No "Cansado" (No "Sim" (No "Noite" (No "Sim" (No "Dormir" Nulo Nulo) Nulo) (No "Nao" (No "Trabalhando" (No "Sim" (No "Complicou" Nulo Nulo) Nulo)(No "Nao" (No "Cochilar" Nulo Nulo) Nulo) ) Nulo ) ) Nulo) (No "Nao" (No "Trabalhando" (No "Sim" (No "Promocao" Nulo Nulo) Nulo) (No "Nao" (No "Correr" Nulo Nulo) Nulo)) Nulo))



----------------------------------------------------------------------------------------------------------------------------------------------------------
--Questao 7
questao7 :: [[a]] -> [(a, Int)]
questao7 l
    | null l = []
    | otherwise = (head cabeca, length cabeca) : questao7 cauda
        where cabeca = head l
              cauda = tail l