# This is a method that demonstrates passing arguments to a block 
# as well as the order in which arguments are passed to parameters.

def args_unleashed
  yield(1, 2, 3, 4, 5)
end

args_unleashed do | a, b=1, *c, d, e |
  puts "Arguments: "
  p a, b, c, d, e
end
