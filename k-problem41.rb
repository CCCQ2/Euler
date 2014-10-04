#We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#What is the largest n-digit pandigital prime that exists?

require "mathn"
puts %w[7 6 5 4 3 2 1].permutation.map(&:join).select{|n| n.to_i.prime?}.max
