# Hello, Haskel!

## Interacting with Haskell
* **_Prelude_**: is a library of standard functions, which are automatically loaded with `ghci` or `stack ghci`. It can be turned off, and alternatived can be used.

### GHCi commands
* Basic `REPL` (_read-eval-print-loop_) commands for GHCi:
    * `:quit` or `:q`
    * `:info` or `:i`

### Working from source files
* The `.hs` file extension denotes a Haskell source code file
```Haskell
sayHello :: String -> IO ()
sayHello x =
    putStrLn ("Hello, " ++ x ++ "!")
```
* The `::` is a way to write down a type signature. In the example above is like saying `sayHello has the type String -> IO ()`
* To load the file into `GHCi` type:
    ```Haskell
    Prelude> :load <your-file-name>.hs
    *Main> sayHello "Haskell"
    ```
    The output will be:
    ```text
    Hello, Haskell!
    ```
* Loading a file into the REPL means making available its functions
* To return to `Prelude` type `:m` (short for `:module`)

## Understanding expressions
* Everything in Haskell is an expression or declaration
* **Expressions**: Might be values, combination of values or functions applied to values
* Although not all of the programs will be about doing arithmetic, all of Haskell's expressions evaluate to a result in a predictable, transparent manner
* Expressions are the building block of programs, and programs are big expressions made up of smaller expressions
* **Declarations**: They are top level bindings that allow naming expressions
* Expression examples:
    ```Haskell
    1
    ```
    * 1 is printed because it cannot be reduced any further
    ```Haskell
    1 + 2
    ```
    * Reduces `1+2` to `3` and prints it because there are no more terms to evaluate
* **Normal form**: Expressions are in normal form there are no more evaluation steps that can be taken (they have reached an irreducible form)

## Functions
* **Functions**: Expressions are the most basic units of a Haskell program, and a _function_ is a specific type to expression.
* They map an input or set to an output
* Will always evaluate to the same result given the same values
* All functions in Haskell take on argument and return one result
* When different arguments are passed to a function, it applies _currying_
    * **_Currying_**: The technique of converting a function that takes multiple arguments into a sequence of functions that each take a single argument
* Functions are how we factor out a pattern into something we can reuse with different inputs

### Defining functions
* First goes the name of the function, then the formal parameters, then the equal sign, and finally the expression (or body of the function)
    ```Haskell
    Prelude> triple  x   =  x * 3
               [1]  [2] [3]  [4]
    ```
    * In a source file would be the same (leaving just a single space)
    1. Function declaration
    2. Parameter of the function (head of the lambda)
    3. The `=` is to define values and functions
    4. Body of the function
* Function names follow camel case convention

## Evaluation
* Reducing the terms until the expression reaches its simplest form
* Values are irreducible
* Application of functions to arguments are reducible
* Applying a function to an argument allows evaluation or reduction
* Reducible to value:
    ```Haskell
    1 + 1
    2 * 3 + 1
    ```
* Replacing aplication of functions with their definitions you get the same result, like in math
* Haskell doesn't evaluate everything to canonical or normal form by default, it evaluates to weak head normal form (WHNF) by default
    * This means not everything will get to its irreducible form inmediatly

## Infix operators
* Functions in Haskell default to prefix syntax &rarr; function being applied is at the beginning od the expression
* Operators are functions that can be used infix style
* Functions infix style
    ```Haskell
    Prelude> 10 `div` 4
    2

    Prelude> div 10 4
    2

    Prelude> (+) 100 100
    200
    ```
* If the function name is alphanumeric, it is a prefix function by default
* If the name is a symbol, it is infix by default but can be made prefix by wrapping it in parentheses

### Associativity and precedencde
* We can get associativity and precendence information by using `:info` command.
    ```Haskell
    Prelude> :info (*)
    class Num a where
    ...
    (*) :: a -> a -> a
    ...
        -- Defined in ‘GHC.Num’
    infixl 7 *
    ```
    * `infixl` means it's infix operator and is left associative
    * `7` is the precedence (higher is applied first)
    * `*` infix function name

## Declaring values
* The order of delcarations in a source file doesn't matter
    * Check `learn.hs`

### Troubleshooting
* Identation: use spaces, not tabs
* Trailing whitespace is considered bad style
* Code part of an expression should indented under the beginning of that expression
* Parts of the expression that are grouped should be indented to the same level
    ```Haskell
    foo x =
        let y = x * 2
            z = x ^ 2
        in 2 * y * z
    ```
    * Improper identation will cause code not to work
* At least there has to be one space identation when breaking up lines
* Breaking up of lines when exceeding 100 lines
* All declarations in the module must start ay the same column, which is declared by the first declaration in the module
* Haskell comments must start with double dash

## Arithmetic functions in Haskell

| Operator | Name      | Purpose/application                  |
| :------- |:--------- | :----------------------------------- |
| +        | plus      | addition                             |
| -        | minus     | subtraction                          |
| *        | asterisk  | multiplication                       |
| /        | slash     | fractional division                  |
| div      | divide    | integral division, round down        |
| mod      | modulo    | like rem, but after modular division |
| quot     | quotient  | integral division, round toward zero |
| rem      | remainder | remainder after division             |

```Haskell
Prelude> 1 + 1
2
Prelude> 1 - 1
0
Prelude> 1 * 1
1
Prelude> 1 / 1
1.0
Prelude> div 1 1
1
Prelude> mod 1 1
0
Prelude> quot 1 1
1
Prelude> rem 1 1
0
```

### Parenthesization
* `$` can be used to use less parenthesis. With this we add a precedence in the same position where we put the `$` and between expressions or values
    ```Haskell
    Prelude> (2^) (2 + 2)
    16
    -- can replace those parentheses
    Prelude> (2^) $ 2 + 2
    16
    ```
    * `$` evaluates everything to its right first

### Parenthesizing infix operators
* Sectioning a functions that is not conmutative, the order matters
    ```Haskell
    Prelude> (1/) 2
    0.5
    Prelude> (/1) 2
    2.0
    ```

## let and where
* `let` and `where` to introduce components of expressions
* `let` introduces an expression so it can be used wherever you can hace an expression
* `where` is a declaration and is bound to a surrounding syntactic construct