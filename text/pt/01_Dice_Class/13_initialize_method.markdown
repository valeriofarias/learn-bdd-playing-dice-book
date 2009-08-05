## Jogar o dado na inicialização do objeto 

Agora eu quero que o dado seja jogado quando ele for inicializado. O próximo teste quebrará.


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
	
		it "deve jogar o dado na inicialização do objeto." do
		  Dice.new.show_number.to_s.should match(/^[1-6]*[1-6]$/)
		end

	end

Output:

	...F

	1)
	'Dice deve jogar o dado na inicialização do objeto.' FAILED
	expected "" to match /^[1-6]*[1-6]$/
	./spec/dice_spec.rb:29:

	Finished in 0.12371 seconds

	4 examples, 1 failure
