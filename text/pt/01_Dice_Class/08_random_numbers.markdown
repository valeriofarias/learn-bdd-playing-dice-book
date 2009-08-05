## Números aleatórios

Por enquanto está Ok. Agora vamos trabalhar no requisito dos números aleatórios. Eu vou colocar alguns outros requisitos que lembrei, mas não muitos. Vou colocar também a letra x no começo da declaração 'it'para o rspec ignorá-la. Isso é apenas um truque ;).

	require "rubygems"
	require "spec"

	require "lib/dice"

	describe Dice do 
		it "deve ter números entre 1 e 6" do 
		  dice = Dice.new
		  (1..6).should include( dice.play )
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

		xit "deve armazenar número da última jogada."
		xit "deve jogar o dado no momento que o objeto for inicializado"
	end

Output:
	.F

	1)
	'Dice deve mostrar números de forma aleatória' FAILED
	expected false, got true
	./spec/dice_spec.rb:18:

	Finished in 0.093321 seconds

	2 examples, 1 failure
