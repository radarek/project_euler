# http://projecteuler.net/index.php?section=problems&id=12
# 
# The sequence of triangle numbers is generated by adding the natural numbers. So the 7^(th) triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
# 
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# Let us list the factors of the first seven triangle numbers:
# 
#      1: 1
#      3: 1,3
#      6: 1,2,3,6
#     10: 1,2,5,10
#     15: 1,3,5,15
#     21: 1,3,7,21
#     28: 1,2,4,7,14,28
# 
# We can see that 28 is the first triangle number to have over five divisors.
# 
# What is the value of the first triangle number to have over five hundred divisors?

# My solution is based on http://primes.utm.edu/glossary/page.php?sort=Tau

# it return wrong value for 1 but I don't care ;)
def divisors(n)
  d = []
  2.upto(Math.sqrt(n).floor) do |i|
    p = 0
    while n % i == 0
      p += 1
      n /= i
    end
    if p > 0
      d << p
    end
  end
  return d.empty? ? 2 : (d.inject(1) {|acc, pow| acc * (pow + 1) } )
end

def triangle
  a, b = 1, 1
  loop do
    yield a
    b += 1
    a += b
  end
end

puts enum_for(:triangle).find {|x| divisors(x) > 500 }