## A little test with dice class and shoes

Now let's create a graphic interface using Shoes that will use the class WarDice. But first let's' make a simple test with the class Dice. You have to create a new file diceshoes.rb, then paste the code below inside it and save the file at the same directory of dice.rb file. Finally, execute it with shoes to see the result.

Observe that I just included the dice.rb file with a require in the beginning of the code below:

	require 'dice'
	Shoes.app :title => "Test with dice class", :width => 500, :height => 500 do
		background aliceblue

		para "Welcome! This is an example using Dice class.", :weight => "bold"

		dice = Dice.new

		# Print dice numbers with random colors
		1_000.times do
		  r, g, b = rand, rand, rand
		  para dice.play, :stroke => rgb(r**3, g**3, b**3), :size => "large"
		end
	end

Output:

![using dice class with shoes](images/en/dice-class-shoes.jpg)


