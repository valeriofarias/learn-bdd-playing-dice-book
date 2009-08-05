## Trocando constante por variável

Essa é uma regra importante no BDD. Agora você pode mudar a constante por uma variável de instância na classe dados. O teste continua passando.

	class Dice
		def play
		  @number = rand(6) + 1
		end
	
		def show_number
		  @number
		end
	end
