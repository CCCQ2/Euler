#A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
#1/2	= 	0.5
#1/3	= 	0.(3)
#1/4	= 	0.25
#1/5	= 	0.2
#1/6	= 	0.1(6)
#1/7	= 	0.(142857)
#1/8	= 	0.125
#1/9	= 	0.(1)
#1/10	= 	0.1
#Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
#Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

require 'bigdecimal'
one = BigDecimal.new("1")
div = BigDecimal.new("0")

class String
	def repeated
		
	end
end

(1..1E1).each do |num|
	solution = []
	div = num
	fract = one.div(div, 1000).to_s.split('.')[1].split('E')[0].chop!.split(//)
	
	#Rotation de l'array
	catch :done do
		for off in 0..fract.size - 1
			fract.drop(off)
			for len in 0..fract.size / 2
				#PŽriode
				period = fract[off..len]
				#Rotation
				if period == fract[off..period.size - 1] && period == fract.rotate(len)[off..period.size - 1]
					#puts "#{num} - #{period.join.to_s}"
					solution << period.join.to_i
				end
			end
		end
		throw :done
	end
	puts "#{num} - #{solution.max}"
end