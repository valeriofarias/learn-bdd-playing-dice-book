## Comparing values

Let's  work now in the last requirement:  **Should compare from bigger to less values and save in array result**

	describe Wardice do
		it "The attack and defense should use 1, 2 or 3 dice" do 
		  wardice = Wardice.new(0, 7)
		  wardice.red.to_s.should match(/^[1-3]$/)
		  wardice.yellow.to_s.should match(/^[1-3]$/)

		  wardice2 = Wardice.new(2, 3)
		  wardice2.red.should == 2
		  wardice2.yellow.should == 3
		end

		it "Should provide yellow and red dice results with an array in decreasing sort" do
		  wardice = Wardice.new(3, 3)
		  wardice.reddice.is_a?(Array).should be_true
		  wardice.yellowdice.is_a?(Array).should be_true
		
		  wardice.reddice.sort{|x, y| y <=> x }.should == wardice.reddice
		  wardice.yellowdice.sort{|x, y| y <=> x }.should == wardice.yellowdice

		end
	
		it "Should compare from bigger to less values and save in array result" do
		  wardice = Wardice.new(3, 2)
		  wardice.reddice.first.should > wardice.reddice.last
		  wardice.attack

		  wardice.result[0].should == "Red Win" if wardice.reddice[0] > wardice.yellowdice[0]
		  wardice.result[0].should == "Yellow Win" if wardice.reddice[0] <= wardice.yellowdice[0]
		end
	end

The final WarDice class:

	class Wardice 
		attr_reader :red, :yellow, :reddice, :yellowdice, :result

		def initialize(red, yellow)
		  @red, @yellow = red, yellow
		  @red = rand(3) + 1 if @red.to_s.grep(/^[1-3]$/).empty?
		  @yellow = rand(3) + 1 if @yellow.to_s.grep(/^[1-3]$/).empty?

		  @reddice = []
		  @yellowdice = []
		  @result = []

		  @dice = Dice.new
		  @red.times{|row| @reddice[row] = [@dice.play] }
		  @yellow.times{ |row| @yellowdice[row] = [@dice.play] }

		  @reddice.sort!{|x, y| y <=> x }
		  @yellowdice.sort!{|x, y| y <=> x }
		end

		def attack
		  @reddice.each_with_index  do |item, index| 
		    next if @yellowdice[index].nil?
		    reddice = item
		    yellowdice = @yellowdice[index]

		    if reddice > yellowdice 
		      @result << "Red Win"
		    else
		      @result << "Yellow Win"
		    end
		  end
		end
	end
