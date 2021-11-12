--Grupo:
--Pedro Henrique Goncalves Teixeira - 11821BCC008
--Marillia Soares Rodrigues - 11821BCC020

import System.Random
--TIPOS E VALORES--
type Jogador = (Int, (Int, Int), Andar, ((Item, Int), (Item, Int), (Item, Int)))


data Objeto = Patins | Bomba | Arremesso | Fogo | Buraco | Grama | Pedra | Parede | Jogador1 | Jogador2 | Jogador3 deriving (Show,Eq)
data Andar = N | S | L | O deriving (Eq, Show)

type Item = Objeto
type Celula = [Item]
type Linha = [Celula]
type Tabuleiro = [Linha]

--CELULAS E CAMPOS -> o campo seria a pilha de objetos e jogadores--
campoVazio :: Celula -> Bool
campoVazio campo = if null campo == True
                then True
                else False

verificaCelula :: Celula -> Bool
verificaCelula [] = True
verificaCelula celula = campo celula

campo :: Celula -> Bool
campo [] = True
campo [obstaculo] = obstaculo == Parede || obstaculo == Grama || obstaculo == Pedra
campo (obstaculo:xs) 
        | (obstaculo == Grama || obstaculo == Pedra) && xs == [] = True
        | (obstaculo == Arremesso || obstaculo == Patins || obstaculo == Fogo || obstaculo == Bomba) && head xs == Grama = True
        | (obstaculo == Jogador1 || obstaculo == Jogador2 || obstaculo == Jogador3) && head xs == Grama = True
        | obstaculo == Parede && (head xs == Grama || xs == [] || head xs == Arremesso || head xs == Patins || head xs == Fogo) = campo xs
        | otherwise = False

obstaculoPresente :: Objeto -> String
obstaculoPresente obstaculo
                        | obstaculo == Fogo = "fogo"
                        | obstaculo == Arremesso = "arremesso"
                        | obstaculo == Patins = "patins"

--JOGADORES--
numPlayer :: Item -> Int
numPlayer item
        | item == Jogador1 = 1
        | item == Jogador2 = 2
        | item == Jogador3 = 3

ehJogador :: Item -> Bool
ehJogador jogador = jogador == Jogador1 || jogador == Jogador2 || jogador == Jogador3

getJogador :: Item -> [Jogador] -> Jogador
getJogador jogador listaJogadores = last(take(numPlayer jogador)listaJogadores)

geraJogador :: Linha -> Int -> Int -> [Jogador]
geraJogador [] _ _ = []
geraJogador (x:xs) linha campo
                        | campoVazio x = geraJogador xs linha (campo+1)
                        | ehJogador (head x) == False = geraJogador xs linha (campo+1)
                        | otherwise = (numPlayer(head x), (linha, campo), N, ((Fogo,0), (Patins,0), (Arremesso,0))) : geraJogador xs linha (campo+1)

showJogadores :: Tabuleiro -> Int -> [Jogador]
showJogadores [] _ = []
showJogadores (x:xs) l = geraJogador x l 0 ++ showJogadores xs (l + 1)

movimento :: Tabuleiro -> Jogador -> Andar -> Jogador
movimento tab (id, (linha, campo), direcao, ((Patins, patins), (Fogo, fogo), (Arremesso, arremesso))) x
                                                                                | x == O && direcao == x && validaMovimento tab linha (campo-1) = (id, (linha, campo-1), direcao, ((Patins, patins), (Fogo, fogo), (Arremesso, arremesso)))
                                                                                | x == L && direcao == x && validaMovimento tab linha (campo+1) = (id, (linha, campo+1), direcao, ((Patins, patins), (Fogo, fogo), (Arremesso, arremesso)))
                                                                                | x == N && direcao == x && validaMovimento tab (linha-1) campo = (id, (linha-1, campo), direcao, ((Patins, patins), (Fogo, fogo), (Arremesso, arremesso)))
                                                                                | x == S && direcao == x && validaMovimento tab (linha+1) campo = (id, (linha+1, campo), direcao, ((Patins, patins), (Fogo, fogo), (Arremesso, arremesso)))
                                                                                | otherwise = (id, (linha, campo), x, ((Patins, patins), (Fogo, fogo), (Arremesso, arremesso)))

validaMovimento :: Tabuleiro -> Int -> Int -> Bool
validaMovimento tab linha campo
                        | head (getCelula tab linha campo) == Bomba = False
                        | head (getCelula tab linha campo) == Parede = False
                        | head (getCelula tab linha campo) == Pedra = False
                        | otherwise = True



--GERAR NUMEROS ALEATORIOS E A PARTIR DISSO O TABULEIRO--
randonsnumbers :: [Int]
randonsnumbers = take 9 $ randomRs (1,10) (mkStdGen 2)

ordenaItens :: Int -> Celula
ordenaItens item
            | item == 1 = [Parede]
            | item == 2 = [Grama]
            | item == 3 = [Parede] ++ [Grama]
            | item == 5 = [Patins] ++ [Grama]
            | item == 6 = [Arremesso] ++ [Grama]
            | item == 7 = [Fogo] ++ [Grama]
            | item == 8 = [Parede] ++ [Patins] ++ [Grama]
            | item == 9 = [Parede] ++ [Arremesso] ++ [Grama]
            | item == 10 = [Parede] ++ [Fogo] ++ [Grama]

linha :: Int -> Int -> Int -> [Int] -> Linha
linha li n x numRandons
                | li == 0 && n == 0 = [Pedra] : linha li (n+1) x numRandons
                | li == 1 && n == 6 = [Jogador1, Grama] : linha li (n+1) x numRandons
                | li == 3 && n == 1 = [Jogador2, Grama] : linha li (n+1) x numRandons 
                | li == 6 && n == 5 = [Jogador3, Grama] : linha li (n+1) x numRandons 
                | (li == 0 || li == x) && n < x = [Pedra] : linha li (n+1) x numRandons
                | n == 0 && li /= x = [Pedra]  : linha li (n+1) x numRandons 
                | li == 1 && n < (n-1) = [Grama] : linha li (n+1) x numRandons
                | even li && even n && n /= x  = [Pedra] : linha li (n+1) x numRandons 
                | n == x && li <= x =  [Pedra] : [] 
                | otherwise = ordenaItens (last (take n numRandons)) : linha li (n+1) x numRandons 

tabuleiro :: Tabuleiro
tabuleiro = [linha 0 0 7 randonsnumbers, 
             linha 1 0 7 randonsnumbers, 
             linha 2 0 7 randonsnumbers, 
             linha 3 0 7 randonsnumbers, 
             linha 4 0 7 randonsnumbers, 
             linha 5 0 7 randonsnumbers, 
             linha 6 0 7 randonsnumbers, 
             linha 7 0 7 randonsnumbers]

getCelula :: Tabuleiro -> Int -> Int -> Celula
getCelula tab linha campo
                        | linha > 0 && campo == 0 = head (last (take (linha+1) tab))
                        | linha == 0 && campo == 0 = head (head tab)  
                        | linha == 0 && campo > 0 =  last (take (campo+1) (head tab))
                        | otherwise =  last (take (campo+1) (last (take (linha+1) tab)))


{-
celulaPedra :: Celula
celulaPedra = [Pedra]

celulaGrama :: Celula
celulaGrama = [Grama]

celulaPG :: Celula
celulaPG = [Parede, Grama]

--celulaPlayer :: Celula
--celulaPlayer = [Grama, Jogador 1]

celulaBomba :: Celula
celulaBomba = [Presente Bomba, Grama]

celulaPatins :: Celula
celulaPatins = [Presente Patins, Grama]

celulaArremesso :: Celula
celulaArremesso  = [Presente Arremesso , Grama]

celulaPPB :: Celula
celulaPPB = [Parede, Presente Bomba, Grama]

celulaPPP :: Celula
celulaPPP = [Parede, Presente Patins, Grama]

celulaPPA :: Celula
celulaPPA = [Parede, Presente Arremesso, Grama]

--LINHAS-

l1 :: Linha
l1 = [celulaPedra, celulaGrama, celulaPedra, celulaPedra, celulaGrama, celulaBomba, celulaPedra, celulaBomba]

l2 :: Linha
l2 = [celulaGrama, celulaPedra, celulaBomba, celulaGrama, celulaGrama, celulaBomba, celulaBomba, celulaBomba]

l3 :: Linha
l3 = [celulaGrama, celulaPedra, celulaGrama, celulaPedra, celulaBomba, celulaBomba, celulaPedra, celulaBomba]

l4 :: Linha
l4 = [celulaGrama, celulaPlayer, celulaGrama, celulaGrama, celulaPlayer, celulaGrama, celulaPlayer, celulaGrama]

l5 :: Linha
l5 = [celulaGrama, celulaPedra, celulaPlayer, celulaGrama, celulaPlayer, celulaPedra, celulaGrama, celulaPlayer]

l6 :: Linha
l6 = [celulaGrama, celulaPedra, celulaPedra, celulaPlayer, celulaGrama, celulaPedra, celulaPedra, celulaPlayer]

l7 :: Linha
l7 = [celulaPedra, celulaGrama, celulaPedra, celulaPlayer, celulaPlayer, celulaPedra, celulaPlayer, celulaGrama]

l8 :: Linha
l8 = [celulaGrama, celulaPedra, celulaPlayer, celulaPlayer, celulaPedra, celulaGrama, celulaPlayer, celulaPedra]

--TABULEIRO--

tabuleiro :: Tabuleiro
tabuleiro = [l1, l2, l3, l4, l5, l6, l7, l8]
-}
