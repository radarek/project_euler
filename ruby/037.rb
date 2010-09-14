# http://projecteuler.net/index.php?section=problems&id=37
# 
# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
# 
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
# 
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require "prime"

def truncatable?(n)
  return  (0..n.to_s.size - 1).all? {|i| n.to_s[i..-1].to_i.prime? } &&
          (0..n.to_s.size - 1).all? {|i| n.to_s[0..i].to_i.prime? }
end

primes = []
Prime.take_while do |prime|
  next true if prime < 10
  primes << prime if truncatable?(prime)
  primes.size < 11
end

puts primes.inject(:+)
