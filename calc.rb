class Calculator
	def initialize(ele1,ele2)
		@var1 = ele1
		@var2 = ele2
	end
	def add
		@var1+@var2
	end	
	def sub
		@var1-@var2
	end	
end

calc = Calculator.new(20,11)
puts calc.add
puts calc.sub
