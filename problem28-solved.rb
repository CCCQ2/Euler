# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

class Map
	attr_accessor :size, :map, :center

	def initialize(size)
		# Create map
		@size = size
		@map = []
		for x in 0..@size - 1
			@map[x] = []
			for y in 0..@size - 1
				@map[x][y] = 0
			end
		end

		# Find center
		@center = size / 2
		self.update(@center, @center, 1)
	end

	def check(x, y)
		if @map[y][x] == 0
			return false
		else
			return true
		end
	end

	def update(x, y, value)
		@map[y][x] = value
	end

	def diagonal_sum
		diagonals = []
		# First diagonal - Top left to bottom right
		for x in 0..size-1
			diagonals << @map[x][x]
			diagonals << @map[x][size - x - 1]
		end
		return diagonals.uniq!
	end

	def display
		for y in 0..size - 1
			puts @map[y].join(' ')
		end
		puts "- " * @size
	end
end

# Create iterator class
class Tortue
	attr_accessor :map, :x, :y, :next_x, :next_y, :direction, :value, :alive

	def initialize(map, x, y)
		@map = map
		@x = x
		@y = y
		@next_x = x
		@next_y = y
		@direction = "EAST"
		@value = 0
		@alive = true
	end

	# Sense a wall, update next position
	def sense
		case @direction
		when "EAST"
			return @map.check(@x, @y-1)
		when "NORTH"
			return @map.check(@x-1, @y)
		when "WEST"
			return @map.check(@x, @y+1)
		when "SOUTH"
			return @map.check(@x+1, @y)
		end
	end

	def move
		case @direction
		when "EAST"
			@next_x = @x + 1
		when "NORTH"
			@next_y = @y - 1
		when "WEST"
			@next_x = @x - 1
		when "SOUTH"
			@next_y = @y + 1
		end
		@value += 1
		@map.update(@x, @y, value)
		@x = @next_x
		@y = @next_y
	end

	def turn
		case @direction
		when "EAST"
			@direction = "NORTH"
		when "NORTH"
			@direction = "WEST"
		when "WEST"
			@direction = "SOUTH"
		when "SOUTH"
			@direction = "EAST"
		end
	end

	def alive?
		return @value < @map.size ** 2
	end

	def next
		if self.sense
			#puts "Continue..."
			self.move
		else
			#puts "Turn..."
			self.turn
			self.move
		end
	end

	def display
		puts "[ #{@x} , #{@y} ] - Moving #{@direction} - Value: #{@value}"
	end
end

# Generate map
# map = Map.new(5)
map = Map.new(1001)
map.display()

# Generate iterator
tortue = Tortue.new(map, map.center, map.center)
while tortue.alive? do
	tortue.next
	#map.display
	#tortue.display
end

# Sum diagonals
puts map.diagonal_sum.inspect
puts map.diagonal_sum.reduce(:+)