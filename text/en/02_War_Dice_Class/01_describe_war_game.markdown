## Describing the War Game

Now I finally finished the Dice class! But I want something more excitant!
I want reproduce in a ruby class the dice of war game. That's right! That 6 dice.
3 red and 3 yellow that represent atack and defence respectively.

I'll use two arrays: reddice and yellowdice to store the dice values. I remember now that
the use of the dice depend on the army number of attacker and defensor. But in this 
experiment I'll think only in the handling of dice in the game. Then the dice can be handle 
using 1, 2 or 3 red dice versus 1, 2 or 3 yellow dice. I'll have to compare the bigger red value with the bigger yellow value and consequently the next values using this logic (from bigger to less values). In draw case the yellow win. The red only win when the number was bigger then the yellow.

Well, I think that's it. Let's work now!
