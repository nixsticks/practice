def block_local_variable 
  x = "Original x!" 
  3.times do |i ;x|
    x=i
    puts "x in the block is now #{x}" 
  end
  puts "x after the block ended is #{x}" 
end

block_local_variable
