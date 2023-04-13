import Text.Printf

calculaImposto :: Float -> String
calculaImposto valor 
                    | valor <= 1903.98 = imprimiSaida valor valor
                    | valor <= 2826.65 = imprimiSaida (142+0.075*(valor - 1903.98)) (valor - (142+0.075*(valor - 1903.98)))
                    | valor <= 3751.05 = imprimiSaida (354.80+0.15*(valor - 2826.65)) (valor - (354.80+0.15*(valor - 2826.65)))
                    | valor <= 4664.68 = imprimiSaida (636.13+0.225*(valor - 3751.05)) (valor - (636.13+0.225*(valor - 3751.05)))
                    | otherwise = imprimiSaida (869.36 +0.275*(valor - 4664.68)) (valor - (869.36 +0.275*(valor - 4664.68)))

imprimiSaida :: Float -> Float -> String
imprimiSaida valorImposto valorSalario = printf "%s %.2f" "O valor do imposto de renda retido eh: R$ " valorImposto 
                                         printf "%s %.2f" "O salario liquido eh: R$ " valorSalario
