# UNIQUE ELEMENTS
#
# CHALLENGE DESCRIPTION:
# You are given a sorted list of numbers with duplicates. Print out the sorted list with duplicates removed.
#
# INPUT SAMPLE:
# File containing a list of sorted integers, comma delimited, one per line. E.g.
#
# 1,1,1,2,2,3,3,4,4
# 2,3,4,5,5
#
# OUTPUT SAMPLE:
# Print out the sorted list with duplicates removed, one per line. E.g.
#
# 1,2,3,4
# 2,3,4,5
#
# SOLUTION:
File.foreach(ARGV[0]) do |line|
  arr = line.rstrip.split(/,/).map(&:to_i)
  puts arr.uniq.join(',')
end
