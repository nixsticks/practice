require "stacklike"

class Suitcase
end

class CargoHold
	
	include Stacklike
	
	def load_and_report(obj)
		puts "Loading object #{obj.object_id}"
		add_to_stack(obj)
	end

	def unload
		take_from_stack
	end

end

ch = CargoHold.new
sc1 = Suitcase.new
sc2 = Suitcase.new
sc3 = Suitcase.new

ch.load_and_report(sc1)
ch.load_and_report(sc2)
ch.load_and_report(sc3)

first_unloaded = ch.unload

puts "The first suitcase off the plane is... #{first_unloaded.object_id}"