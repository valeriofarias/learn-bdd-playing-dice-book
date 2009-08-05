## Using the `initialize` method 

Now I finalize the dice class putting the `initialize` method with a message for the play method. The test pass. 

	class Dice
		def initialize
		  play
		end
	
		def play
		  @number = rand(6) + 1
		end
	
		def show_number
		  @number
		end
	end
