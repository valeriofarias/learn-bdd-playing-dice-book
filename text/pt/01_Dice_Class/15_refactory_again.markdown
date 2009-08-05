## Vamos refatorar

Agora eu posso fazer uma pequena refatoração no arquivo dice_spec.rb. Eu colocarei um bloco `before(:each)` para simplificar o código. Farei também uma refatoração no terceiro requisito: "deve armazenar número da última jogada". Agora ele funciona com uma grande quantidade de números. A lógica é se o último número é armazenado então dois grupos de 100 números são diferentes entre si.

	%w{rubygems spec lib/dice}.each {|lib| require lib}

	describe Dice do 
		before(:each) do
		  @dice = Dice.new
		end

		it "deve ter somente números entre 1 e 6" do 
		  group = (1..1_000).collect{ @dice.play }.join
		  group.should match(/^[1-6]*[1-6]$/)
		end

		# Três grupos de 1000 números aleatórios devem ser diferentes um do outro
		it "deve mostrar números de forma aleatória" do  
		  group1 = (1..1_000).collect{ @dice.play }
		  group2 = (1..1_000).collect{ @dice.play }
		  group3 = (1..1_000).collect{ @dice.play }
		  (group1 == group2).should be_false
		  (group1 == group3).should be_false
		  (group2 == group3).should be_false
		end

		it "deve armazenar número da última jogada." do 
			group1 = (1..100).collect do 
			  @dice.play 
			  @dice.show_number 
			end
			group2 = (1..100).collect do 
			  @dice.play
			  @dice.show_number 
			end	
			(group1 == group2).should be_false
		end
	
		it "deve jogar o dado na inicialização do objeto." do
		  @dice.show_number.to_s.should match(/^[1-6]*[1-6]$/)
		end

	end
