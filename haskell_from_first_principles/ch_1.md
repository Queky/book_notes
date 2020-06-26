# All You Need is Lambda

## All You Need is Lambda
* _Haskell is a lambda calculus_

## What is functional programming?
* Functions are expressions that are applied to and argument or input and, once applied, can be _reduced_ or _evaluated_
* In haskell functions can be used as values or passed as arguments
* Functional programming languages are all based on the lambda calculus
* **_Referential transparency:_** the same function, given the same values to evaluate, will always return the same result, as they do in math

## What is a function?
* Is a relation between a set of possible inputs and a set of possible outputs
* The input set is known as the domain. The set of possible outputs is the codomain &rarr; set de posibles valores
* Relationship of inputs and outputs is defined by the function
* Output is predictable when you know the input and the function definition

## The structure of lambda terms
* Lambda calculus has three basic components: expressions, variables and abstractions.
    * Expression: refers to a superset of all those things
    * Variables: they are only names for potential inputs to functions
    * Abstraction: is a function. It is a lambda term that has a head (lambda) and a body is applied to an argument (being argument an input value)
        * _f(x)_ = _A_
            * **_f_**: lambda or head
            * **_x_**: argument or input value
            * **_A_**: the result of applying the lambda
        * Consists of two parts: the head and the body
* The act of applying a lambda function to an argument is called _application_

## Alpha equivalence
* **_Alpha equivalence_**: equivalence between lambda terms
    * _λx.x_
    * _λd.d_
    * _λz.z_

## Beta reduction
* Apply 2 to the function
    * (λx.x) 2
        * This function takes the argument _x_ and returns the same argument _x_
    * 2
* When the function is applied to an arguemnt, all instances of _x_ withing the function body must have the same value
    * (λx.x)(λy.y)z
        * Apply left function into right function: Get (λy.y) as input for (λx.x) &rarr; apply _x_ function to _(λy.y)_ input getting _x_ result (in this case _(λy.y)_)
        * Do the same for _z_
    * [x := (λy.y)]
        * As said above: apply first function into second function
    * (λy.y)z
        * Now we have to apply the remaining function for _z_
    * [y := z]
    * z

## Free variables
* The _head_ of the function is to tell us which variables to replace when we apply our function
* **_Free variables_**: Those that are not named in the head
    * (λx.xy)z
    * (λ[x := z].xy)z
    * zy
* Alpha equivalence does not apply to free variables
    * λx.xz != λx.xy
        * They are not equivalent, as z and y might be different
    * λxy.yx = λab.ba
        * Are equivalent due to alpha equivalence

## Multiple arguments
* Each lambda can only bind one parameter and only accept one argument
* Functions that require multiple argument have (multiple) nested heads
    * λxy.xy = λx.(λy.xy)

## Evaluation is simplification
* **_Beta normal form_**: When you cannot beta reduce (apply lambdas to arguments)
* Application is what makes evalutation/simplification possible
* Normal forms means there is nothing left that can be reduced
    * λx.x &rarr; normal form
    * (λx.x)z &rarr; not in beta normal form
        * If reduced: (λx.x)z &rarr; z (beta normal form)

## Combinators
* Is a lambda term with no free variables
* Serve only to combine the arguments they are given
    * Combinators:
        * λx.x
        * λxy.x
        * λxyz.xz(yz)
    * Not combinators (they have free variables):
        * λy.x
        * λx.xz

## Divergence
* Not all reducible lambda terms reduce to a normal form
* **_Divergence_**: reduction process never ends
    * (λx.xx)(λx.xx)
        * Reducing it would _converge_ to beta normal form
        * Recursive function
    * λx.xx &rarr; Not divergence
