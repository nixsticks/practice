# More metaprogramming from Metaprogramming Ruby

# attr_checked should take the name of the attribute, as well as a block. 
# The block is used for validation. 
# If you assign a value to the attribute and the block doesn’t return true for that value, 
# then you get a runtime exception.
# Your boss’ first requirement is an attr_checked( ) Class Macro,
# and she explains her secondary requirement: 
# “I don’t want this attr_checked() method to be available to each 
# and every class, because I don’t like the idea of cluttering 
# standard classes with my own methods. 
# Instead, a class should gain access to attr_checked() only when 
# it includes a CheckedAttributes module.”

module CheckedAttributes
  def self.attr_checked(:attr, &block)
    yield
  end
end

class Person
  extend CheckedAttributes
  attr_checked :age do |v|
    v >= 18
  end
end

me = Person.new
me.age = 39
me.age = 12 # Exception!