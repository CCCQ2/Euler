#Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#1634 = 1^4 + 6^4 + 3^4 + 4^4
#8208 = 8^4 + 2^4 + 0^4 + 8^4
#9474 = 9^4 + 4^4 + 7^4 + 4^4
#As 1 = 1^4 is not a sum it is not included.
#The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

start = Time.new
solution = []
2.upto(1000000) do |num|
    sum = 0
    num.to_s.split(//).each do |digit|
        sum += digit.to_i**5
    end
    sum == num ? (solution << sum) : nil
end
puts solution.inject(:+)
puts "time: #{Time.now.to_f - start.to_f}"
