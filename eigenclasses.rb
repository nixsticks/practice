# demonstrates 

class C
  def a_method
    'C#a_method()'
  end

  class << self
    def a_class_method
      'C.a_class_method()'
    end
  end
end

class D < C; end

obj = D.new
puts obj.a_method

# obj -> D -> C -> Object

class Object
  def eigenclass
    class << self
      self
    end
  end
end

class << obj
  def a_singleton_method
    'obj#a_singleton_method()'
  end
end

puts obj.eigenclass
puts obj.eigenclass.superclass
puts C.eigenclass
puts D.eigenclass
puts D.eigenclass.superclass
puts C.eigenclass.superclass