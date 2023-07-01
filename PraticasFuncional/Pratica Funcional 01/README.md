# 📘 Prática Funcional 1

## 📝 Descrição

Pedro é um contador e precisa de ajuda para saber o valor do imposto de renda retido do salário bruto dos seus clientes.

O cálculo do valor retido é feito de acordo as faixas de tributação:

    Para salários iguais ou inferiores a R$ 1.903,98, não há imposto a ser pago.
    Para salários entre R$ 1.903,99 e R$ 2.826,65, o imposto a ser pago é de R$ 142,80 mais 7,5% da diferença entre o salário e o piso da faixa de tributação (R$ 1.903,99).
    Para salários entre R$ 2.826,66 e R$ 3.751,05, o imposto a ser pago é de R$ 354,80 mais 15% da diferença entre o salário e o piso da faixa de tributação (R$ 2.826,66).
    Para salários entre R$ 3.751,06 e R$ 4.664,68, o imposto a ser pago é de R$ 636,13 mais 22,5% da diferença entre o salário e o piso da faixa de tributação (R$ 3.751,06).
    Para salários acima de R$ 4.664,68, o imposto a ser pago é de R$ 869,36 mais 27,5% da diferença entre o salário e o piso da faixa de tributação (R$ 4.664,68).

Exemplo: se o salário é de R$3000, cai na 3a faixa de tributação, logo o cálculo do imposto é 354,80 + 0,15\*(3000 - 2826,66) = 380,80

Crie um programa em que ajude Pedro a descobrir o valor total dos impostos a serem pagos com base no salario informado e o salário líquido do cliente.

## 📌 Entrada

- O valor do salário do cliente

## 📌 Saídas

- O valor do imposto retido (com duas casas decimais)

- O valor do salário líquido do cliente (com duas casas decimais)

## ⬆️ Input

```
3000
```

## ⬇️ Output

```
O valor do imposto de renda retido eh: R$ 380.80

O salario liquido eh: R$ 2619.20
```
