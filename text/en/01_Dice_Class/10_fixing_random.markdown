## Fixing the random number failure

Finaly let's put the command `rand(6) + 1` to limit the range 1 to 6 and let's refactore the requirement of the range to use regexp. Now the test pass :).

	class Dice
		def play
		  rand(6) + 1
		end
	end


	%w{ rubygems spec lib/dice }.each {|lib| require lib}

	describe Dice do 
		it "should have only numbers 1 to 6" do 
		  dice = Dice.new
		  group = (1..1_000).collect{ dice.play }.join
		  group.should match(/^[1-6]*[1-6]$/)
		end

		# Three rand groups of 1000 numbers must be different each other
		it "should show the numbers ramdomly" do 
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
