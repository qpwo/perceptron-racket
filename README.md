## Racket Perceptron

[The perceptron](https://en.wikipedia.org/wiki/Perceptron) is a machine learning algorithm for generating a seperating hyperplane -- for data that is linearly seperable.

I learned about it on [Math Intersect Programming](http://jeremykun.com/2011/08/11/the-perceptron-and-all-the-things-it-cant-perceive/).

### How to use this code

`perceptron.rkt` `provide`s a function called percieve. You hand it labelled points and it returns the coefficients on the hyperplane and a percieving function.

To see an example of how to use it, look at `example.rkt`.
