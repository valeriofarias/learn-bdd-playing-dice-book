## Generate random number and refactory

Now I have to generate random numbers and also have to refactory the first requirement that limit the numbers 1 to 6. This requirement must be tested with a variery of numbers instead of only one how it's right now. To play a little bit with ruby, I'll modify also the require code to simplify the number of lines.

	class Dice
		def play
		  rand(6)
		end
	end


	%w{ rubygems spec lib/dice }.each {|lib| require lib}

	describe Dice do 
		it "should show only numbers 1 to 6" do 
		  dice = Dice.new
		  group = (1..1_000).collect{ dice.play }.join
		  group.should_not be_nil
		  group.should_not be_empty
		  group.should_not include('-') # Negative numbers aren't permited
		  group.should_not include('0')
		  group.should_not include('7')
		  group.should_not include('8')
		  group.should_not include('9')
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


Output: `rand(6)` generate also zeros, the the test failure.

	F.

	1)
	'Dice should show only numbers 1 to 6' FAILED
	expected "4025132222510540002142312555235104432520522022430445143425254
	51533145101530430012510120055232441422435123332040350424441302405340420
	50050324205500223120330524430331015422350203015044053545205524012055023
	10100333140520435320541010244153022003403143022550340451124322335450431
	5335402445045511" not to include "0"
	./spec/dice_spec.rb:10:

	Finished in 0.046589 seconds

	2 examples, 1 failure
