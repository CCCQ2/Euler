#Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
#1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

fib = Enumerator.new do |yielder|
    i = 0
    j = 1
    loop do
        i, j = j, i + j
        yielder.yield i
    end
end

total = 0
fib.take_while{ |n| n <= 4E6 }.find_all{|i| i % 2 == 0}.entries.each_with_index do |n, index|
    puts index.to_s + " - " + n.to_s
    total += n
end
puts total

# In a range of 0..4000000
# Create a fibonacci visual expansion with arcs
# Create a dotted effect to enhance render times
# Transform area to numbers
# Filter even numbers
