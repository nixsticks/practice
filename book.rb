class Book
  def title # ...
  end

  def subtitle # ...
  end
  
  def lend_to(user)
    puts "Lending to #{user}"
    # ...
  end

  def self.deprecate(old_method, new_method)
    # what appears to be happening right now: 
    # when you try to call the old method define_method catches it
    # and sends (what?) the new method with optional args and block
    # ok it appears to be sending self the new method. ok.
    # but here's my confusion -- isn't deprecate a class method/macro here
    # i get calling deprecate on the class/self
    # what happens when you try to call it on an instance of an object?

    # so let's work through step by step
    # first you deprecate the old methods, which redefines them to send the new method to self i guess.
    # oh I GET IT
    # WTF im so stupid
    # deprecate is a class macro but you are not calling deprecate on the object it redefines the old method
    # and so when you call it on an object it sends the object the new method instead wtf you stupid idiot

    define_method(old_method) do |*args, &block|
      warn "Warning: #{old_method}() is deprecated. Use #{new_method}()."
      send(new_method, *args, &block)
    end
  end
  deprecate :GetTitle, :title
  deprecate :LEND_TO_USER, :lend_to
  deprecate :title2, :subtitle
end

b = Book.new
b.LEND_TO_USER("Bill")
# >> Warning: LEND_TO_USER() is deprecated. Use lend_to().
# >> Lending to Bill