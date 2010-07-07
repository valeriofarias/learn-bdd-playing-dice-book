## Solving the number issue

If the class was initialized with numbers differents of the range (1..3) then the variables will be filled with a rand number between the range. I'll make also a little refactory in the spec file to put a situation that a number of dice is correct. You can see below the solution. 

	class WarDice 
		attr_reader :red, :yellow

		def initialize(red, yellow)
		  @red, @yellow = red, yellow
		  @red = rand(3) + 1 if @red.to_s.grep(/^[1-3]$/).empty?
		  @yellow = rand(3) + 1 if @yellow.to_s.grep(/^[1-3]$/).empty?
		end
	end

	describe WarDice do
		it "The attack and defence should use 1, 2 or 3 dice" do 
		  wardice = Wardice.new(0, 7)
		  wardice.red.to_s.should match(/^[1-3]$/)
		  wardice.yellow.to_s.should match(/^[1-3]$/)

		  wardice2 = Wardice.new(2, 3)
		  wardice2.red.should == 2
		  wardice2.yellow.should == 3
		end
	
		it "Should compare from bigger to less values and save in array result"
	end
