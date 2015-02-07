#A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
#The text file, keylog.txt, contains fifty successful login attempts.
#Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.
keylog = [319,680,180,690,129,620,762,689,762,318,368,710,720,710,629,168,160,689,716,731,736,729,316,729,729,710,769,290,719,680,318,389,162,289,162,718,729,319,790,680,890,362,319,760,316,729,380,319,728,716]
keylog.uniq!.sort!
puts keylog.inspect

links = []
keylog.each do |key|
    str = key.to_s.split(//)
    links << [str[0].to_i, str[1].to_i]
    links << [str[1].to_i, str[2].to_i]
    links << [str[0].to_i, str[2].to_i]
end

arr = []
links.flatten.uniq.each do |digit|
    prev = []
    succ = []
    links.each do |link|
        if digit == link[0] then succ << link[1] end
        if digit == link[1] then prev << link[0] end
    end
    arr << [prev.uniq.sort, digit, succ.uniq.sort]
end

result = ""
arr.sort_by!{ |n| n[0].size }.each do |digit|
    puts "#{digit[0]} -- Number #{digit[1]} -- #{digit[2]}"
    result += digit[1].to_s
end

puts result