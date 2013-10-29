# Remove class Deck from Blackjack
# Remove the methods from initialize; put in a separate run method
# Break down long methods into smaller ones
# Maybe make the deck an instance variable
# At some point, watch video on refactoring from Ben Orenstein


class Blackjack
	
	attr_accessor :deck, :no_of_decks, :card, :answer, :counter, :turns, :game_end

	def initialize
		@no_of_decks = 0
		@counter = 0
		@turns = 0
		@game_end = false
		
		# welcome
		# pick_a_card
	end

	def run
		welcome
		start_game
		no_of_decks
		pick_a_card
	end

	def welcome
		puts "\nWelcome to my casino! \nWould you like to play a game of Blackjack?"
	end

	def get_input_string
		@answer = gets.chomp.downcase
	end

	def get_input_integer
		@answer = gets.chomp.to_i
	end

	def enter_yes_or_no
		while ["yes", "y", "no", "n"].include?(answer) == false
			puts "Please enter yes or no."
			get_input_string
		end
	end

	def start_game
		get_input_string
		enter_yes_or_no
		case answer
			when "yes", "y"
				puts "\nHave a seat!\n\nDrawing up a chair..."
				sleep(1)
			when "no", "n"
				puts "\nTerrible choice."
				Kernel.exit
		end
	end

	def enter_positive_integer
		while answer <= 0
			puts "Please enter a positive integer."
			get_input_integer
		end
	end

	def no_of_decks
		puts "How many decks would you like to use?"
		get_input_integer
		enter_positive_integer
		no_of_decks = answer
		@deck = Deck.new(no_of_decks)
	end

	def deal
		@card = @deck.cards.sample
		@deck.cards.delete(card)
		@turns += 1
		puts card
	end

	def pick_a_card
		while @turns < 3 and @game_end == false
			puts "Press enter to receive a card."
			answer = gets
			deal if answer == "\n"
			evaluate_card
			win_or_lose
		end
		play_again_message
	end	

	def evaluate_card
		if ["K", "Q", "J", "1"].include? card[0]
			@counter += 10
		elsif card[0] == "A"
			if counter > 11
				@counter += 1
			else
				@counter += 11
			end
		else
			@counter += card[0].to_i
		end
	end

	def win_or_lose
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

	def play_again_message
		puts "\nWould you like to play again?"
		get_input_string
		enter_yes_or_no
		play_again
	end

	def play_again
		case answer
			when "yes", "y"
				@turns = 0
				@counter = 0
				@game_end = false
				puts
				pick_a_card
			when "no", "n"
				puts "Goodbye! Thank you for playing."
				@game_end = true
		end
	end

end

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

game = Blackjack.new
game.run