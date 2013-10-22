class C
	
	def x(value, recurse=false)
		a = value
		puts "This is self: #{self.object_id}"
		puts "And this is a: #{a}"
		if recurse
			puts "Because we are in the scope of the first x."
			puts "Recursing by calling myself..."
			x("value2")
			puts "Because now we are in the scope of the second x."
			puts "Back after recursion; here's a: #{a}"
			puts "Because we are back in the scope of the first x."
			puts "But as you can see, self never changed: it is still #{self.object_id}."
		end
	end

end

c = C.new
c.x("value1", true)