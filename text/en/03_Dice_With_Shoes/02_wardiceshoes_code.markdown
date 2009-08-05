## The War Dice Shoes Code

Finally the last application. Copy the following code in a new file and save with the name wardiceshoes.rb in the lib folder. I put some remarks across the code to facilitate the  understanding. Have a nice experiment.

	require 'dice'

	Shoes.app :title => "Dice of War game", :width => 500, :height => 500 do
		background gradient( black, teal )

		# List with number of red dice: 1, 2 or 3
		para "Red", :stroke => tomato
		@numberreddice = list_box :items => ["1", "2", "3"],
		  :width => 70, :choose => "3" do |list|
		end

		para " X ", :stroke => snow

		# List with number of yellow dice: 1, 2 or 3   
		@numberyellowdice = list_box :items => ["1", "2", "3"],
		  :width => 70, :choose => "3" do |list|
		end
		para "Yellow", :stroke => yellow

		# Define an aleatory position
		@a = @b = @c = []

		 (40..200).step(10){ |x| @a << x }
		(230..450).step(10){ |y| @b << y }
		(80..450).step(10){  |z| @c << z }

		# Variables that will store values of wardice object 
		@reddice = @yellowdice = @resulttext = []

		button "Attack", :width => 80 do

		  # Clear the screen
		  @dice.each{ |d| d.remove }
		  @resulttext.each{ |a| a.remove }	

		  # The wardice object is initializing
		  wardice = WarDice.new( @numberreddice.text.to_i, @numberyellowdice.text.to_i ) 
		  @reddice    = wardice.reddice
		  @yellowdice = wardice.yellowdice
		  @result     = wardice.result

		  # Every dice is drawn in random position 
		  @reddice.each{ |item| draw( @a[rand(@a.length)], @c[rand(@c.length)], item.to_s.to_i, 1, true ) }
		  @yellowdice.each{ |item| draw( @b[rand(@b.length)], @c[rand(@c.length)], item.to_s.to_i, 2, true )}

		end

		button "Verify", :width => 80 do

		  # Clear the screen
		  @dice.each{ |d| d.remove }
		  @resulttext.each{ |a| a.remove }
		
		  # Initial position of dice
		  leftyellow = 250
		  leftred    = 150
		  topred     = topyellow = 100

		  # Every dice are drawn in a defined position
		  @reddice.each do |item| 
		    draw( leftred, topred, item.to_s.to_i, 1, false )
		    topred += 100
		  end

		  @yellowdice.each do |item| 
		    draw( leftyellow, topyellow, item.to_s.to_i, 2, false )
		    topyellow += 100
		  end

		  # Initial position of result
		  leftresult = 300
		  topresult  = 80

		  # The results are drawn in defined positions
		  @result.each_with_index do |item, index|
		    @resulttext[index] = para item.to_s, :stroke => snow, :top => topresult, :left => leftresult
		    topresult += 100
		  end

		end


		# Method draw was based in the Pretty Dice project written by Ed Heil 
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

			end # end of image block

			i.rotate( rand( 359 ) ) if rotate

			@dice << i 

		end

	end
