## Um pequeno teste com a classe Dice e Shoes

Nesse capítulo vamos criar uma interface gráfica usando Shoes e a classe WarDice, mas  primeiro vamos fazer um simples teste com a classe Dice. Você deve criar o arquivo diceshoes.rb, então cole o código abaixo dentro dele e salve dentro do mesmo diretório do arquivo dice.rb. Finalmente, execute ele com o Shoes para ver o resultado.

Observe que eu apenas inclui o arquivo dice.rb com um `require` no começo do código abaixo:

	require 'dice'
	Shoes.app :title => "Teste com a classe Dice", :width => 500, :height => 500 do
		background aliceblue

		para "Bem Vindo! Esse é um exemplo de uso da classe Dice.", :weight => "bold"

		dice = Dice.new

		# Imprime na tela os números dos dados jogados com cores aleatórias
		1_000.times do
		  r, g, b = rand, rand, rand
		  para dice.play, :stroke => rgb(r**3, g**3, b**3), :size => "large"
		end
	end

Saída:

![usando a classe Dice com Shoes](images/pt/dice-class-shoes.jpg)


