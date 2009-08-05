## Play with the Dice class

Now that the class is finished. Let's play with it in the irb!

	>> require 'dice'
	=> true
	>> dice = Dice.new
	=> #<Dice:0xb7a64188 @number=5>
	>> dice.show_number
	=> 5
	>> dice.class
	=> Dice

Using the dice only one time and abandon it

	>> Dice.new.show_number
	=> 2

Play the dice a lot of times:

	>> 20.times{ print dice.play }
	21636456135236136236=> 20

Three dice: 

	>> yellowdice = [Dice.new, Dice.new, Dice.new]
	=> [#<Dice:0xb7a3e3d4 @number=3>, #<Dice:0xb7a3e3ac @number=5>, #<Dice:0xb7a3e384 @number=5>]
	>> yellowdice.each{ |dice| puts dice.show_number }
	3
	5
	5
	=> [#<Dice:0xb7a3e3d4 @number=3>, #<Dice:0xb7a3e3ac @number=5>, #<Dice:0xb7a3e384 @number=5>]

Play again the same dice

	>> yellowdice.each{ |dice| puts dice.play }
	5
	2
	5
	=> [#<Dice:0xb7a3e3d4 @number=5>, #<Dice:0xb7a3e3ac @number=2>, #<Dice:0xb7a3e384 @number=5>]

What's the bigger value of the three dice of last play?  

	>> puts yellowdice.collect{ |item| item.show_number }.max 
	5
	=> nil

	
And about the less value? 	

	>> puts yellowdice.collect{ |item| item.show_number }.min 	
	2
	=> nil 
	
Wait. The last example I used 3 dice?!?  Ahaaa! This looks like the dice of war game.
Let's create the war game dice class in the next chapter.


