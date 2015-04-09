require_relative "./lib/setter.rb"

def put_the_decode(arr)
	puts arr.join(" ")
end

puts "Welcome to a game of Hangman"
puts ""
puts "The Computer has set the word"
puts ""
turns_left = 16
setter = Setter.new
len = setter.code.length - 1
arr = Array.new(len, "_")
guess_arr = []
put_the_decode(arr)
while(turns_left > 0)
	puts "Turns left = #{turns_left}"
	puts "Enter your guess:"
	guess = gets.chomp
	if guess_arr.any? { |e| e == guess}
		puts "That letter has already been guessed. Try again"
		puts ""
		next
	end
	guess_arr << guess
	setter.respond_to_letter(guess, arr)
	put_the_decode(arr)
	if arr.all? { |e| e != "_" }
		break
	end
	turns_left -= 1
end

if turns_left == 0
	puts "Sorry, you lost"
	puts "The word was #{setter.code}"
else
	puts "Congrats, you won"
end

