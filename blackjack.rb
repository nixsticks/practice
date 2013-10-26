class Blackjack

	class Deck
		attr_accessor :cards

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
	
	def welcome
		puts "\nWelcome to my casino! \nWould you like to play a game of Blackjack?"
		answer = gets.chomp.downcase

		while answer != "yes" and answer != "no" and answer != "y" and answer != "n"
			puts "Please enter yes or no."
			answer = gets.chomp.downcase
		end

		case answer
			when "yes", "y"
				puts "\nHave a seat!\n\nDrawing up a chair..."
				sleep(1)
			when "no", "n"
				puts "\nTerrible choice."
				Kernel.exit
		end
	end

	def deal
		deck = Deck.new(1)
		card = deck.cards.sample
		deck.cards.delete(card)
		@turns += 1
		puts card

		if card.include? "K" or card.include? "Q" or card.include? "J" or card.include? "10"
			@counter += 10
		elsif card.include? "A"
			if counter == 10
				puts "BLACKJACK!"
				@game_end = true
			elsif counter > 11
				@counter += 1
			else
				@counter += 11
			end
		else
			@counter += card[0].to_i
		end

		if @counter == 21
			puts "BLACKJACK!"
			@game_end = true
		elsif @turns > 2 and counter != 21
			puts "Your total is #{counter}. \n\nSorry, you lose."
			@game_end = true
		else
			puts "Your total is #{counter}.\n\n"
		end
	end

	def pick_a_card
		while @turns < 3 and @game_end == false
			puts "Press enter to randomly select a card."
			answer = gets
			deal if answer == "\n"
		end
		play_again
	end

	def play_again
		puts "\nWould you like to play again?"
		answer = gets.chomp.downcase
		while answer != "yes" and answer != "no" and answer != "y" and answer != "n"
			puts "Please answer yes or no."
			answer = gets.chomp.downcase
		end
		case answer
			when "yes", "y"
				@game_end = false
				@turns = 0
				@counter = 0
				puts
				pick_a_card
			when "no", "n"
				puts "Goodbye! Thank you for playing."
				Kernel.exit
		end
	end

	attr_accessor :n2, :counter, :turns, :game_end

	def initialize
		@n2 = 0
		@counter = 0
		@turns = 0
		@game_end = false
		
		welcome
		pick_a_card
	end

end

Blackjack.new