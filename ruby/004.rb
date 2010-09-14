# http://projecteuler.net/index.php?section=problems&id=4
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

a, b = (100..999).to_a.product((100..999).to_a).
  select {|a, b| "#{a * b}" == "#{a * b}".reverse }.
  max_by {|a, b| a * b }
puts "#{a} x #{b} = #{a * b}" 
