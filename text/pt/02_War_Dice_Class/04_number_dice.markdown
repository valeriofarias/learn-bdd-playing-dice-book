## Número de dados

Agora vou trabalhar no primeiro requisito: **permite a utilização de 1, 2 or 3 dados, para o ataque ou defesa.**. Na classe WarDice eu vou colocar de propósito um número diferente de 1, 2, 3 para gerar um erro.  

	describe Wardice do
		it "permite a utilização de 1, 2 or 3 dados, para o ataque ou defesa." do 
		  wardice = Wardice.new(0, 3)
		  wardice.red.to_s.should match(/^[1-3]$/)
		  wardice.yellow.to_s.should match(/^[1-3]$/)
		end

		it "compara os valores do maior para o menor e salva em um array"
	end


	class Wardice 
		attr_reader :red, :yellow

		def initialize(red, yellow)
		  @red, @yellow = red, yellow
		end
	end

Output:

	'Wardice permite a utilização de 1, 2 or 3 dados, para o ataque ou defesa.' FAILED
	expected "0" to match /^[1-3]$/
	./spec/dice_spec.rb:50:

	Finished in 0.032203 seconds

	8 examples, 1 failure, 2 pending
