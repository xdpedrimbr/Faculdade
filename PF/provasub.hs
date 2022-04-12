{- Listas Declare uma lista de tuplas em que os primeiros elementos são as potências de 2 e os segundos elementos indicam a ordem das 
potências dentro da conjunto de todas as potências de 2. A lista com os primeiros 4 elementos da lista que deve produzir 
são [(1,1),(2,2),(4,3),(8,4)], pois a primeira potência de 2 é 2^0=1, a segunda 2^1=2, e assim por diante.- 
Use compreensão de listas. 
(3)- Gere uma lista infinita. 
(4)- Use recursão. 
(3)- Limite a lista a um tamanho n. (4)-}


--provaSub = [(2 ** (x2 - 1), x2) | x2 <- [1..10]] 


provaSub n
        | n == 0 = [] 
        | otherwise = provaSub n [(2 ** (n - 1))] : n 
