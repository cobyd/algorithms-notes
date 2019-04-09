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
