# http://projecteuler.net/index.php?section=problems&id=48
# 
# The series, 1^(1) + 2^(2) + 3^(3) + ... + 10^(10) = 10405071317.
# 
# Find the last ten digits of the series, 1^(1) + 2^(2) + 3^(3) + ... + 1000^(1000).
puts (1..1000).map {|n| n ** n }.inject(:+).to_s[-10..-1]
