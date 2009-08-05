## Gerando número aleatório e refatorando

Agora temos quer gerar números aleatórios e também temos que refatorar o primeiro requisito que delimita a saída entre os números 1 a 6. Esse requisito deve ser testado com uma variedade de números ao invés de somente um como está agora. Para brincar um pouco com Ruby também eu vou modificar o código do require para diminuir o número de linhas.

	class Dice
		def play
		  rand(6)
		end
	end


	%w{ rubygems spec lib/dice }.each{|lib| require lib }

	describe Dice do 
		it "deve ter somente números entre 1 e 6" do 
		  dice = Dice.new
		  group = (1..1_000).collect{ dice.play }.join
		  group.should_not be_nil
		  group.should_not be_empty
		  group.should_not include('-') # Números negativos não são permitidos
		  group.should_not include('0')
		  group.should_not include('7')
		  group.should_not include('8')
		  group.should_not include('9')
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


Output: `rand(6)` gera também o número zero, portanto o teste falha.

	F.

	1)
	'Dice deve ter somente números entre 1 e 6' FAILED
	expected "4025132222510540002142312555235104432520522022430445143425254
	51533145101530430012510120055232441422435123332040350424441302405340420
	50050324205500223120330524430331015422350203015044053545205524012055023
	10100333140520435320541010244153022003403143022550340451124322335450431
	5335402445045511" not to include "0"
	./spec/dice_spec.rb:10:

	Finished in 0.046589 seconds

	2 examples, 1 failure
