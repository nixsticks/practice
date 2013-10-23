celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
for c in celsius
  f = (c * 1.8) + 32
  puts sprintf("%.0f", f)
end