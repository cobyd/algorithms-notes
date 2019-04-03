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

|code|cost|count|
|`(1..arr.count - 1).each do |j|`|1 unit|n times|
|`key = arr[j]`|1 unit|n-1 times|
|`i = j - 1`|1 unit|n-1 times|
|`while i >= 0 && arr[i] > key do`|1 unit|Sum from 1 to n-1 of t, where t is how many times the while loop evaluates|
|`arr[i + 1] = arr[i]`|1 unit|Sum from 1 to n-1 of t-1|
|`i = i - 1`|1 unit|Sum from 1 to n-1 of t-1|
|`arr[i + 1] = key`|1 unit| n-1 times|
|`arr`|1 unit|1 time|

We can describe the cost to run the algorithm as the dot product of cost \* count.

A best case scenario is the input array is already sorted. This makes t = 1, because the while loop does not need to be evaluated further. In this case, we end up with some C*n terms and some C*(n-1) terms, and we can say it's shape is an + b, or "linear".

A worst case scenario is the input array is in reverse order. This makes t = (n-1)/2, summed n times, creates a term of n^2 - n. The shape of the function becomes an^2 + bn + c, or "quadratic".

### Worst case and average case analysis

From now on, we will mostly focus on worst case analysis.

Worst case is an upper bound, so the algorithm is guaranteed to perform no worse than worst case.

Average case often approximates worst case, and it's difficult to model average input for a real problem.

### Order of growth

We are already abstracting the actual time costs by using constants (a, b, c). What we really care about with order of growth is the fastest growing term. So we can abstract further. an^2 + bn + c can be considered O(n^2).
