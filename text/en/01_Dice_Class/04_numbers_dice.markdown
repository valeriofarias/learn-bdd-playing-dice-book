## The numbers in the dice

The first requirement is to delimit the numbers of dice: 1 to 6:

	describe Dice do 
		it "should have only numbers 1 to 6" do 
		  dice = Dice.new
		  (1..6).should include( dice.play )
		end
	end

Output: 

	F

	1)
	NoMethodError in 'Dice should have only numbers 1 to 6'
	undefined method `play' for #<Dice:0xb7b6986c>
	./spec/dice_spec.rb:9:

	Finished in 0.073369 seconds

	1 example, 1 failure
