## 2.1 Asymptotic Notation

This section discusses the different notations used to express asymptotic information about a function.

2 assumptions we're making in general is that n is an element of the set of positive integers, and that any function being discussed is positive for all values of n > n0. Any run-time function will obviously be positive, so this assumption makes sense.

### Big-Theta Notation

Big theta is used for a function that can be described thusly:

c1(g(n)) <= f(n) <= c2(g(n)) for n > n0

Such a function is said to be Theta(g(n))

An intuitive example is the function `f(n) = 3n^2 + 10n`, for g(n) == n^2, it is clear that c1(n^2) < n^2 + 10n < c2n^2.

```
c1 < 1 - 10/n < c2 # Divide by n^2
1/2 < 1 - 10/21 < 1 # plug in values for c1, c2, and n0
```

As n increases higher, the expression above will approach 1, but not get there. The theta notation means that for large enough input, the best case and worst case performance of a function will be within a constant factor of each other. Innsertion sort is an example of a function that cannot be defined with theta notation because if the input is sorted, the compute time with be some constant factor of n. If the input is not sorted, it can take up to a constant factor of n^2. The best and worst cases for any 2 given ns, therefore, cannot be described as a constant factor apart.

### Big O and Omega notation

Big O and Omega notations are the pieces of big theta, taken separately. Big O describes the asymptotic upper bound, and big Omega, the lower bound. The insertion sort example is O(n^2) but Omega(n).

### Little o and omega notation

Little o and omega notations go a step further than saying a function is bounded by _some_ constant factor. It says that a function is bounded by _all_ constant factors. For example, f(n) = 2n is o(n^2) because for any positive constant c, there is some input size n that will make cn^2 > 2n. For c = .1, let's say, n could be 25. .1 \* 625 > 50. And that will hold for every value of n greather than 25 as well.

Little omega is the opposite, in that it bounds the lower end of a function. For any positive c, there exists n such that: cg(n) <= f(n)

### Useful properties

Transitivity:

â(n) = (g(n)) and g(n) = (h(n)) imply â(n) = (h(n)),

â(n) = O(g(n)) and g(n) = O(h(n)) imply â(n) = O(h(n)),

â(n) = (g(n)) and g(n) = (h(n)) imply â(n) = (h(n)),

â(n) = o(g(n)) and g(n) = o(h(n)) imply â(n) = o(h(n)),

â(n) = (g(n)) and g(n) = (h(n)) imply â(n) = (h(n)).
Reflexivity:

â(n) = (â(n)),

â(n) = O(â(n)),

â(n) = (â(n)),
Symmetry:

â(n) = (g(n)) if and only if g(n) = (â(n)).
Transpose symmetry:

(n) = O(g(n)) if and only if g(n) = (f(n)),

(n) = o(g(n)) if and only if g(n) = ((n)).
Because these properties hold for asymptotic notations, one can draw an analogy between the asymptotic comparison of two functions f and g and the comparison of two real numbers a and b:

(n) = O(g(n)) a b,

(n) = (g(n)) a b,

(n) = (g(n)) a = b,

(n) = o(g(n)) a < b,

(n) = (g(n)) a > b.
One property of real numbers, however, does not carry over to asymptotic notation:

Trichotomy: For any two real numbers a and b, exactly one of the following must hold: a < b, a = b, or a > b.

## 2.2 Standard Notations and Common Functions

This sections delves into common math notations and identies. Specifically exponent and logarithm rules, factorials, fibonacci numbers, etc... Nothing that is really worth note-taking on if one is already familiar with these things.
