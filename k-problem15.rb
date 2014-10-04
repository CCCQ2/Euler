#Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
#How many routes are there through a 20x20 grid?

#Table[Binomial[2 n, n], {n, 1, 24}]
#Mathematica plaintext output:
#{2, 6, 20, 70, 252, 924, 3432, 12870, 48620, 184756, 705432, 2704156, 10400600, 40116600, 155117520, 601080390, 2333606220, 9075135300, 35345263800, 137846528820}

class Integer
	def fact() self.zero? ? 1 : (1..self).reduce(:*) end
end
p 40.fact/(20.fact * 20.fact)