--Parenthesization

-- 1.-> 2 + (2*3) -1
-- 2.-> 10 ^ 1 + 1 || (10 ^) $ 1 + 1 || (^ (1 + 1)) 10
-- 3.-> (2 ^ 2) * (4 ^ 5) + 1 ||

z = 7
x = y ^ 2
waxOn = x * 5
y = z + 8

--Exercise 1:
-- Result:
-- 10 + waxOn -> 10 + waxOn
-- (+10) waxOn -> waxOn + 10
-- (-) 15 waxOn -> 15 - waxOn
-- (-) waxOn 15 -> waxOn - 15

-- Exercise 3:
-- triple x = x * 3
-- triple waxOn -> apply (x * 3) to waxOn's result, being that result
-- the input for triple function

-- Exercise 4:
waxOn2 = x * 5
    where x = y ^ 2
          y = z + 8
          z = 7

-- Exercise 5:
triple x = x * 3

-- Exercise 6:
waxOff x = triple x