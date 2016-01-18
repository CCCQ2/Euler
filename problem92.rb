# A number chain is created by continuously adding the square
# of the digits in a number to form a new number until it has been seen before.
# For example,
# 44 -> 32 -> 13 -> 10 -> 1 -> 1
# 85 -> 89 -> 145 -> 42 -> 20 -> 4 -> 16 -> 37 -> 58 -> 89
# Therefore any chain that arrives at 1 or 89 will become
# stuck in an endless loop. What is most amazing is that EVERY starting
#  number will eventually arrive at 1 or 89.
# How many starting numbers below ten million will arrive at 89?

# PURE CODE v0.2
# - This is dedicated to Paul
# - No wars by vigilance.
# - La sagesse et sa representation sous une forme de chouette nocturne
# - The song of the petrification of a unique breed with its own(l) view of the
# world and how it guides its actions, kind of druidic, kind of an ow(w|n|l|).
# - So since Athe(ans)(na)
# - Process of a faster way to communicate through the use of a recursive
# (syno)(*)nym combination finder in a progressive articulate way.
# - A graph theory combining a train of thoughts.
# - Logarithmic display occupancy of screen.
# - Uncut weaving display
# -C'est quoi un pauvre dit la jeune princesse.

require 'json'

class Node
  attr_accessor :id, :children
  def initialize(id)
    @id= id
    @children = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.find(id)
    found = nil
    all.each do |node|
      if node.id == id
        found = node
        break
      end
    end
    found
  end
end

links = []
total = 10_000_000
total = 10_000
now = Time.now

1.upto(total) do |x|
  # Generate
  sum = 0
  x.to_s.each_char do |digit|
    sum += digit.to_i**2
  end
  links[x - 1] = sum

  # Debug
  puts "#{x} -- #{Time.now - now}" if x % 100_000 == 0
end

links.each_with_index do |link, index|
  current = link
  links[current]
end

# Convert to a D3 compatible JSON
# File.write('links.txt', links.join('\n'))
