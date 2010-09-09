## Comparando os valores

Vamos trabalhar no último requisito:  **compara os valores do maior para o menor e salva em um array**.

	describe WarDice do
		it "permite a utilização de 1, 2 or 3 dados, para o ataque ou defesa." do
		  wardice = WarDice.new(0, 7)
		  wardice.red.to_s.should match(/^[1-3]$/)
		  wardice.yellow.to_s.should match(/^[1-3]$/)

		  wardice2 = WarDice.new(2, 3)
		  wardice2.red.should == 2
		  wardice2.yellow.should == 3
		end

		it "deve fornecer os resultados dos dados vermelho e amarelo em arrays em ordem decrescente" do
		  wardice = WarDice.new(3, 3)
		  wardice.reddice.is_a?(Array).should be_true
		  wardice.yellowdice.is_a?(Array).should be_true
		
		  wardice.reddice.sort{|x, y| y <=> x }.should == wardice.reddice
		  wardice.yellowdice.sort{|x, y| y <=> x }.should == wardice.yellowdice

		end
	
		it "compara os valores do maior para o menor e salva em um array" do
		  wardice = WarDice.new(3, 2)
		  wardice.reddice.first.should > wardice.reddice.last
		  wardice.attack

		  wardice.result[0].should == "Vermelho Venceu!" if wardice.reddice[0] > wardice.yellowdice[0]
		  wardice.result[0].should == "Amarelo Venceu!" if wardice.reddice[0] <= wardice.yellowdice[0]
		end
	end

A classe WarDice com os testes passando por completo:

	class WarDice 
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
		      @result << "Vermelho Venceu!"
		    else
		      @result << "Amarelo Venceu!"
		    end
		  end
		end
	end
