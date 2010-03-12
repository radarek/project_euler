# http://projecteuler.net/index.php?section=problems&id=19
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
require "date"

puts (1901..2000).map {|year| (1..12).count {|month| Date.parse("#{year}-#{month}-01").wday == 0 } }.inject(:+)

