## 1.1 Algorithms

An algorithm is a "well-defined computational procedure that takes (input and produces output)". An algorithm can also be a "tool for solving a well-specified computational problem", such that the computational problem defines a desired input/output relationship, and the algorithm defines a specific procedure for cheiving that relationship.

An algorithm is correct if it halts with the correct output for every input.

### Insertion Sort

Ruby Implementation:

```
def insertion_sort(arr)
  (1..arr.count - 1).each do |j|
    key = arr[j]
    i = j - 1
    # Insert arr[j] into the sorted sequence arr[0 . . j]
    while i >= 0 && arr[i] > key do
      arr[i + 1] = arr[i]
      i = i - 1
    end
    arr[i + 1] = key
  end
  arr
end
```

Insertion sort is a sorting algorithm that sorts "in place". A constant number of elements are stored outside of the array memory at any time. In particular, 1 element is stored outside of the array at any time, `key`.

## 1.2 Analyzing Algorithms

Analyzing an algorithm means predicting the resources said algorithm requires. Compute time is usually most important, but memory, bandwidth, or logic gates can also be the primary focus.

To analyze an algorithm, you need a compute model. For this book, we mostly use 1 CPU + some RAM.

### Analyzing Insertion Sort

To define the input size of an algo depends on the question. For multiplication, the number of bits required to store the numbers would be the input size. For sorting, we use the number of items to be sorted as the input size.

To define the running time of an algo, we assume that the time it takes to execute 1 line of code is constant. We abstract that time to a "step" and the running time is measured in steps.

For insertion sort, we can break each line into a cost per call, and a count of calls:

| code                              | cost   | count                                                                      |
| --------------------------------- | ------ | -------------------------------------------------------------------------- |
| `(1..arr.count - 1).each do`      | 1 unit | n times                                                                    |
| `key = arr[j]`                    | 1 unit | n-1 times                                                                  |
| `i = j - 1`                       | 1 unit | n-1 times                                                                  |
| `while i >= 0 && arr[i] > key do` | 1 unit | Sum from 1 to n-1 of t, where t is how many times the while loop evaluates |
| `arr[i + 1] = arr[i]`             | 1 unit | Sum from 1 to n-1 of t-1                                                   |
| `i = i - 1`                       | 1 unit | Sum from 1 to n-1 of t-1                                                   |
| `arr[i + 1] = key`                | 1 unit | n-1 times                                                                  |
| `arr`                             | 1 unit | 1 time                                                                     |

We can describe the cost to run the algorithm as the dot product of cost \* count.

A best case scenario is the input array is already sorted. This makes t = 1, because the while loop does not need to be evaluated further. In this case, we end up with some C*n terms and some C*(n-1) terms, and we can say it's shape is an + b, or "linear".

A worst case scenario is the input array is in reverse order. This makes t = (n-1)/2, summed n times, creates a term of n^2 - n. The shape of the function becomes an^2 + bn + c, or "quadratic".

### Worst case and average case analysis

From now on, we will mostly focus on worst case analysis.

Worst case is an upper bound, so the algorithm is guaranteed to perform no worse than worst case.

Average case often approximates worst case, and it's difficult to model average input for a real problem.

### Order of growth

We are already abstracting the actual time costs by using constants (a, b, c). What we really care about with order of growth is the fastest growing term. So we can abstract further. an^2 + bn + c can be considered O(n^2).

## 1.3 Designing Algorithms

So far we've discussed incremental algos. Insertion sort maintains and ordered sub list, and an unordered remainder.

### 1.3.1 Divide and Conquer

Some algos are _recursive_, and follow a divide and conquer strstegy.

Divide: Break a problem up into multiple sub problems

Conquer: Break down the problem further with recursion, or simply solve the base case

Combine: Solve the original problem by combining the solutions to the sub problems

An example of this idea is merge sort. At a high level, merge sort takes an unsorted list, recursively divides it until each dividion is 1 element (sorted list). Then it combines each recursive piece using the auxillary method `merge`. Merging takes 2 sorted lists, and combines them into 1 sorted list element by element, moving the smallest element out of the minimum of the first element in the 2 arrays to the next available spot in the 1 array. This is done until there is only one sorted list left.

### 1.3.2 Analyzing Divide and Conquer

For input of size n, the time it takes to run merge sort is 2T(n/2)+O(n). T(x) is a function to count the runtime of recurring over an input of size x. O(n) is the runtime of the `merge` function.

## 1.4 Summary

For high values of input length, a good algorithm running on a bad computer is better than a bad algo running on the best computer.

## Problems

### 1.2 Insertion sort on small arrays in merge sort

Although merge sort runs in (n lg n) worst-case time and insertion sort runs in (n2) worst-case time, the constant factors in insertion sort make it faster for small n. Thus, it makes sense to use insertion sort within merge sort when subproblems become sufficiently small. Consider a modification to merge sort in which n/k sublists of length k are sorted using insertion sort and then merged using the standard merging mechanism, where k is a value to be determined.

#### a) Show that the n/k sublists, each of length k, can be sorted by insertion sort in (nk) worst-case time

Insertion sort runs in an^2 + bn + c. If k is the length of the lists to be sorted by insertion sort, and n is the length of the list being sorted by merge sort, then the k term factors out in (n/k)(ak^2 + bk + c) to be ank + bn + cn/k, which is O(kn).

#### b) Show that the sublists can be merged in (n lg(n/k)) worst-case time.

Merging 2 lists is O(n). If there are (n/k) lists to merge, and every "round" of merging reduces that number by a factor of 2, then you need to run the merge 2 lists function log(n/k) times, arriving at O(nlog(n/k))

#### c) Given that the modified algorithm runs in (nk + n 1g(n/k)) worst-case time, what is the largest asymptotic (-notation) value of k as a function of n for which the modified algorithm has the same asymptotic running time as standard merge sort?

Standard merge sort runs in O(nlog(n)). The modified is approximately equivalent if the value of k == log(n), because you can replace O(nk) with O(nlog(n))

#### d) How should k be chosen in practice?

K should be chosen after testing insertion sort and merge sort on inputs of various sizes and picking the size at which the cost of either is equivalent to the cost of the other.

### 1.3 Inversions

Let A[1 . . n] be an array of n distinct numbers. If i < j and A[i] > A[j], then the pair (i, j) is called an inversion of A.

#### a) List the five inversions of the array 2, 3, 8, 6, 1.

[0,4], [1,4], [2,4], [3,4], [2,3]

#### b) What array with elements from the set { 1,2, . . . , n} has the most inversions? How many does it have?

[n, n-1, ... 2, 1]. n makes n-1 inversions, n-1 makes n-2 inversions, so the number of inversions total would be the sum from i=1 to n-1 of n - i.

#### c) What is the relationship between the running time of insertion sort and the number of inversions in the input array? Justify your answer.

The number of inversions in an array is equal to the number of times the while loop is executed in insertion sort. For instance, in the array from section b: n-1 must move 1 time to be sorted in front of n. n-2 must move 2 times. The sum of times that all of the elements will need to move is the equivalent sum from section b.

#### d) Give an algorithm that determines the number of inversions in any permutation on n elements in (n 1g n) worst-case time. (Hint: Modify merge sort.)

You would add this accumulator to merge sort: count the number of times that the value from arr2 gets added, when there are values left in arr1. In a sorted list (no inversions), arr1 will fully clear before arr2 in every case. For a reverse-sorted list, the exact opposite will happen. Arr2 will clear first for every subset.
