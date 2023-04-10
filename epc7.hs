sum2 :: [Int] -> Int
sum2 = foldr (+) 0

prod2 :: [Int] -> Int
prod2 = foldr (*) 1

and2 :: [Bool] -> Bool
and2 = foldr (&&) True

or2 :: [Bool] -> Bool
or2 = foldr (||) False

pertence :: Int -> [Int] -> Bool
pertence a xs = foldr iguais False xs
    where
        iguais x i = (x == a) || i

max2 :: [Int] -> Int
max2 = foldr1 max

min2 :: [Int] -> Int
min2 = foldr1 min

media :: [Double] -> Double
media xs = (foldr (+) 0 xs) / fromIntegral (length xs)