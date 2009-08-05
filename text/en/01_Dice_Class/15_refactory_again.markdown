## Let's refactory

Now I also can make a little refactory in the dice_spec.rb. I'll put a block `before(:each)` to simplify the code. I'll make another refactory in the third requirement: "should store the last number after the dice was played". Now he works with a lot of numbers. The logic is if the last number is stored then two groups of 100 numbers stored are different each other.

	%w{rubygems spec lib/dice}.each {|lib| require lib}

	describe Dice do 
		before(:each) do
		  @dice = Dice.new
		end

		it "should have only numbers 1 to 6" do 
		  group = (1..1_000).collect{ @dice.play }.join
		  group.should match(/^[1-6]*[1-6]$/)
		end

		# Three groups of 1000 randomic numbers must be different each other
		it "should show the numbers ramdomly" do 
		  group1 = (1..1_000).collect{ @dice.play }
		  group2 = (1..1_000).collect{ @dice.play }
		  group3 = (1..1_000).collect{ @dice.play }
		  (group1 == group2).should be_false
		  (group1 == group3).should be_false
		  (group2 == group3).should be_false
		end

		it "should store the last number after the dice was played." do 
			group1 = (1..100).collect do 
			  @dice.play 
			  @dice.show_number 
			end
			group2 = (1..100).collect do 
			  @dice.play
			  @dice.show_number 
			end	
			(group1 == group2).should be_false
		end
	
		it "should play the dice when dice object was initialized." do
		  @dice.show_number.to_s.should match(/^[1-6]*[1-6]$/)
		end

	end
