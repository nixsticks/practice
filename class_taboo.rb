# This demonstrates the Class#new method 
# and shows that you can bind it to a constant name that then becomes the class name
# because all just class names are constants.

# Rewrite the code below without using the class keyword.

# class MyClass < Array.new
#   def my_method
#     'Hello!'
#   end
# end


MyClass = Class.new(Array) do
  def my_method
    'Hello!'
  end
end

a = MyClass.new
puts a.my_method

# I successfully wrote this myself!

