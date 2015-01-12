# LETTERCASE PERCENTAGE RATIO
#
# CHALLENGE DESCRIPTION:
# Your task is to write a program which determines (calculates) the percentage ratio of lowercase and uppercase letters.
#
# INPUT SAMPLE:
# Your program should accept a file as its first argument. Each line of input contains a string with uppercase and
# lowercase letters.
#
# thisTHIS
# AAbbCCDDEE
# N
# UkJ
#
# OUTPUT SAMPLE:
# For each line of input, print the percentage ratio of uppercase and lowercase letters rounded to the second digit
# after the point.
#
# lowercase: 50.00 uppercase: 50.00
# lowercase: 20.00 uppercase: 80.00
# lowercase: 0.00 uppercase: 100.00
# lowercase: 33.33 uppercase: 66.67
#
# SOLUTION:

File.foreach(ARGV[0]) do |line|
  line = line.rstrip
  lower_count = line.scan(/[a-z]/).count
  lower_percent = (lower_count == 0 ? 0 : (lower_count * 100 / line.length.to_f).round(2))

  puts "lowercase: #{'%#.2f' % lower_percent} uppercase: #{'%.2f' % (100.to_f - lower_percent)}"
end