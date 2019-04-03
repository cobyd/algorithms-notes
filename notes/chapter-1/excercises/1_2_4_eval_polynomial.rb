def eval_polynomial(coefs, x)
  sum = 0
  (0...coefs.count).each do |i| # O(n)
    product = 1
    (0...i).each do |j| # O(n)
      product *= x
    end
    sum += coefs[i] * product 
  end
  sum
end


# The horner method works by starting backwards with the coefs, so that each time
# it loops, another x gets multiplied into the return value
# Finally, we add the last coef (x^0) on its own with no factors of x
def eval_polynomial_horner(coefs, x)
  horner_idx = coefs.count - 1
  ret = 0
  while horner_idx > 0
    ret = (ret + coefs[horner_idx]) * x
    horner_idx -= 1
  end
  ret += coefs[0]
end

puts eval_polynomial([0, 4, 1], 3)
puts eval_polynomial([10, 4, 3, 5, 23, 2], 21)
puts eval_polynomial([7, 0, 10, 0, 1], -2)

puts eval_polynomial_horner([0, 4, 1], 3)
puts eval_polynomial_horner([10, 4, 3, 5, 23, 2], 21)
puts eval_polynomial_horner([7, 0, 10, 0, 1], -2)