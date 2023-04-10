type Pessoa = String
type Livro = String
type BancodeDados = [(Pessoa, Livro)]

maxLivros :: Int
maxLivros = 2

teste = [("Paulo", "A Mente Nova do Rei"), ("Ana", "O Segredo de Luiza"), ("Paulo", "O Pequeno Principe"), ("Mauro", "O Capital"), ("Francisco", "O Auto da Compadecida")]

--1)
livrosEmprestados :: BancodeDados -> Pessoa -> [Livro]
livrosEmprestados [ ] _ = [ ]
livrosEmprestados ((inquilino, titulo) : resto) fulano
    |inquilino == fulano = titulo : livrosEmprestados resto fulano
    |otherwise = livrosEmprestados resto fulano

--2)
quemPegou :: BancodeDados -> Livro -> [Pessoa]
quemPegou [ ] _ = [ ]
quemPegou ((inquilino, titulo) : resto) livro
    |titulo == livro = inquilino : quemPegou resto livro
    |otherwise = quemPegou resto livro

--3)
taEmprestado :: BancodeDados -> Livro -> Bool
taEmprestado [ ] _ = False
taEmprestado ((inquilino, titulo) : resto) livro
    |titulo == livro = True
    |otherwise = taEmprestado resto livro

--4)
pegouQuantos :: BancodeDados -> Pessoa -> Int
pegouQuantos [ ] _ = 0
pegouQuantos ((inquilino, titulo) : resto) fulano
    |inquilino == fulano = 1 + pegouQuantos resto fulano
    |otherwise = pegouQuantos resto fulano

--5) e 7)
tomaEmprestado :: BancodeDados -> Pessoa -> Livro -> BancodeDados
tomaEmprestado dBase pessoa titulo
    |pegouQuantos dBase pessoa < maxLivros = (pessoa, titulo) : dBase
    |otherwise = error "Maximo de emprestimos atingido"

--6)
devolveLivro :: BancodeDados -> Pessoa -> Livro -> BancodeDados
devolveLivro ((inquilino, titulo): resto) fulano livro
    |inquilino == fulano && titulo == livro = resto
    |otherwise = (inquilino, titulo) : devolveLivro resto fulano livro
devolveLivro [ ] _ _ = error "Nao ha livro emprestado"

--8)
