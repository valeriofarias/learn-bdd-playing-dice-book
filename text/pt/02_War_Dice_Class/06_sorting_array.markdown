## Array em ordem decrescente

Esse requisito é muito importante, mas só lembrei dele agora: **wardice deve fornecer os resultados dos dados vermelho e amarelo em arrays em ordem decrescente**. Você pode ver a solução abaixo: 

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
		  wardice = Wardice.new(3, 3)
		  wardice.reddice.is_a?(Array).should be_true
		  wardice.yellowdice.is_a?(Array).should be_true
		
		  wardice.reddice.sort{|x, y| y <=> x }.should == wardice.reddice
		  wardice.yellowdice.sort{|x, y| y <=> x }.should == wardice.yellowdice
		end
	
		it "compara os valores do maior para o menor e salva em um array"

	end


	class wardice 
		attr_reader :red, :yellow, :reddice, :yellowdice

		def initialize(red, yellow)
		  @red, @yellow = red, yellow
		  @red = rand(3) + 1 if @red.to_s.grep(/^[1-3]$/).empty?
		  @yellow = rand(3) + 1 if @yellow.to_s.grep(/^[1-3]$/).empty?
		
		  @reddice = []
		  @yellowdice = []
		
		  @dice = Dice.new		
		  @red.times{|row| @reddice[row] = [@dice.play] }
		  @yellow.times{ |row| @yellowdice[row] = [@dice.play] }
		end
	end

Output:

	'wardice deve fornecer os resultados dos dados vermelho e amarelo em arrays em ordem decrescente' 		FAILED
	expected: [[5], [2], [4]],
	     got: [[5], [4], [2]] (using ==)
	./spec/dice_spec.rb:63:

	Finished in 0.035218 seconds

	9 examples, 1 failure, 2 pending
