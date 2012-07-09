require './sievemodule.so'
include SieveModule


iterations = 1000000
result = invoke_sieve(iterations)


# puts "Primes under #{iterations}:"
# result.each_with_index do |item, ii|;
#   if result[ii] == 1 # Then value is a prime; Print it out.
#     print ii + 2
#     print " "
#   else 
#     # Value is composite.
#   end
# end
# puts "\n"


# 0.0393 second average run time (10,000 iterations) (I/O included)
# 1.404 second average run time (1,000,000 iterations) (I/O included)

# 0.0221 second average run time (10,000 iterations) (Computation only)
# 0.0592 second average run time (1,000,000 iterations) (Computation only)
