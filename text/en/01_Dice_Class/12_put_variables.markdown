## Changing constants by variables

This is an important rule in BDD. Now you can change the constant by a instance variable in the dice class. The test'll pass.

	class Dice
		def play
		  @number = rand(6) + 1
		end
	
		def show_number
		  @number
		end
	end
