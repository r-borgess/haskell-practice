--UFPI - CCN - DC - Computação
--Programação Funcional - Prof. Helson
--Rodrigo Borges
--EPC05

type Pessoa = String
type Livro = String
type BancodeDados = [(Pessoa, Livro)]

zipAux (a:b) (x:y) = zip (zeros (a:b)) (zeros (x:y))
    where
        zeros (i:j) = (i:j) ++ (replicate (abs((length (a:b)) - (length (x:y)))) 0)

maxLivros :: Int
maxLivros = 2

teste = [("Paulo", "A Mente Nova do Rei"), ("Ana", "O Segredo de Luiza"), ("Paulo", "O Pequeno Principe"), ("Mauro", "O Capital"), ("Francisco", "O Auto da Compadecida")]

--1)
tomaEmprestado :: BancodeDados -> Pessoa -> Livro -> BancodeDados
tomaEmprestado dBase pessoa titulo = [(pessoa, titulo) | (pessoa, titulo) <- (pessoa, titulo) : dBase]

devolveLivro :: BancodeDados -> Pessoa -> Livro -> BancodeDados
devolveLivro dBase pessoa titulo = [(fulano, liv) | (fulano, liv) <- dBase, titulo /= liv]

--2)
somaListas (a:b) (x:y) = [(i+j) | (i, j) <- zipAux (a:b) (x:y)]

--3)
constroiLista :: [a] -> [[a]]
constroiLista lista = [impar lista, par lista]
  where
    impar [] = []
    impar [x] = [x]
    impar (x:_:lista) = x : impar lista

    par [] = []
    par [_] = []
    par (:_:x:lista) = x : par lista
