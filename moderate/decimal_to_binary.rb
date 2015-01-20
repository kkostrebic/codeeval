# DECIMAL TO BINARY
#
# CHALLENGE DESCRIPTION:
# You are given a decimal (base 10) number, print its binary representation.
#
# INPUT SAMPLE:
# Your program should accept as its first argument a path to a filename containing decimal numbers greater or equal to
# 0, one per line.
#
# Ignore all empty lines. For example:
#
# 2
# 10
# 67
#
# OUTPUT SAMPLE:
# Print the binary representation, one per line. For example:
#
# 10
# 1010
# 1000011
#
# SOLUTION:
File.foreach(ARGV[0]) do |line|
  number = line.rstrip
  next if number.empty?

  puts '%b' % number
end