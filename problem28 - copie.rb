# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

require 'matrix'

class Matrix
	def []=(i, j, x)
		@rows[i][j] = x
	end
end

# Création matrice
rows = 4
m = Matrix.zero(rows)
max = rows * rows
center = (rows / 2).to_i
root = Math.sqrt(rows).to_i
tortue = [0, 0]
sensor = [0, 0, 0, 0]
direction = "D"

# Importance du sens de l'euroulement, génération par le centre ou les cotés
# Aspiration des nombres - 1 2 3 3 4 4 5 4
# Superposing squares

class Cell
	@pos_x = 0
	@pos_y = 0
	@sensor_up = 0
	@sensor_down = 0
	@sensor_left = 0
	@sensor_right = 0
	@value = 0

	def sense

	end
end

max.downto(1).each do |num|

	# Write
	m[tortue[0], tortue[1]] = num

	# Make a snapshot of the surrounding matrix
	vision = Matrix.zero(3)

	# x 0 x
	# 0 X 0
	# x 0 x

	# Top sensor
	if m[tortue[0], tortue[1] + 1] == 0
		vision[0,1] = 0
	elsif m[tortue[0], tortue[1] + 1] == nil
		vision[0,1] = 1
	else
		vision[0,1] = 2
	end

	# Bottom sensor
	if m[tortue[0], tortue[1] - 1] == 0
		vision[2,1] = 0
	elsif m[tortue[0], tortue[1] - 1] == nil
		vision[2,1] = 1
	else
		vision[2,1] = 2
	end

	# Left sensor
	if m[tortue[0] - 1, tortue[1]] == 0
		vision[1,0] = 0
	elsif m[tortue[0] - 1, tortue[1]] == nil
		vision[1,0] = 1
	else
		vision[1,0] = 2
	end

	# Right sensor
	if m[tortue[0] + 1, tortue[1]] == 0
		vision[1,2] = 0
	elsif m[tortue[0] + 1, tortue[1]] == nil
		vision[1,2] = 1
	else
		vision[1,2] = 2
	end

	# Debug vision
	puts " " +  vision[0,1].to_s + " "
	puts vision[1,0].to_s +  "X" + vision[1,2].to_s
	puts " " +  vision[2,1].to_s + " "
	puts "------------"

	# Turn according to vision



	puts tortue[0].to_s + "|" + tortue[1].to_s + " : " + num.to_s
end

puts m
