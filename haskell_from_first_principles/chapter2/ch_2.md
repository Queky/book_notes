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
