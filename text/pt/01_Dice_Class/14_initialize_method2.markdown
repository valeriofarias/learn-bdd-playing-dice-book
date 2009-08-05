## Usando o método `initialize` 

Agora eu finalizo a classe Dice colocando o método `initialize` com uma mensagem para o método play. O teste passa. 

	class Dice
		def initialize
		  play
		end
	
		def play
		  @number = rand(6) + 1
		end
	
		def show_number
		  @number
		end
	end
