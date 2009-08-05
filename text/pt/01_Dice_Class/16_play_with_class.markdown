## Brincando com a classe Dice

Agora que a classe foi finalizada vamos brincar com ela no irb!

	>> require 'dice'
	=> true
	>> dice = Dice.new
	=> #<Dice:0xb7a64188 @number=5>
	>> dice.show_number
	=> 5
	>> dice.class
	=> Dice

Jogando o dado somente uma vez e deixando ele de lado:

	>> Dice.new.show_number
	=> 2

Jogar o dado várias vezes:

	>> 20.times{ print dice.play }
	21636456135236136236=> 20

Três dados: 

	>> yellowdice = [Dice.new, Dice.new, Dice.new]
	=> [#<Dice:0xb7a3e3d4 @number=3>, #<Dice:0xb7a3e3ac @number=5>, #<Dice:0xb7a3e384 @number=5>]
	>> yellowdice.each{ |dice| puts dice.show_number }
	3
	5
	5
	=> [#<Dice:0xb7a3e3d4 @number=3>, #<Dice:0xb7a3e3ac @number=5>, #<Dice:0xb7a3e384 @number=5>]

Jogar novamente o mesmo dado

	>> yellowdice.each{ |dice| puts dice.play }
	5
	2
	5
	=> [#<Dice:0xb7a3e3d4 @number=5>, #<Dice:0xb7a3e3ac @number=2>, #<Dice:0xb7a3e384 @number=5>]

Qual o maior valor entre os três dados da última jogada?  

	>> puts yellowdice.collect{ |item| item.show_number }.max 
	5
	=> nil

E qual o menor valor? 	

	>> puts yellowdice.collect{ |item| item.show_number }.min 	
	2
	=> nil 
	
Espere um pouco. No último exemplo eu usei 3 dados?!?  Ahaaa! Isso parece com os dados do jogo War. Nós criaremos os dados do jogo war no próximo capítulo.


