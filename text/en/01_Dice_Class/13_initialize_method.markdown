## Play the dice when the class was initialized 

Now I want that the dice play when it's initializing. The next test'll break.


	%w{rubygems spec lib/dice}.each {|lib| require lib}

	describe Dice do 

		it "should have only numbers 1 to 6" do 
		  dice = Dice.new
		  group = (1..1_000).collect{ dice.play }.join
		  group.should match(/^[1-6]*[1-6]$/)
		end

		# Three groups of 1000 random numbers must be different each other
		it "should show the numbers randomly" do 
		  dice = Dice.new
		  group1 = (1..1_000).collect{ dice.play }
		  group2 = (1..1_000).collect{ dice.play }
		  group3 = (1..1_000).collect{ dice.play }
		  (group1 == group2).should be_false
		  (group1 == group3).should be_false
		  (group2 == group3).should be_false
		end

		it "should store the last number after the dice was played." do 
		  dice = Dice.new
		  dice.play
		  dice.show_number.to_s.should match(/^[1-6]*[1-6]$/)
		end
	
		it "should play the dice when dice object was initialized." do
		  Dice.new.show_number.to_s.should match(/^[1-6]*[1-6]$/)
		end

	end

Output:

	...F

	1)
	'Dice should play the dice when dice object was initialized.' FAILED
	expected "" to match /^[1-6]*[1-6]$/
	./spec/dice_spec.rb:29:

	Finished in 0.12371 seconds

	4 examples, 1 failure
