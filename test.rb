module Printable
  def print
    # ...
      "Printable#print()"
  end
  
  def prepare_cover
    # ...
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end
  
  def format_for_screen
    # ...
  end
  
  def print
    # ...
    "Document#print()"
  end
end

class Book
  include Printable
  include Document
  
  # ...  
end

b = Book.new
b.print_to_screen

Book.ancestors  # => [Book, Printable, Document, Object, Kernel, BasicObject]