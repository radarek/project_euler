# solution for ruby >= '1.9' (depends on 'prime' stdlib library)
require "prime"

num = step = (2..20).select(&:prime?).inject(:*)
until (2..20).all? {|d| num % d == 0 }
  num += step
end
puts num
