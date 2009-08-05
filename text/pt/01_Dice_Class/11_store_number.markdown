## Armazenando o número do dado

Vamos trabalhar no próximo requisito: "deve armazenar número da última jogada.". Eu criarei o método show_number e colocarei uma constante para o teste passar. 

	%w{rubygems spec lib/dice}.each {|lib| require lib}

	describe Dice do 

		it "deve ter somente números entre 1 e 6" do 
		  dice = Dice.new
		  group = (1..1_000).collect{ dice.play }.join
		  group.should match(/^[1-6]*[1-6]$/)
		end

		# Três grupos de 1000 números aleatórios devem ser diferentes um do outro
		it "deve mostrar números de forma aleatória" do  
		  dice = Dice.new
		  group1 = (1..1_000).collect{ dice.play }
		  group2 = (1..1_000).collect{ dice.play }
		  group3 = (1..1_000).collect{ dice.play }
		  (group1 == group2).should be_false
		  (group1 == group3).should be_false
		  (group2 == group3).should be_false
		end

		it "deve armazenar número da última jogada." do 
		  dice = Dice.new
		  dice.play
		  dice.show_number.to_s.should match(/^[1-6]*[1-6]$/)
		end
	
		xit "deve jogar o dado no momento que o objeto for inicializado"
	end
	
	
	class Dice
		def play
		  rand(6) + 1
		end
	
		def show_number
		  3
		end
	end

