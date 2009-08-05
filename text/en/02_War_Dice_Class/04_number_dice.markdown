## Number of dice

Now I'll work on the first requirement: **The attack and defense should use 1, 2 or 3 dice**. I'll put propositous a number different of 1, 2, 3 to cause an error.  

	describe Wardice do
		it "The attack and defense should use 1, 2 or 3 dice" do 
		  wardice = Wardice.new(0, 3)
		  wardice.red.to_s.should match(/^[1-3]$/)
		  wardice.yellow.to_s.should match(/^[1-3]$/)
		end

		it "Should compare from bigger to less values and save in array result"
	end


	class Wardice 
		attr_reader :red, :yellow

		def initialize(red, yellow)
		  @red, @yellow = red, yellow
		end
	end

Output:

	'Wardice The attack and defense should use 1, 2 or 3 dice' FAILED
	expected "0" to match /^[1-3]$/
	./spec/dice_spec.rb:50:

	Finished in 0.032203 seconds

	8 examples, 1 failure, 2 pending
