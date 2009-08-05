## Testing array comparison 

Well, I remembered that we need to use array comparison in the dice of war game, but In my first test with array comparison I had problems. You can see this problem in the next test:

	describe Array do
		it "should be comparable" do 
		  ([8,9,10] > [1,2,3]).should be_true 
		end
	end 

Output:

	....F

	1)
	NoMethodError in 'Array should be comparable'
	undefined method `>' for [8, 9, 10]:Array
	./spec/dice_spec.rb:43:

	Finished in 0.039464 seconds

	5 examples, 1 failure
