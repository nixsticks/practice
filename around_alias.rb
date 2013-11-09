# Quiz on Around Alias

# As you know,” he observes, “most Ruby operators are actually Mimic Methods.” 
# For example, the + operator on integers is syntactic sugar for a method named Fixnum#+( ). 
# When you write 1 + 1, the parser internally converts it to 1.+(1).
# “The cool thing about methods is that you can redefine them. 
# So, here’s your challenge: break the rules of math 
# by redefining Fixnum#+( ) so that it always returns the correct result plus one.” For example:

class Fixnum
  alias :old_plus :+

  def +(n)
    self.old_plus(n).old_plus(1)
  end
end

puts "#{1 + 3}"

# muahahaha i did it.