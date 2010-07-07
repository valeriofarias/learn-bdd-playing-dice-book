## Number outside the range 1..6

Let's experiment to put a number outside of the range 1..6 to see what happens:

	class Dice
		def play
		  10
		end
	end

Output: the test still failure because the number is outside the range.

	F

	1)
	'Dice should have numbers 1 to 6' FAILED
	expected 1..6 to include 10
	./spec/dice_spec.rb:9:

	Finished in 0.03021 seconds

	1 example, 1 failure
