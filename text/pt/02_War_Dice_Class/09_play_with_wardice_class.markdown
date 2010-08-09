## Brincando com a classe WarDice

Abra o irb e digite a sequência abaixo:

	>> require 'dice'
	=> true

Inicialize a classe WarDice. O primeiro parâmetro é o número de dados vermelhos e o segundo é o número de dados amarelos:

	>> wardice = WarDice.new(2, 3)
	=> #<WarDice:0xb7b0b410 @yellowdice=[[6], [1], [1]], @reddice=[[3], [1]], @dice=#<Dice:0xb7b0ae0c 
	@number=6>, yellow3, result["Yellow Win", "Yellow Win"], red2

Mostra o números nos dados amarelos e vermelhos: 

	>> puts wardice.reddice
	3
	1
	=> nil
	>> puts wardice.yellowdice
	6
	1
	1
	=> nil

Joga os dados:

    >> puts wardice.attack
    3
    1
    => nil

Mostra o resultado:

	>> puts wardice.result
	Yellow Win
	Yellow Win
	=> nil

A saída completa em um único comando:

	>> war.reddice.each_with_index{ |item, index| puts "Red:#{item} Yellow:#{war.yellowdice[index]} 
	- #{war.result[index]}"}
	Red:3 Yellow:6 - Yellow Win
	Red:1 Yellow:1 - Yellow Win
	=> [[3], [1]]

Agora já temos as ferramentas para brincar. Então no próximo capítulo nós usaremos essas classes para fazer uma bela aplicação gráfica usando Shoes.


