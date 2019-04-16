# Chapter 4 - Recurrences

A recurrence is an equation or inequality that describes a functions in terms of itself on a smaller input. In Ch. 1 we discuessed merge sort as:

```
T(n):

O(1) when n == 1
2T(n/2) + O(n) otherwise
```

There are 3 main ways to solve recurrences:

- Substitution
- Iteration
- Master method

A few assumptions/technicalities: We generally think of input as integers, and forego the floor, or ceiling notation, even though it's implied. Sometimes the inclusion of the specific notation will matter, but it takes experience to know those cases.

## 4.1 The Substitution Method

Substitution is essentially the guess-and-check way of solving a recurrence. It involves guessing the bounds (upper, lower, or both) of a function, then substituting your guess and proving it by induction.

An example: `T(n) = 2T(|n/2|) + n`

This looks similar to merge sort, so we would guess that this is bounded by O(nlogn). If we plug in our "guess" we get:

`T(n) = 2T(|n/2|) + n <= cnlogn` for n > n0

`T(n) = 2(cn/2) * log(n/2)) + n`

`... cn * log(n/2) + n`

`... cn * log(n) - cn * log(2) + n`

`... cn * log(n) - cn + n` # log is log base 2

`T(n) <= cnlog(n)` # - cn + n is negative for c > 1, so T(n) is only bounded in this case for c >= 1

### Subtleties

Sometimes you need to massage the assumption to get this method to work.

Consider:

`T(n) = T(n/2) + T(n/2) + 1`

We guess T(n) = O(n), so

`T(n) = c(n/2) + c(n/2) + 1`

`T(n) = cn + 1` # This is not <= cn

To overcome this, we can subtract a lower order term in our substition:

`T(n) = c(n/2) - b + c(n/2) - b + 1`

`... cn - 2b + 1`

`T(n) <= cn - b` # when b >= 1, which means T(n) <= cn so it is O(n)

### Pitfalls

Avoid substituing the wrong values. Imagine the recurrence `T(n) = 2T(|n/2|) + n` again. If you claim that it is O(n), you could substitute `2(cn/2) + n` => `cn + n`. This does not check out though because cn + n is greater than cn. O(n) is only proved if f(n) <= cn.

### Changing Variables

Sometimes you need to manipulate the function to make a better guess. Consider:

`T(n) = 2T(sqrt(n)) + log(n)`

This is a difficult reccurence, but sub in m for log(n) and you get

`T(2^m) = 2T(2^(m/2)) + m`

Then we can write a new recurrence

`S(m) = 2S(m/2) + m` # This is now in the familiar form. We know this is O(mlog(m))

`T(n) = O(mlog(m)) = O(log(n) * log(log(n)))`

## 4.2 The Iteration Method

The iteration method consists of building out the summation of each recursion and then solving the algebra to arrive at a solution.

EX.

`T(n) = 3T(n/4) + n`

`= n + 3(n/4 + T(n/16))`

`= n + 3(n/4 + 3(n/16 + T(n/64))) ...`

`= n + 3n/4 + 9n/16 + 27n/64 ...`

Intuitively, the denominator is increasing by a factor of 4, and the n term is multiplied by a factor of 3 each time. So each term is getting smaller and smaller. One must continue summing until the next T(n) term is 1. So for higher n, you will need more terms, but as stated, the higher the merginal value of n, the lower the marginal value of the function. So we know this function will work out to O(n) or lower.

The math:

The final term can be written as 3^log(base4)(n) \* O(1) # TODO: How is this term derived?

The series can be rewritten as:

`n * summation 0 to inf((3/4)^i + O(n^log(base4)(3)))` # rewrite the log using log rules

`4n + O(n) == O(n)` # Sum of 3/4 is 4 and log(base4)(3) is < 1 so it is O(n)

## 4.3 The Master Method

`T(n) = aT(n/b)+â(n)`

Where a >= 1 and b > 1 are constants, and â(n) is an asymptotically positive function.

The above recurrence solves for the runtime of an algorithm that divides a problem of size n into a sub-problems, each of size n/b.

There are 3 basic cases that tell you the complexity of T(n):

1. If the work to break up the problems outweighs the work to combine the results, then the function is leaf-heavy and it will be O(n^log(base(b))(a))

2. If the work of each side is comparable, then the fucntion is O(n^log(base(b))(a) \* log(n))

3. If the work of recombining outweighs the work to break up the problem, the problem is node heavy, and the function is simply dominated by the recombining function, so O(â(n))

These cases are not all inclusive. If a function â(n) is smaller than n^log(base(b))(a), but not polynomially smaller, or the same for larger, then this method can't be used. Most asymptotically bound functions will fall into one of the 3 cases though.

### Using the Master Method

Consider `T(n) = 9T(n/3) + n`

Each time we perform recurscion, we make 9 new problems of size n/3. This already sounds like a lot of work. Let's plug it into the theorem.

a = 9
b = 3

The expression n^log(base(b))(a) works out to n^2, which is polynomially larger than n, so T(n) = O(n^2)

Consider `T(n) = T(2n/3) + 1`

a = 1
b = 3/2

The expression is n^log(1) == 0, so O(1), and â = O(1), so this will be case 2. We tack on a factor of log(n), getting: O(log(n))

Consider `T(n) = 3T(n/4) + n lg n`

a = 3
b = 4

The expression n^(.793) < n \* log(n) for high enough values of n, so T(n) = O(nlog(n))

### Exercises

`T(n) = 4T(n/2) + n`

a = 4
b = 2

O(n^2) >> O(n) => O(n^2)

`T(n) = 4T(n/2) + n^2`

a = 4
b = 2

O(n^2) ~~ O(n^2) => O(n^2log(n))

`T(n) = 4T(n/2) + n3`

O(n^2) << O(n^3) => O(n^3)

```The running time of an algorithm A is described by the recurrence T(n) = 7T(n/2) + n^2. A competing algorithm A' has a running time of T'(n) = aT'(n/4) + n^2. What is the largest integer value for a such that A' is asymptotically faster than A?

```

log(base(2)(7) = log(base(4)(a))

flor(4 ^ log(base(2)(7)) = largest value of a
