# The following iterative sequence is defined for the set of positive integers:
# 
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# 
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.

cache = Array.new(1_000_000)
cache[0] = cache[1] = 1
max_len, max_i = 1, 1
len = 0
stack = []
1_000_000.times do |i|
  next if cache[i]
  while cache[i].nil?
    stack.push(i)
    i = i % 2 == 0 ? (i >> 1) : (3 * i + 1)
  end
  len = cache[i]
  stack.reverse_each do |i|
    len += 1
    if i < 1_000_000
      cache[i] = len
      if (len > max_len)
        max_len, max_i = len, i
      end
    end
  end
  stack.clear
end

puts max_i
