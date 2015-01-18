# TEXT TO NUMBER
#
# CHALLENGE DESCRIPTION:
# You have a sting which contains a number represented as English text. Your task is to translate these numbers into
# their integer representation. The numbers can range from negative 999,999,999 to positive 999,999,999. The following
# is an exhaustive list of English words that your program must account for:
#
# negative,
# zero, one, two, three, four, five, six, seven, eight, nine,
# ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen,
# twenty, thirty, forty, fifty, sixty, seventy, eighty, ninety,
# hundred,
# thousand,
# million
#
# INPUT SAMPLE:
# Your program should accept as its first argument a path to a filename. Input example is the following
#
# fifteen
# negative six hundred thirty eight
# zero
# two million one hundred seven

# - Negative numbers will be preceded by the word negative.
# - The word "hundred" is not used when "thousand" could be. E.g. 1500 is written "one thousand five hundred", not
# "fifteen hundred".
#
# OUTPUT SAMPLE:
# Print results in the following way.
#
# 15
# -638
# 0
# 2000107
#
# SOLUTION:
@dictionary = { 'zero'=>0,
                'one'=>1,
                'two'=>2,
                'three'=>3,
                'four'=>4,
                'five'=>5,
                'six'=>6,
                'seven'=>7,
                'eight'=>8,
                'nine'=>9,
                'ten'=>10,
                'eleven'=>11,
                'twelve'=>12,
                'thirteen'=>13,
                'fourteen'=>14,
                'fifteen'=>15,
                'sixteen'=>16,
                'seventeen'=>17,
                'eighteen'=>18,
                'nineteen'=>19,
                'twenty'=>20,
                'thirty'=>30,
                'forty'=>40,
                'fifty'=>50,
                'sixty'=>60,
                'seventy'=>70,
                'eighty'=>80,
                'ninety'=>90,
                'hundred'=>100,
                'thousand'=>1000,
                'million'=>1000000 }

@next_separator = { 'million'=>'thousand',
                    'thousand'=>'hundred',
                    'hundred'=>' ' }

@bases = { 'million'=>1000000,
           'thousand'=>1000,
           'hundred'=>100,
           ' '=> 1 }

def calculate_value(text, separator)
  text_values = text.strip.split(separator, 2)
  return text_values.inject(0) { |sum, value| sum += @dictionary[value].to_i } if separator == ' '

  base = @bases[separator]
  next_separator = @next_separator[separator]

  if text_values.length > 1
    multiply = calculate_value(text_values[0], next_separator)
    addition = text_values[1].empty? ? 0 : calculate_value(text_values[1], next_separator)
  else
    multiply = 0
    addition = calculate_value(text_values[0], next_separator)
  end

  multiply * base + addition
end

File.foreach(ARGV[0]) do |line|
  text_value = line.rstrip
  prefix = 1

  if text_value.start_with?('negative')
    prefix = -1
    text_value.gsub!('negative', '')
  end

  value = calculate_value(text_value, 'million')

  puts (prefix * value)
end