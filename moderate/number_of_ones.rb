# NUMBER OF ONES
#
# CHALLENGE DESCRIPTION:
# Write a program which determines the number of 1 bits in the internal representation of a given integer.
#
# INPUT SAMPLE:
# The first argument is a path to a file. The file contains integers, one per line.
#
# For example:
#
# 10
# 22
# 56
#
# OUTPUT SAMPLE:
# Print to stdout the number of ones in the binary form of each number.
#
# For example:
#
# 2
# 3
# 3
#
# SOLUTION:
File.open(ARGV[0]).each_line do |line|
  puts line.to_i(10).to_s(2).split('').select { |bit| bit == '1' }.count
end