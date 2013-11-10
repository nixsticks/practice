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


def add_checked_attribute(clazz, attribute, &validation)
  clazz.class_eval do
    define_method "#{attribute}=" do |value, &validation|
      raise 'Invalid attribute' unless yield(value) == true
      @attribute = value
    end

    define_method "#{attribute}" do
      @attribute
    end
  end
end

# Note: in the book, they used raise 'Invalid attribute' unless validation.call(value)

require 'test/unit'

class Person; end

class TestCheckedAttribute < Test::Unit::TestCase
  def setup
    add_checked_attribute(Person, :age) {|v| v >= 18 }
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_invalid_Values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = 17
    end
  end
end


