# Old bad code:

# class Loan
#   def initialize(book)
#     @book = book
#     @time = Time.now
#   end

#   def to_s
#     "#{@book.upcase} loaned on #{@time}"
#   end
# end


class Loan
  def initialize(book)
    @book = book
    @time = Loan.time_class.now
  end

  def self.time_class
    @time_class || Time
  end

  def to_s
    "#{@book.upcase} loaned on #{@time}"
  end
end



# SO the issue here was that we wanted to write a test for to_s
# but to do so we needed to know what time the object was created
# and we couldn't access it without querying the object itself directly
# which negates the purpose of the test (which tests whether querying the object
# returns the same time as the time you think it should be)
# In the new Loan class, @time is set to Loan.time_class.now
# and time_class returns @time_class, which is automatically nil and so set to Time.
# But in the unit tests we can make a fake time class that always returns the same
# value. The tests can assign a value to the @time_class variable by using either 
# class_eval or instance_eval.

class FakeTime
  def self.now; 'Mon Apr 06 12:15:50'; end
end

require 'test/unit'

class TestLoan < Test::Unit::TestCase
  def test_conversion_to_string
    Loan.instance_eval { @time_class = FakeTime }
    loan = Loan.new('War and Peace')
    assert_equal 'WAR AND PEACE loaned on Mon Apr 06 12:15:50', loan.to_s
  end
end

# This seems needlessly convoluted to me.