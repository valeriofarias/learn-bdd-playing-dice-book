## Número fora do conjunto 1-6

Por experimentação vamos colocar um número fora do conjunto 1-6 para ver o que acontece:

	class Dice
		def play
		  10
		end
	end

Output: continua falhando, pois está fora do conjunto.

	F

	1)
	'Dice deve ter números entre 1 e 6' FAILED
	expected 1..6 to include 10
	./spec/dice_spec.rb:9:

	Finished in 0.03021 seconds

	1 example, 1 failure
