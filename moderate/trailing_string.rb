# TRAILING STRING
#
# CHALLENGE DESCRIPTION:
# There are two strings: A and B. Print 1 if string B occurs at the end of string A. Otherwise, print 0.
#
# INPUT SAMPLE:
# The first argument is a path to the input filename containing two comma-delimited strings, one per line. Ignore all
# empty lines in the input file.
#
# For example:
#
# Hello World,World
# Hello CodeEval,CodeEval
# San Francisco,San Jose
#
# OUTPUT SAMPLE:
# Print 1 if the second string occurs at the end of the first string. Otherwise, print 0.
#
# For example:
#
# 1
# 1
# 0
#
# SOLUTION:
File.foreach(ARGV[0]) do |line|
  strings = line.rstrip.split(',')
  next if strings.empty?

  puts (strings[0].match(/#{strings[1]}$/) == nil ? 0 : 1)
end