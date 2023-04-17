import Control.Concurrent (threadDelay)
import Control.Exception
import System.IO
import System.IO.Error
import System.Process
import Data.List

-- definição dos tipos de dados
type Jogadores = [Jogador]
type Nome = String
type Pontuacao = Int
type Vez = Int
data Jogador = Jogador Nome Pontuacao
                    deriving (Show, Read)


-- função que inicia o programa
main :: IO ()
main = do   
          {catch (ler_arquivo) tratar_error;}
          where
            ler_arquivo = do
            {
              arq <- openFile "dados.txt" ReadMode;
              dados <- hGetLine arq;
              hClose arq;
              imprimiIntroducao
              putStrLn ("\nPressione <Enter> para continuar")
              getChar
              menu (read dados);
              return ()
            }
            tratar_error erro = if isDoesNotExistError erro then do
            {
              arq <- openFile "dados.txt" WriteMode;
              hPutStrLn arq "[]";
              hClose arq;
              imprimiIntroducao
              putStrLn ("\nPressione <Enter> para continuar")
              getChar
              menu [];
              return ()
            }
            else
              ioError erro


-- função que exibe o Menu
menu :: Jogadores -> IO Jogadores
menu dados = do
                system "clear" -- limpa a tela
                putStrLn "--------------------Batalha Naval--------------------"
                putStrLn "\nDigite 1 para cadastrar jogador"
                putStrLn "\nDigite 2 para jogar"
                putStrLn "\nDigite 0 para sair"
                putStr "\nOpção: "
                op <- getChar
                getChar
                executarOpcao dados op

-- função que irá imprimir a introdução do jogo
imprimiIntroducao :: IO ()
imprimiIntroducao = do
                      system "clear" -- limpa a tela
                      handle <- openFile "texto.txt" ReadMode
                      imprimiTextoLentamente handle
                      hClose handle

imprimiTextoLentamente :: Handle -> IO ()
imprimiTextoLentamente handle = do
  texto <- hGetContents handle
  imprimiTextoLentamenteAux texto

imprimiTextoLentamenteAux :: String -> IO ()
imprimiTextoLentamenteAux [] = return ()
imprimiTextoLentamenteAux (x:xs) = do
  putStr [x]
  threadDelay 50000 -- intervalo de 50 milissegundos
  imprimiTextoLentamenteAux xs


-- função para manipular a opção escolhida pelo usuário
executarOpcao :: Jogadores -> Char -> IO Jogadores
executarOpcao dados '0' = do
                            putStr("\nBye!\n")
                            return dados

executarOpcao dados '1' = cadastrarJogador dados
executarOpcao dados '2' = prepararJogo dados
--executarOpcao dados '3'
executarOpcao dados _ = do
                          putStrLn ("\nOpção inválida! Tente novamente...")
                          putStrLn ("\nPressione <Enter> para voltar ao menu")
                          getChar
                          menu dados

-- função responsável pelo cadastro de jogadores
cadastrarJogador :: Jogadores -> IO Jogadores
cadastrarJogador dados = do
                            system "clear" -- limpa a tela
                            putStrLn "                  Cadastro de jogadores                  "
                            nome <- getString "\nDigite um nome de usuário: "
                            if(existeJogador dados nome) then do
                              putStrLn "\nEsse nome já existe, escolha outro."
                              cadastrarJogador dados
                            else do
                              arq <- openFile "dados.txt" WriteMode
                              hPutStrLn arq(show ((Jogador nome 0):dados))
                              hClose arq
                              putStrLn ("\nUsuário " ++ nome ++ " cadastrado com sucesso!")
                              putStrLn ("\nPressione <Enter> para continuar...")
                              getChar
                              menu ((Jogador nome 0):dados)


getString :: String -> IO String
getString str = do
                  putStr str
                  res <- getLine
                  return res

existeJogador :: Jogadores -> String -> Bool
existeJogador dados nome = False

prepararJogo :: Jogadores -> IO Jogadores
prepararJogo dados = do
                      system "clear"
                      putStrLn "--------------------Batalha Naval--------------------"
                      putStrLn "\nDigite 1 para jogar com a máquina"
                      putStrLn "\nDigite 2 para jogar com dois jogadores"
                      putStrLn "\nDigite 3 para redimensionar o tabuleiro"
                      putStrLn "\nDigite 0 para voltar ao menu"
                      putStr "\n\nOpção: "
                      op <- getChar
                      executarOpcaoJogo dados op

executarOpcaoJogo :: Jogadores -> Char -> IO Jogadores
executarOpcaoJogo dados '0' = menu dados
executarOpcaoJogo dados '1' = menu dados 
executarOpcaoJogo dados '2' = menu dados
executarOpcaoJogo dados '3' = menu dados
