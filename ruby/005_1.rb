# http://projecteuler.net/index.php?section=problems&id=5
# 
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

puts 1.upto((2..20).inject(:*)).each {|n| break n if (2..20).all? {|e| n % e == 0} } 
