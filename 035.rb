# http://projecteuler.net/index.php?section=problems&id=35
# 
# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# 
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# 
# How many circular primes are there below one million?
require "prime"

def circular_prime?(prime)
  str = prime.to_s
  return 0.upto(str.size - 1).all? {|i| (str[i..-1] + str[0, i]).to_i.prime? }
end

puts Prime.each(1_000_000).count {|e| circular_prime?(e) }
