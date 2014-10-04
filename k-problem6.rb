#The sum of the squares of the first ten natural numbers is,
#1^2 + 2^2 + ... + 10^2 = 385
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)2 = 552 = 3025
#Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
#Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

sum1 = 0
sum2 = 0
1.upto(100) {|x| sum1 += x**2 }
0.upto(100) {|x| sum2 += x }
sum2 = sum2**2
puts sum2 - sum1