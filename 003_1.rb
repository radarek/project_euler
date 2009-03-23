# http://projecteuler.net/index.php?section=problems&id=3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

n = 600851475143
pf = 1

2.upto(Math.sqrt(n).floor) do |d|
  pf = d if n % d == 0
  n /= d while n % d == 0
  break if n == 1
end

puts pf 
