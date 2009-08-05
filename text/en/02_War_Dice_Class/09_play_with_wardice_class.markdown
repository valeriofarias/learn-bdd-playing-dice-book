## Play with the WarDice class

Open irb and write the next sequence:

	>> require 'dice'
	=> true

Initialize the WarDice class. The first parameter is the number of red dice and the 
second is the number of yellow dice: 

	>> wardice = WarDice.new(2, 3)
	=> #<WarDice:0xb7b0b410 @yellowdice=[[6], [1], [1]], @reddice=[[3], [1]], @dice=#<Dice:0xb7b0ae0c 
	@number=6>, yellow3, result["Yellow Win", "Yellow Win"], red2

Show numbers in yellow and red dice: 

	>> puts wardice.reddice
	3
	1
	=> nil
	>> puts wardice.yellowdice
	6
	1
	1
	=> nil

Show result:

	>> puts wardice.result
	Yellow Win
	Yellow Win
	=> nil

All output in one command:  	

	>> war.reddice.each_with_index{ |item, index| puts "Red:#{item} Yellow:#{war.yellowdice[index]} 
	- #{war.result[index]}"}
	Red:3 Yellow:6 - Yellow Win
	Red:1 Yellow:1 - Yellow Win
	=> [[3], [1]]


Now we have the tools to play. Then the next chapter we'll use this classes to make a nice graphic application using Shoes.


