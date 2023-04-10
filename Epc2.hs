--UFPI - CCN - DC - CC
--Programação Funcional - Prof. Dr. Antonio Helson Mineiro Soares
--Rodrigo do Nascimento Borges
--EPC 02

--retorna o maior valor entre dois números
maximo :: Int -> Int -> Int 
maximo x y
    |x >= y = x
    |otherwise = y

--vendas para 10 semanas
venda :: Int -> Int
venda 0 = 7
venda 1 = 2
venda 2 = 5
venda 3 = 4
venda 4 = 3
venda 5 = 1
venda 6 = 0
venda 7 = 2
venda 8 = 4
venda 9 = 5
venda 10 = 8

--(1)total de vendas da semana 0 à semana n
totaldeVendas :: Int -> Int
totaldeVendas n
    |n == 0 = venda 0
    |n < 0 = 0
    |otherwise = totaldeVendas (n - 1) + venda n

--(2)maior valor vendido entre as semanas 0 e n
maiorVenda :: Int -> Int
maiorVenda n
    |n < 0 = 0
    |n == 0 = venda 0
    |otherwise = maximo (maiorVenda (n - 1)) (venda n)

--(3)semana em que ocorreu a maior venda
maiorSemana :: Int -> Int
maiorSemana n
    |n < 0 = -1
    |venda n == maiorVenda n = n
    |otherwise = maiorSemana (n-1)

--(4)existe semana na qual nada foi vendido?
temSemanaZero :: Int -> Bool
temSemanaZero n
    |n < 0 = False
    |venda n == 0 = True
    |otherwise = temSemanaZero (n - 1)

--(5)em qual semana não houve vendas
qualSemanaZero :: Int -> Int
qualSemanaZero n
    |n < 0 = (-1)
    |venda n == 0 = n
    |otherwise = qualSemanaZero (n-1)
