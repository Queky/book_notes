{--
Exercise 1
a) concat [[1, 2, 3], [4, 5, 6]] -> correct
b) ++ [1, 2, 3] [4, 5, 6] -> incorrect
   (++) [1, 2, 3] [4, 5, 6]  -> correct
c) (++) "hello" " world" -> correct
d) ["hello" ++ " world] -> incorrect
   ["hello" ++ " world"] -> correct
e) 4 !! "hello" -> incorrect
   "hello" !! 4 -> correct
f) (!!) "hello" 4 -> correct
g) take "4 lovely" -> incorrect
   take 4 "lovely" -> correct
h) take 3 "awesome" ->  correct

Exercise 2
a) d
b) c
c) e
d) a
e) b

--}

-- Functions 2
first :: String -> String
first x = x ++ "!"

second :: String -> String
second x = [x !! 4]

third :: String -> String
third x = drop 9 x

-- Functions 3
func3 :: String -> Char
func3 x = x !! 3

-- Functions 4
curryAwesome :: String
curryAwesome = "Curry is awesome"
func4 :: Int -> Char
func4 x = curryAwesome !! x

-- Function 5
func5 :: String
func5 = drop 9 curryAwesome
    ++ take 4 (drop 5 curryAwesome)
    ++ take 5 curryAwesome
