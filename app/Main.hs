--{-# LANGUAGE BlockArguments #-}
module Main where

-- http://learnyouahaskell.com
-- RUN with `make start`

-- [1, 5, 10] !! 1 --> Gives 5

-- Tuple
-- (x, y, z)

-- List Comprehensions
-- [ map | binding <- set, filter]
-- [x * 2 | x <- [1..10], x >= 5] --> from set 1-10, double all numbers and return the ones >= 5


-- pattern matching (and recursion)
fib :: (Integral x) => x -> x
fib 0 = 1
fib 1 = 1
fib 2 = 2
fib x = do
  if x < 0 then 0 else fib (x - 1) + fib (x - 2)

-- guards
decide :: (Integral x) => x -> x -> String
decide number number2
  | diff - z < 0 = "way too small"
  | diff == 0 = "nothing"
  | diff <= 100 = "fine"
  | a >= b = "too big"
  | otherwise = "way too big"
  where
    diff = number - number2
    z = 10
    (a, b) = (100, 200)

-- recursion
reverseString :: [String] -> [String]
reverseString [] = []
reverseString (x:xs) = reverseString xs ++ [x]

-- quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:remaining) =
  let lowerSorted = quicksort [l | l <- remaining, l <= x]
      upperSorted = quicksort [u | u <- remaining, u > x]
  in lowerSorted ++ [x] ++ upperSorted

-- factorial
-- i dont care if this is actually factorial - it practices recursion
factorial :: (Integral a) => a -> a
factorial 0 = 0
factorial 1 = 1
factorial x = (x * x) + factorial (x - 1)


rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]

-- this could be done with a list comprehension but whatever
mapList :: (x -> y) -> [x] -> [y]
mapList _ [] = []
mapList fn (x:rest) = fn x : mapList fn rest


sumCurry :: (Integral n) => n -> n -> n
sumCurry x y = x + y
-- 
-- In ts, this is like doing:
-- const sum = (x:number) =>
--    (y: number) => x + y
-- 
-- this is cool because in ts we can do things like:
-- const sumWithFive = sum(5);
-- ...stuff
-- const result = sumWithFive(4)  // 9

-- const add = (a) => (b) => a + b;
-- const add10Curry = add(10);
add10Curry :: (Integral n) => n -> n
add10Curry = (+10)

add :: (Integral a) => a -> a -> a
add a b = a + b

addToTen :: (Integral n) => n -> n
addToTen x = add x 10

addOne :: (Integral n) => n -> n
addOne = (+1)


-- takes a function that takes x y
-- returns a function that takes y x
flippy :: (x -> y -> z) -> (y -> x -> z)
-- flippy f = g
--   where g y x = f x y
flippy fn x y = fn y x



-------

main :: IO ()
-- main = print ([5, 10, 7] !! 1)
-- main = print (decide 1 2)
-- main = print (fib 10)
-- main  = print (factorial 4)
-- main = print (reverseString ["abc", "bcd", "cde"])
-- main = print (quicksort [5, 7, 1, 9, 0, 3, 6, 4, 2])
-- main = print (sumCurry 2 5)
-- main = print (addToTen 5)
-- main = print (mapList addToTen [1, 2, 3, 4, 5])
-- main = print (addOne 1)
main = print (flip zip [1] [2])

