# http://projecteuler.net/index.php?section=problems&id=99
# 
# Comparing two numbers written in index form like 2^(11) and 3^(7) is not difficult, as any calculator would confirm that 2^(11) = 2048 < 3^(7) = 2187.
# 
# However, confirming that 632382^(518061) > 519432^(525806) would be much more difficult, as both numbers contain over three million digits.
# 
# Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.

puts File.read("base_exp.txt").split("\n").map {|line| line.split(",").map(&:to_i) }.each_with_index.max_by {|(a, b), i| b * Math.log(a) }.last + 1

