## Resolvendo a falha do número aleatório

Finalmente vamos ajeitar o comando para `rand(6) + 1`. Dessa forma limita a saída entre 1 e 6. Vamos aproveitar para refatorar o primeiro requisito para usar expressões regulares. Agora o teste passa :).

	class Dice
		def play
		  rand(6) + 1
		end
	end


	%w{ rubygems spec lib/dice }.each {|lib| require lib}

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

		xit "deve armazenar número da última jogada."
		xit "deve jogar o dado no momento que o objeto for inicializado"
	end
