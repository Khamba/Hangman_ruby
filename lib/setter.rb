class Setter
	attr_reader :code

	def initialize
		dictionary = File.open("5desk.txt", "r")
		lines = dictionary.readlines
		@code = ""
		while @code.length < 5 || @code.length > 12
			@code = lines[rand(lines.length)]
			#puts @code
		end
		dictionary.close
	end

	def respond_to_letter(letter, disp_arr)
		@code.length.times do |i|
			if @code[i].downcase == letter.downcase
				disp_arr[i] = letter
			end
		end
		return disp_arr
	end
end

#setter = Setter.new
#puts setter.respond_to_letter("a", ["_","_","_","_","_","_","_","_","_","_","_","_"]).join("")