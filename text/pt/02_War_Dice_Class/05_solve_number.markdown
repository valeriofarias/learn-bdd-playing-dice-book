## Resolvendo o problema dos números

Lógica: Se a classe for inicializada com números diferentes da lista 1-3 então as variáveis serão preenchidas com um número aleatório variando de 1 a 3. Eu farei também uma pequena refatoração no arquivo spec para que ele fique preparado para a situação em que a quantidade de dados for correta. Você pode ver a solução abaixo:

	class WarDice 
		attr_reader :red, :yellow

		def initialize(red, yellow)
		  @red, @yellow = red, yellow
		  @red = rand(3) + 1 if @red.to_s.grep(/^[1-3]$/).empty?
		  @yellow = rand(3) + 1 if @yellow.to_s.grep(/^[1-3]$/).empty?
		end
	end

	describe WarDice do
		it "permite a utilização de 1, 2 or 3 dados, para o ataque ou defesa." do 
		  wardice = Wardice.new(0, 7)
		  wardice.red.to_s.should match(/^[1-3]$/)
		  wardice.yellow.to_s.should match(/^[1-3]$/)

		  wardice2 = Wardice.new(2, 3)
		  wardice2.red.should == 2
		  wardice2.yellow.should == 3
		end
	
		it "compara os valores do maior para o menor e salva em um array"
	end
