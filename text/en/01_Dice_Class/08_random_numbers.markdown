## Random numbers

For while it's ok. Now, let's work with the random numbers requirement. I'll put also some requirements that I remember, but not too much. I'll put x in the beginning of 'it' statement to rspec ignore then. this is just a trick ;).

	require "rubygems"
	require "spec"

	require "lib/dice"

	describe Dice do 
		it "should have only numbers 1 to 6" do 
		  dice = Dice.new
		  (1..6).should include( dice.play )
		end

		# Three rand groups of 1000 numbers must be different each other
		it "should show the numbers randomly" do 
		  dice = Dice.new
		  group1 = (1..1_000).collect{ dice.play }
		  group2 = (1..1_000).collect{ dice.play }
		  group3 = (1..1_000).collect{ dice.play }
		  (group1 == group2).should be_false
		  (group1 == group3).should be_false
		  (group2 == group3).should be_false
		end

		xit "should store the last number after the dice was played."
		xit "should play the dice when dice object was initialized"
	end

Output:
	.F

	1)
	'Dice should show the numbers randomly' FAILED
	expected false, got true
	./spec/dice_spec.rb:18:

	Finished in 0.093321 seconds

	2 examples, 1 failure
