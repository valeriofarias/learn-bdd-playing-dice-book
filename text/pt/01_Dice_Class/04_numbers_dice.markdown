## Os números no dado

O primeiro requisito é delimitar a quantidade de números do dado: 1 a 6:

	describe Dice do 
		it "deve ter números entre 1 e 6" do 
		  dice = Dice.new
		  (1..6).should include( dice.play )
		end
	end

Saída: 

	F

	1)
	NoMethodError in 'Dice deve ter números entre 1 e 6'
	undefined method `play' for #<Dice:0xb7b6986c>
	./spec/dice_spec.rb:9:

	Finished in 0.073369 seconds

	1 example, 1 failure
