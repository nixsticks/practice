# Including a module's class methods through eigenclasses

# module MyModule
#   def self.my_method; 'hello'; end
# end

# class MyClass
#   include MyModule
# end

# MyClass.my_method   # NoMethodError!

# first solution:

module MyModule
  def my_method; 'hello'; end
end

class MyClass
  class << self
    include MyModule
  end
end

# below is how to make the module method available to an object
# sneakily put the module straight into the object's eigenclass

obj = Object.new
class << obj
  include MyModule
end

puts obj.my_method
puts obj.singleton_methods

# alternative technique Object#extend

obj = Object.new
obj.extend MyModule
obj.my_method # => 'hello'

class MyClass
  extend MyModule
end

MyClass.my_method # => 'hello'