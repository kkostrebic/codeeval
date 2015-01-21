# REMOVE CHARACTERS
#
# CHALLENGE DESCRIPTION:
# Write a program which removes specific characters from a string.
#
# INPUT SAMPLE:
# The first argument is a path to a file. The file contains the source strings and the characters that need to be
# scrubbed. Each source string and characters you need to scrub are delimited by comma.
#
# For example:
#
# how are you, abc
# hello world, def
#
# OUTPUT SAMPLE:
# Print to stdout the scrubbed strings, one per line. Ensure that there are no trailing empty spaces on each line you
# print.
#
# For example:
#
# how re you
# hllo worl
#
# SOLUTION:
File.foreach(ARGV[0]) do |line|
  values = line.rstrip.split(', ', 2)

  source = values[0]
  chars_to_remove = values[1]

  puts source.gsub(/[#{chars_to_remove}]/, '').strip
end