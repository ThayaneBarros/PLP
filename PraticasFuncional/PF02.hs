calculaValor :: Int -> IO()
calculaValor quant = do
                      itens <- pegaItens quant []
                      putStrLn(show (precoLista itens 0))
                     

pegaItens :: Int -> [String] -> IO [String]
pegaItens quant lista 
                    | quant > 0 = do
                      item <- getLine
                      pegaItens (quant - 1) (item:lista)
                    | otherwise = return lista

precoLista :: [String] -> Int -> Int
precoLista [] valor = valor + 0
precoLista (x:xs) valor = precoLista xs (calcula x + valor)

calcula :: String -> Int
calcula x
        | x == "cafe" = 4
        | x == "pao" = 2
        | x == "suco" = 5
        | x == "pao de queijo" = 5
        | x == "sanduiche" = 3
        | otherwise = 0
