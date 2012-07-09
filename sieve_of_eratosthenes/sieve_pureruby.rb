def eratosthenes(n)
  nums = [0, 0] + (2..n).to_a
  (2..Math.sqrt(n).to_i).each do |i|
    if nums[i].nonzero?
      (i**2..n).step(i) {|m| nums[m] = 0}
    end
  end
  nums.find_all {|m| m.nonzero?}
end
 
eratosthenes(1000000)

# 0.1566 second average run time (10,000 iterations) (I/O included)
# 1.7979 second average run time (1,000,000 iterations) (I/O included)

# 0.0267 second average run time (10,000 iterations) (Computation only)
# 0.6064 second average run time (1,000,000 iterations) (Computation only)



