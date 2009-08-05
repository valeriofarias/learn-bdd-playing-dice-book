## O código Shoes do aplicativo que usa a classe WarDice

Finalmente a última aplicação. copie o código seguinte em um novo arquiov e salve com o nome wardiceshoes.rb na pasta lib. Eu fiz alguns comentários através do código para facilitar a compreensão. Faça um bom experimento.

	require 'dice'

	Shoes.app :title => "Dados do Jogo War", :width => 500, :height => 500 do
		background gradient( black, teal )

		# Listbox com a quantidade de dados vermelhos: 1, 2 or 3
		para "Red", :stroke => tomato
		@numberreddice = list_box :items => ["1", "2", "3"],
		  :width => 70, :choose => "3" do |list|
		end

		para " X ", :stroke => snow

		# Listbox com a quantidade de dados amarelos: 1, 2 or 3
		@numberyellowdice = list_box :items => ["1", "2", "3"],
		  :width => 70, :choose => "3" do |list|
		end
		para "Yellow", :stroke => yellow

		# Define uma posição aleatória
		@a = @b = @c = []

		 (40..200).step(10){ |x| @a << x }
		(230..450).step(10){ |y| @b << y }
		(80..450).step(10){  |z| @c << z }

		# Variáveis que vão armazenar os valores do objeto wardice.
		@reddice = @yellowdice = @resulttext = []

		button "Attack", :width => 80 do

		  # Limpa a tela
		  @dice.each{ |d| d.remove }
		  @resulttext.each{ |a| a.remove }	

		  # O objeto wardice is inicializado
		  wardice = WarDice.new( @numberreddice.text.to_i, @numberyellowdice.text.to_i ) 
		  @reddice    = wardice.reddice
		  @yellowdice = wardice.yellowdice
		  @result     = wardice.result

		  # Cada dado é desenhado em uma posição aleatória
		  @reddice.each{ |item| draw( @a[rand(@a.length)], @c[rand(@c.length)], item.to_s.to_i, 1, true ) }
		  @yellowdice.each{ |item| draw( @b[rand(@b.length)], @c[rand(@c.length)], item.to_s.to_i, 2, true )}

		end

		button "Verify", :width => 80 do

		  # Limpa a tela
		  @dice.each{ |d| d.remove }
		  @resulttext.each{ |a| a.remove }
		
		  # posição inicial dos dados
		  leftyellow = 250
		  leftred    = 150
		  topred     = topyellow = 100

		  # Cada dado é desenhado em uma posição definida
		  @reddice.each do |item| 
		    draw( leftred, topred, item.to_s.to_i, 1, false )
		    topred += 100
		  end

		  @yellowdice.each do |item| 
		    draw( leftyellow, topyellow, item.to_s.to_i, 2, false )
		    topyellow += 100
		  end

		  # Posição inicial para a lista com o resultado
		  leftresult = 300
		  topresult  = 80

		  # Os resultados são impressos na tela em uma posição definida
		  @result.each_with_index do |item, index|
		    @resulttext[index] = para item.to_s, :stroke => snow, :top => topresult, :left => leftresult
		    topresult += 100
		  end

		end


		# O método draw foi baseado no projeto Pretty Dice, escrito por Ed Heil 
		@dice = []

		def draw( left, top, number, color, rotate )

			imagewidth  = 60
			imageheight = 60 

			i = image( imagewidth, imageheight,
				:top  => top - imagewidth / 2, 
				:left => left - imagewidth / 2,
				:shadow => 10, :center => true ) do

				if color == 1 
				  strokecolor = red
				  fillrectanglecolor = tomato
				  filldotscolor = darkred
				else
				  strokecolor = yellow
				  fillrectanglecolor = lightgoldenrodyellow
				  filldotscolor = chocolate
				end 

				sw = 1
				strokewidth sw
				stroke strokecolor

				fill fillrectanglecolor

				inset  = 2
				inset2 = 8

				rect( inset, inset, imagewidth-inset-sw, imageheight-inset-sw, 10 )

				fill filldotscolor

				ovalradius = 10
				low  = inset2
				high = imagewidth - inset2 - ovalradius
				mid  = ( imagewidth - ovalradius ) / 2

				oval( mid, mid, ovalradius ) if number % 2 == 1

				if number > 1
				  oval( low, low, ovalradius )
				  oval( high, high, ovalradius )
				end

				if number > 3
				  oval( low, high, ovalradius )
				  oval( high, low, ovalradius )
				end

				if number > 5
				  oval( mid, low, ovalradius )
				  oval( mid, high, ovalradius )
				end

			end # fim do bloco `image` 

			i.rotate( rand( 359 ) ) if rotate

			@dice << i 

		end

	end
