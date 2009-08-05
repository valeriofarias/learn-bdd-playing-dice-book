## Create the play method in dice.rb

To fix the previous failure let's write the play method:

	class Dice
	  def play
	  end
	end

Output: still failure because the play method returns nil.

	F

	1)
	'Dice should have only numbers 1 to 6' FAILED
	expected 1..6 to include nil
	./spec/dice_spec.rb:9:

	Finished in 0.031104 seconds

	1 example, 1 failure
