class Blackjack

	class Deck
		attr_reader :cards

		SUITS = %w{ Clubs Diamonds Hearts Spades }
		RANKS = %w{ 2 3 4 5 6 7 8 9 10 Jack Queen King Ace }

		def initialize(n=1)
			@cards = []
			SUITS.cycle(n) do |s|
				RANKS.each do |r|
					@cards << "#{r} of #{s}"
				end
			end
		end
	end

	puts "WELCOME TO MY CASINO!\n"
	puts "Hello. Would you like to play a game of Blackjack?"
	answer = gets.chomp.downcase
	case answer
	when "yes", "y"
			puts "Have a seat!"
	when "no", "n"
		puts "Terrible choice."
		Kernel.exit
	else
		puts "Are you stupid? Please answer yes or no."
		answer = gets.chomp.downcase
	end

	deck = Deck.new(1)

	counter = 0

	dealer = Proc.new do
		card = deck.cards.sample
		# maybe add a method to delete cards, it should take a card as an argument
		deck.cards.delete(card)
		puts card
		puts
		if counter == 21
			puts "Fine, you win."
			Kernel.exit
		elsif #["K", "Q", "J"].each {|element| card.include?(element)}
			card.include? "K" or card.include? "Q" or card.include? "J" or card.include? "10"
			counter += 10
		elsif card.include? "A"
			if counter > 11
				counter += 1
			else
				counter += 11
			end
		else
			counter += card[0].to_i
		end
	end

	PICKACARD = "Press enter to pick a card."
	puts PICKACARD
	answer = gets
	puts "Here is your first card." if answer == "\n"
	dealer.call

	puts PICKACARD
	answer = gets
	puts "Here is your second card." if answer == "\n"
	dealer.call

	puts PICKACARD
	answer = gets
	puts "Here is your third card." if answer == "\n"
	dealer.call

	puts "Press enter to continue."
	answer = gets
	puts "Doing mathy things... \nYour total is #{counter}.\n" if answer == "\n"
	if counter == 21
		puts "Fine, you win."
	else
		puts "YOU LOSE, SUCKER!"
	end

end

Blackjack.new
