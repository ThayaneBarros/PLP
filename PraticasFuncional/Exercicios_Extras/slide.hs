dobro :: Int -> Int
dobro x = sum[1..10]

main :: IO()
main = do 
  num <- readLn :: IO [[Int]]
  putStrLn (show (unifica num))
 -- putStrLn (show (head2 lista))
 -- putStrLn (show (tail2 lista))
--  putStrLn (show (length2 lista))
--  putStrLn (show (pertence 4 lista))
 -- putStrLn (show (pertence 6 lista))
 -- putStrLn (show (reverse2 lista))
 -- putStrLn (show (take2 2 lista))
 -- putStrLn (show (drop2 2 lista))

unifica :: [[Int]] -> [Int]
unifica [] = []
unifica (x:xs) = x ++ unifica xs

plural :: [String] -> Int
plural lista = length((filter(\x -> last x == 's') lista))

removeString :: String -> String
removeString "" = ""
removeString (x:xs)
  | x `elem` ['a'..'z'] = removeString xs
  | otherwise = [x] ++ removeString xs

maior :: [Int] -> Int
maior [x] = x 
maior (x:xs)  
  | (maior xs) > x = maior xs
  | otherwise = x

addEspacos :: Int -> String
addEspacos 1 = " "
addEspacos n = " " ++ addEspacos (n-1)

paraDireita :: Int -> String -> String
paraDireita n texto = (addEspacos n) ++ texto

procuraA :: [String] -> [String]
procuraA lista = filter(\x -> head x == 'a') lista

somaLista :: [Int] -> [Int]
somaLista li = [n^2|n <- li]

obterPremio :: Int -> Float
obterPremio n
  | n >= 1 && n <= 10 = 100.00
  | n <= 20 = 200.00
  | n <= 30 = 300.00
  | n <= 40 = 400.00
  | n >= 41 = 500.00

ehPar :: Int -> Bool
ehPar n
  | n`mod`2 == 0 = True
  | otherwise = False

imprimiTexto :: String -> Int -> IO()
imprimiTexto texto n
  | n <= 1 = do 
            putStrLn texto 
  | otherwise = do 
            putStrLn texto
            imprimiTexto texto (n-1)

ehPrimo :: Int -> Bool
ehPrimo 1 = False
ehPrimo n 
  | proxDiv n 2 == n = True
  | otherwise = False

proxDiv :: Int -> Int -> Int
proxDiv n i 
  | n `mod` i == 0 = i 
  | otherwise = proxDiv n (i+1)

pares :: Int -> Int -> String
pares n1 n2 
  | n1 == n2 && ehPar n1 = show n1
  | n1 == n2 = ""
  | n1 < n2 && ehPar n1 = show n1 ++ pares (n1+1) n2
  | n1 < n2 = pares (n1+1) n2

head2 :: [Int] -> Int
head2 (x:xs) = x 

tail2 :: [Int] -> [Int]
tail2 [] = []
tail2 (x:xs) = xs 

length2 :: [Int] -> Int 
length2 [] = 0
length2 (x:xs) = 1 + length2 xs

pertence :: Int -> [Int] -> Bool
pertence n [] = False
pertence n (x:xs)
  | n == x = True
  | otherwise = pertence n xs 

reverse2 :: [Int] -> [Int]
reverse2 [] = []
reverse2 (x:xs) = reverse2 xs ++ [x]

take2 :: Int -> [Int] -> [Int]
take2 0 lista = []
take2 n [] = []
take2 n (x:xs) = [x] ++ take (n-1) xs

drop2 :: Int -> [Int] -> [Int]
drop2 0 l = l 
drop2 n [] = []
drop2 n (x:xs) = drop (n-1) xs