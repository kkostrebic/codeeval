# SHORTEST REPETITION
#
# CHALLENGE DESCRIPTION:
# Write a program to determine the shortest repetition in a string. A string is said to have period p if it can be
# formed by concatenating one or more repetitions of another string of length p. For example, the string "xyzxyzxyzxyz"
# has period 3, since it is formed by 4 repetitions of the string "xyz". It also has periods 6 (two repetitions of
# "xyzxyz") and 12 (one repetition of "xyzxyzxyzxyz").
#
# INPUT SAMPLE:
# Your program should accept as its first argument a path to a filename. Each line will contain a string of up to 80
# non-blank characters. E.g.
#
# abcabcabcabc
# bcbcbcbcbcbcbcbcbcbcbcbcbcbc
# dddddddddddddddddddd
# adcdefg
#
# OUTPUT SAMPLE:
# Print out the smallest period of the input string. E.g.
#                                                       3
# 2
# 1
# 7

# SOLUTION:
def repeats(chars, chars_len, test_len)
  return false unless chars_len % test_len == 0

  test_result = true
  start_slice =  chars.slice(0, test_len)
  step = test_len
  iterations = chars_len/test_len - 1

  (0..iterations).each do |iteration|
    next if iteration == 0

    compare_slice = chars.slice(iteration*step, step)
    if start_slice != compare_slice
      test_result = false
      break
    end
  end

  test_result
end

File.open(ARGV[0]).each_line do |line|
  chars = line.split('')
  chars.delete("\n")
  chars_len = chars.length
  primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79]

  list = primes.include?(chars_len) ? [1, chars_len] : (1..chars_len)

  list.each do |len|
    if repeats(chars, chars_len, len)
      puts len
      break
    end
  end
end