import Text.Printf

calculaImposto :: Float -> IO ()
calculaImposto valor 
                    | valor <= 1903.98 = putStrLn(imprimiSaida impostoRenda salarioLiquido)
                    | valor <= 2826.65 = putStrLn(imprimiSaida impostoRenda salarioLiquido)
                    | valor <= 3751.05 = putStrLn(imprimiSaida impostoRenda salarioLiquido)
                    | valor <= 4664.68 = putStrLn(imprimiSaida impostoRenda salarioLiquido)
                    | otherwise = putStrLn(imprimiSaida impostoRenda salarioLiquido)
                    where impostoRenda = calculaImpostoRetido valor
                          salarioLiquido = valor - impostoRenda

calculaImpostoRetido :: Float -> Float
calculaImpostoRetido valor
                    | valor <= 1903.98 = 1903.98
                    | valor <= 2826.65 = 142+0.075*(valor - 1903.98)
                    | valor <= 3751.05 = 354.80+0.15*(valor - 2826.65)
                    | valor <= 4664.68 = 636.13+0.225*(valor - 3751.05)
                    | otherwise = 869.36 +0.275*(valor - 4664.68)

imprimiSaida :: Float -> Float -> String
imprimiSaida impostoRenda salarioLiquido =
  printf "O valor do imposto de renda retido eh: R$ %.2f\n" impostoRenda ++
  printf "O salario liquido eh: R$ %.2f" salarioLiquido
