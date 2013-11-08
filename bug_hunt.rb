# This code demonstrates bugs in Ghost Methods... and how they can be hard to squash.

# "Bug" code below.
# class Roulette
#   def method_missing(name, *args)
#     person = name.to_s.capitalize
#     super unless %w[Bob Frank Bill].include? person
#     3.times do
#       number = rand(10) + 1
#       puts "#{number}..."
#     end
#     "#{person} got a #{number}"
#   end
# end

# number_of = Roulette.new

# puts number_of.bob

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless %w[Bob Frank Bill].include? person
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

puts Roulette.new.Bob