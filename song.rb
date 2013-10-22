class Song

	@@plays = 0

	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
		@plays = 0
	end

	def to_s
		"#{@name}, #{@artist} (#{@duration})"		
	end

	def play
		@plays += 1
		@@plays += 1
		puts "This song has played #{@plays} times. The jukebox has been used #{@@plays} times."
	end

	attr_reader :name, :artist, :duration

	attr_writer :duration

end

class KaraokeSong < Song

	def initialize(name, artist, duration, lyrics)
		super(name, artist, duration)
		@lyrics = lyrics
	end

	def to_s
		super + " Lyrics: \"#{@lyrics}\""
	end

	def lyrics
		@lyrics
	end

end

class SongList

	MaxTime = 5.00

	def SongList.isTooLong(song)
		return song.duration >= 5.00
	end

end



thistimearound = Song.new("This Time Around", "Hanson", 3.13)
puts thistimearound.to_s

myway = KaraokeSong.new("My Way", "Frank Sinatra", 4.00, "And now, the...")
puts myway.to_s

thistimearound.play 
myway.play
thistimearound.play

puts SongList.isTooLong(thistimearound)