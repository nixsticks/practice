class Ticket

	attr_reader :artist, :venue, :date, :seat

	def initialize(artist, venue, date, seat)
		@artist = artist
		@venue = venue
		@date = date
		@seat = seat
	end

	def print_ticket
		puts "#{ticket}: #{ticket.artist} will be playing at #{ticket.venue} on #{ticket.date}."
		puts "Your seat is: #{seat}."
	end

	def Ticket.information
		while true do
			puts "Please type in your ticket number."
			ticket = gets.chomp
			puts "Please type artist, venue, date, or seat."
			request = gets.chomp
			request.downcase!
			if ticket.respond_to? request
				ticket.send(request)
			elsif puts "I did not understand your request."
			end
	end
end	

t_00001 = Ticket.new("Hanson", "The Starland Ballroom", "11/04/13", "3A balcony")

Ticket.information