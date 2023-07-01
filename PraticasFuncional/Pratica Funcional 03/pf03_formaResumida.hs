
main :: IO ()
main = do
        input <- readLn :: IO [Int]
        newList <- return (listNoRepeat input [])
        if(newList == []) then putStrLn ("nenhum numero foi sorteado")
        else imprimi newList input (length newList)
        
listNoRepeat :: [Int] -> [Int] -> [Int]
listNoRepeat [] l = l
listNoRepeat (x:xs) l
                    | not (x `elem` l) = listNoRepeat xs (l ++ [x])
                    | otherwise = listNoRepeat xs l
                
imprimi :: [Int] -> [Int] -> Int -> IO ()
imprimi [] _ _ = putStr ("")
imprimi _ _ 0 = putStrLn ("")
imprimi (x:xs) l n = do
                    putStrLn (show(x) ++ " foi sorteado " ++ show(length (filter (\y -> y==x) l)) ++ " vez(es)")
                    imprimi xs l (n-1)