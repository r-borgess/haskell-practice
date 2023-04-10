--UFPI - CCN - DC - CC
--Programação Funcional - Prof. Dr. Antonio Helson Mineiro Soares
--Rodrigo do Nascimento Borges
--EPC 08
type Item = String
type Valor = Double
type Cart = [(Item, Valor)]

shoppingCart = [("Apples", 1.99), ("Bananas", 0.99), ("Oranges", 2.49), ("Milk", 3.99), ("Bread", 2.49), ("Eggs", 1.99), ("Cheese", 7.99)]

--1)
kwy :: String -> [String]
kwy str = filter letras (words str)
    where
        letras = any (`elem` "kwyKWY")

--2)
notB :: Eq a => [a] -> [a] -> [a]
notB a b = filter (`notElem` b) a

--3)
price :: Cart -> Cart
price x = filter (\(_, valor) -> valor < 1.00) x

--4)
--a)
duplica :: Num b => [b] -> [b]
duplica x = map (* 2) x
--b)
prodDuplica :: Num a => [a] -> a
prodDuplica x = foldr1 (*) (duplica x)
--c)
pares :: [Int] -> [Int]
pares x = filter even (duplica x)