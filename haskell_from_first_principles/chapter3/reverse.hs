-- Exercise 6
module Reverse where

rvrs :: String -> String
rvrs input = drop 9 input
    ++ take 4 (drop 5 input)
    ++ take 5 input

main :: IO()
main = print(rvrs "Curry is awesome")