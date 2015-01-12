# REVERSE WORDS
#
# CHALLENGE DESCRIPTION:
# Write a program which reverses the words in an input sentence.
#
# INPUT SAMPLE:
# The first argument is a file that contains multiple sentences, one per line. Empty lines are also possible.
#
# Hello World
# Hello CodeEval
#
# OUTPUT SAMPLE:
# Print to stdout each sentence with the reversed words in it, one per line. Empty lines in the input should be ignored.
# Ensure that there are no trailing empty spaces in each line you print.
#
# World Hello
# CodeEval Hello
#
# SOLUTION 1:
File.foreach(ARGV[0]) do |line|
  result = ''
  arr = line.rstrip.split(' ')

  (arr.length-1).downto(0) do |index|
    result << arr[index]
    result << ' '
  end

  puts result.rstrip
end

# SOLUTION 2:
# File.open(ARGV[0]).each_line do |line|
#   puts line.split(' ').reverse.join(' ')
# end