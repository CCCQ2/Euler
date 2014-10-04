#A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
#The text file, keylog.txt, contains fifty successful login attempts.
#Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.

keys = []
keys_file = File.open("keylog.txt", "r")
keys_file.each_line do |line|
	keys << line.to_i
end
puts keys.inspect

