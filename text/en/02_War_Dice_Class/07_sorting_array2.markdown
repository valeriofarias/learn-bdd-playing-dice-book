## Solving sorting array issue

To solve this problem is necessary to use the method `sort!{|x,y| y <=> x }` in each dice array:

	class WarDice 
		attr_reader :red, :yellow, :reddice, :yellowdice

		def initialize(red, yellow)
		  @red, @yellow = red, yellow
		  @red = rand(3) + 1 if @red.to_s.grep(/^[1-3]$/).empty?
		  @yellow = rand(3) + 1 if @yellow.to_s.grep(/^[1-3]$/).empty?
		
		  @reddice = []
		  @yellowdice = []
		
		  @dice = Dice.new		
		  @red.times{|row| @reddice[row] = [@dice.play] }
		  @yellow.times{ |row| @yellowdice[row] = [@dice.play] }
		
		  @reddice.sort!{|x,y| y <=> x }
		  @yellowdice.sort!{|x,y| y <=> x }
		end
	end

Now the test pass.
