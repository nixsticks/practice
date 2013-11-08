# Demonstrates the uses of Singleton Methods.

# The code below is annoying because it is exactly like the String class except for the title? method
# But we don't want to Monkeypatch it because it doesn't make sense on each string, only on paragraphs

# class Paragraph
#   def initialize(text)
#     @text = text
#   end

#   def title?
#     @text.upcase == @text
#   end

#   def reverse
#     @text.reverse
#   end

#   def upcase
#     @text.upcase
#   end
# end

# You want to be able to do this:
def index(paragraph)
  add_to_index(paragraph) if paragraph.title?
end


# So if you define a singleton method for a particular string, you can make sure ONLY THAT STRING 
# responds to the method. Not quite sure why you want to do that? Doesn't it mean you would have to 
# define it for each string you wanted to be a title...?

def str.title?
  self.upcase == self
end

str.title?                    # => false 
str.methods.grep(/title?/)    # => ['title?']
str.singleton_methods         # => ['title?']

# Now you can do the below:

paragraph = "any string can be a paragraph"

def paragraph.title?
  self.upcase == self
end

index(paragraph)