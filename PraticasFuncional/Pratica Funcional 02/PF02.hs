main :: IO ()
main = do
      input <- readLn :: IO Int
      resul <- pegaItens input
      print resul

pegaItens :: Int -> IO Int
pegaItens quant
  | quant == 0 = return 0
  | quant > 0 = do
                input <- getLine
                proximo <- pegaItens (quant - 1)
                return (calculaValor input + proximo)

calculaValor :: String -> Int
calculaValor x
        | x == "cafe" = 4
        | x == "pao" = 2
        | x == "suco" = 5
        | x == "pao de queijo" = 5
        | x == "sanduiche" = 3
        | otherwise = 0;
