--UFPI - CCN - DC - CC
--Programação Funcional - Prof. Dr. Antonio Helson Mineiro Soares
--Rodrigo do Nascimento Borges
--EPC 03

maiorNumero = do
    putStrLn "Digite o primeiro número: "
    num1 <- getLine
    putStrLn "Digite o segundo número: "
    num2 <- getLine
    putStrLn "Digite o terceiro número: "
    num3 <- getLine

    let x = read num1 :: Int
    let y = read num2 :: Int
    let z = read num3 :: Int

    let maior = max x (max y z)

    putStrLn ("O maior é "++ show maior)

eq2grau = do
    putStrLn "Digite o valor de num1: "
    n1 <- getLine
    putStrLn "Digite o valor de num2: "
    n2 <- getLine
    putStrLn "Digite o valor de num3: "
    n3 <- getLine

    let num1 = read n1 :: Float
    let num2 = read n2 :: Float
    let num3 = read n3 :: Float

    let delta = (num2**2) - (4 * num1 * num3)

    let x1 = ((-num2) + (sqrt delta)) / (2*num1)
    let x2 = ((-num2) - (sqrt delta)) / (2*num1)

    putStrLn ("As raízes são " ++ show x1 ++ " e " ++ show x2)

categoria = do
    putStrLn "Digite num1 idade: "
    num1 <- getLine

    let idade = read num1 :: Int

    if idade >= 5 && idade <= 7
        then putStrLn "Infantil A"
        else if idade >= 8 && idade <= 10
            then putStrLn "Infantil B"
            else if idade >= 11 && idade <= 13
                then putStrLn "Juvenil A"
                else if idade >= 14 && idade <= 17
                    then putStrLn "Juvenil B"
                    else if idade >= 18
                        then putStrLn "Adulto"
                        else putStrLn "Inválido"

paridadeSinal = do
    putStrLn "Digite um número: "
    num1 <- getLine

    let num = read num1 :: Int

    if (num `mod` 2) == 0
        then putStr "Par"
        else putStr "Ímpar"
    
    if num > 0
        then putStr " Positivo"
        else if num < 0
            then putStrLn " Negativo"
            else putStrLn " Zero"
    putStrLn ""


ordenaTres = do
    putStrLn "Digite o primeiro valor: "
    n1 <- getLine
    putStrLn "Digite o segundo valor: "
    n2 <- getLine
    putStrLn "Digite o terceiro valor: "
    n3 <- getLine
    putStrLn "Crescente ou decrescente? (c/d): "
    c1 <- getLine

    let num1 = read n1 :: Int
    let num2 = read n2 :: Int
    let num3 = read n3 :: Int
    
    if c1 == "C" || c1 == "c"
        then if num1 <= num2 && num2 <= num3
            then putStrLn (show num1 ++ " " ++ show num2 ++ " " ++ show num3)
            else if num1 <= num3 && num3 <= num2
                then putStrLn (show num1 ++ " " ++ show num3 ++ " " ++ show num2)
                else if num2 <= num1 && num1 <= num3
                    then putStrLn (show num2 ++ " " ++ show num1 ++ " " ++ show num3)
                    else if num2 <= num3 && num3 <= num1
                        then putStrLn (show num2 ++ " " ++ show num3 ++ " " ++ show num1)
                        else if num3 <= num1 && num1 <= num2
                            then putStrLn (show num3 ++ " " ++ show num1 ++ " " ++ show num2)
                            else if num1 == num2 && num2 == num3
                                then putStrLn (show num1 ++ " " ++ show num2 ++ " " ++ show num3)
                                else putStrLn (show num3 ++ " " ++ show num2 ++ " " ++ show num1)
        else if c1 == "d" || c1 == "D"
            then if num1 >= num2 && num2 >= num3
                then putStrLn (show num1 ++ " " ++ show num2 ++ " " ++ show num3)
                else if num1 >= num3 && num3 >= num2
                    then putStrLn (show num1 ++ " " ++ show num3 ++ " " ++ show num2)
                    else if num2 >= num1 && num1 >= num3
                        then putStrLn (show num2 ++ " " ++ show num1 ++ " " ++ show num3)
                        else if num2 >= num3 && num3 >= num1
                            then putStrLn (show num2 ++ " " ++ show num3 ++ " " ++ show num1)
                            else if num3 >= num1 && num1 >= num2
                                then putStrLn (show num3 ++ " " ++ show num1 ++ " " ++ show num2)
                                else if num1 == num2 && num2 == num3
                                    then putStrLn (show num1 ++ " " ++ show num2 ++ " " ++ show num3)
                                    else putStrLn (show num3 ++ " " ++ show num2 ++ " " ++ show num1)
                else putStrLn "Caractere inválido."