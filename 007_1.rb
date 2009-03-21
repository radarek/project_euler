# http://projecteuler.net/index.php?section=problems&id=7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6^(th) prime is 13.
# 
# What is the 10001^(st) prime number?

i = 2
primes = []
loop do
  primes << i if (2..Math.sqrt(i).floor).all? {|e| i % e != 0 }
  i += 1
  break if primes.size == 10001
end

puts primes.last 
