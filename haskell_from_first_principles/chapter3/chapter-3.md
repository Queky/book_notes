# Strings

## A first look at types
* To find out the type of a value we can use `:type` on the REPL
    ```Haskell
    Prelude> :type 'a'
    'a' :: Char
    ```
* The `::` can be read as _"has the type"_.
* A type signature is a line of code that defines the types for a value, expression or function
* Use double quotation to tell GHCi we have a String
    ```Haskell
    Prelude> :type "hello"
    "hello" :: [Char]
    ```
* `String` is a _type alias_ for a list of Char

## Printing simple strings
* `print` can be used to print different types of data to the screen
* `putStr` prints strings to the screen, but is specific to String
* `:set prompt "a> "` will set prompt to the specified value, and won't change everytime you load or unload a module
* `IO` is a special type, used when the result of running a program involves effects beyond evaluating a function or expression
* Define values at the top level of a module
* Specify explicit types for top-level definitions
* We can concatenate strings with `++` and `concat`

## Types of concatenation functions
```Haskell
    (++) :: [a] -> [a] -> [a]
    --      [1]    [2]    [3]
```
* The `a` inside the list type constructor is the type
1. Take an argument of type `a`
2. Take another argument of type `a`
3. Return a result of type `a`

* The type variable `a` in `[a]` is polymorphic.
* We cannot concatenate a list of numbers with a list of characters

## More list functions
* As `String` is a list of `Char` values, you can use the standard list operations on strings
* The `:` operator builds lists
    ```Haskell
    Prelude> 'c' : "hris"
    "chris"
    ```
* `head` returns the first element of a list
    ```Haskell
    Prelude> head "Papuchon"
    'P'
    ```
* `tail` returns the list with the `head` chopped of:
    ```Haskell
    Prelude> tail "Papuchon"
    "apuchon"
    ```
* `take` returns the specified number of elements from the list
    ```Haskell
    Prelude> take 2 "Papuchon"
    "Pa"
    ```
* `drop` return the remainder of the list after the specified number of element
    ```Haskell
    Prelude> drop 2 "Papuchon"
    "puchon"
    ```
* The `!!` return the element that is in the specified position
    ```Haskell
    Prelude> "Papuchon" !! 1
    'a'
    ```
* **_Note_**: Many of them are considered unsafe as they don't know how to handle an empty list
