class Project 
	attr_reader :fund, :target
	attr_accessor :name	
	def initialize(name,fund = 0,target = 10000)
		@name = name.capitalize 
		@fund = fund
		@target = target
	end	
	def required_fund
		if(@target > @fund)
			@target - @fund
		end			
	end	
    def add_fund(amt = 25)
    	@fund += amt
    	puts "project #{@name} got some funds"
    end	
    def remove_fund(amt = 15)
    	@fund += amt
    	puts "Project #{@name} lost some funds"
    end	
    def display_status
    	if(@fund < @target)
    		puts "Project $#{@name}  has $#{@fund} in funding towards a goal of #{@target} and requires $#{required_fund} to reach target"
    	end	
    	if (@fund >= @target)
    		puts "Target achived "
    	end	
    end	
end 

project1 = Project.new("lmn",500,3000)
project1.add_fund(2000)
project1.display_status