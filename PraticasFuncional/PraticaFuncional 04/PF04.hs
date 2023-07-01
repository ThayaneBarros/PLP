main :: IO()
main = do
      input <- getLine
      newList <- return (filter (\x -> length(x) > 3) (words input))
      putStrLn (imprimi newList)

imprimi :: [String] -> String
imprimi [] = ""
--imprimi [x] = x
imprimi (x:xs) = x ++ " " ++ imprimi xs