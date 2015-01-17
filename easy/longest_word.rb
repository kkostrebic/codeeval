# LONGEST WORD
#
# CHALLENGE DESCRIPTION:
# In this challenge you need to find the longest word in a sentence. If the sentence has more than one word of the same
# length you should pick the first one.
#
# INPUT SAMPLE:
# Your program should accept as its first argument a path to a filename. Input example is the following
#
# some line with text
# another line
#
# Each line has one or more words. Each word is separated by space char.
#
# OUTPUT SAMPLE:
# Print the longest word in the following way.
#
# some
# another
#
# SOLUTION 1:
# File.open(ARGV[0]).each_line do |line|
#   words = line.strip.split(' ')
#
#   max_word = ''
#   words.each do |word|
#     max_word = word if word.length > max_word.length
#   end
#
#   puts max_word
# end

# SOLUTION 2:
File.foreach(ARGV[0]) do |line|
  words = line.rstrip.split(' ')

  max_word = words[0]
  max_length = max_word.length

  words.each do |word|
    next unless word.length > max_length

    max_word = word
    max_length = max_word.length
  end

  puts max_word
end