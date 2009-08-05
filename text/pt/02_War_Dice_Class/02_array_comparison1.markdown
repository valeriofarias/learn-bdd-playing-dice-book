## Testando comparação de arrays 

Nos primeiros testes que eu fiz em meu computador, tive problemas com comparação de arrays. Paralelo a isso me lembrei que é imprescindível o uso de comparação de arrays na classe WarDice. Vamos incluir um teste de comparação de arrays no arquivo dice_spec.rb e verificar o comportamento:

	describe Array do
		it "deve ser comparável" do 
		  ([8,9,10] > [1,2,3]).should be_true 
		end
	end 

Output:

	....F

	1)
	NoMethodError in 'Array deve ser comparável'
	undefined method `>' for [8, 9, 10]:Array
	./spec/dice_spec.rb:43:

	Finished in 0.039464 seconds

	5 examples, 1 failure
