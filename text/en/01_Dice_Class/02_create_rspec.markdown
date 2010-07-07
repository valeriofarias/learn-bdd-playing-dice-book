## Creating the rspec file

First create the dice folder and the lib and spec folders inside it. Then you have to create the file dice_spec.rb inside the spec folder. Well! What you waiting! Let's write the first requirement in that file. Now we start to play!

	require "rubygems"
	require "spec"
	
	require "lib/dice"

	describe Dice do 
	  it "should have numbers 1 to 6"
	end

To execute this test open the terminal end enter in the dice folder and use the test command:

	cd dice
	spec spec/dice_spec

In our example with autotest, just digit the next command:

	autospec

Now the test execute automatically every time that the files was saved.
Come back to our example. The output of this first test broke because we need create the Dice class in the lib/dice.rb file.

	spec --autospec spec/dice_spec.rb 
	./spec/dice_spec.rb:6: uninitialized constant Dice (NameError)
