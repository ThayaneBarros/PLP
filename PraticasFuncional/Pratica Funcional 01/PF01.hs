import Text.Printf

main :: IO()
main = do
      input <- readLn :: IO Float
      let valor = calculaImposto input
      printf "O valor do imposto de renda retido eh: R$ %.2f\n" valor
      printf "O salario liquido eh: R$ %.2f\n" (input - valor)

calculaImposto :: Float -> Float
calculaImposto valor
                    | valor <= 1903.98 = 0.00
                    | valor <= 2826.65 = 142+0.075*(valor - 1903.98)
                    | valor <= 3751.05 = 354.80+0.15*(valor - 2826.65)
                    | valor <= 4664.68 = 636.13+0.225*(valor - 3751.05)
                    | otherwise = 869.36 +0.275*(valor - 4664.68)