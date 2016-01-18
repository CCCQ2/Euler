# Some positive integers n have the property that the sum [ n + reverse(n) ] consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 904 are reversible. Leading zeroes are not allowed in either n or reverse(n).
# There are 120 reversible numbers below one-thousand.
# How many reversible numbers are there below one-billion (109)?

def odd_digits(x)
    x.to_s.each_char do |char|
        if char.to_i % 2 == 0
            return false
        end
    end
    return true
end

def inverse(x)
y = 0
    while x > 0 do
        y = y*10
        y = y + (x%10)
        x = x/10
    end
    y
end

now = Time.now
counter = 0
for x in 0..1000000000

    if x % 1000000 == 0
        puts "#{x}: #{counter} -- #{Time.now - now}"

    elsif x % 10 == 0
        next

    elsif odd_digits(x + inverse(x))
        counter += 1

    end
end
puts counter
puts "Time: #{Time.now - now}"
