animals = %w{dog rabbit horse goat mouse snake}
count = 0

for animal in animals
	puts "The current animal is #{animal}"
	break if count == 10
	count += 1
	retry if animal == "horse"
end