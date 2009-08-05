## Criando o arquivo rspec

Primeiro crie a pasta dice e dentro dela crie as pastas lib e spec. Agora crie o arquio dice_spec.rb dentro da pasta spec. Bem! O que está esperando! Vamos escrever o primeiro requisito nesse arquivo. Agora começa a diversão!

	require "rubygems"
	require "spec"
	
	require "lib/dice"

	describe Dice do 
	  it "deve ter números entre 1 e 6"
	end

Para executar esse teste abra o terminal, entre na pasta dice, depois digite o comando de teste:

	cd dice
	spec spec/dice_spec

Em nosso exemplo com autotest, apenas digite o seguinte comando:

	autospec

Agora o teste executa automaticamente toda vez que savarmos o arquivo.
Voltando para nosso exemplo. A saída do primeiro teste quebra porque precisamos criar a classe Dice no arquivo lib/dice.rb.

	spec --autospec spec/dice_spec.rb 
	./spec/dice_spec.rb:6: uninitialized constant Dice (NameError)
