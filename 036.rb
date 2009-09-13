# http://projecteuler.net/index.php?section=problems&id=36
# 
# The decimal number, 585 = 1001001001_(2) (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)

puts (1...1_000_000).find_all {|e| e.to_s == e.to_s.reverse && e.to_s(2) == e.to_s(2).reverse }.inject(:+)

