# TEXT DOLLAR
#
# CHALLENGE DESCRIPTION:
# Credits: This challenge has been authored by Terence Rudkin
#
# You are given a positive integer number. This represents the sales made that day in your department store. The
# payables department however, needs this printed out in english. NOTE: The correct spelling of 40 is Forty. (NOT
# Fourty)
#
# INPUT SAMPLE:
# Your program should accept as its first argument a path to a filename.The input file contains several lines. Each line
# is one test case. Each line contains a positive integer. E.g.
#                                                                                                                                                                                  3
# 10
# 21
# 466
# 1234
#
# OUTPUT SAMPLE:
# For each set of input produce a single line of output which is the english textual representation of that integer. The
# output should be unspaced and in Camelcase. Always assume plural quantities. You can also assume that the numbers are
# < 1000000000 (1 billion). In case of ambiguities e.g. 2200 could be TwoThousandTwoHundredDollars or
# TwentyTwoHundredDollars, always choose the representation with the larger base i.e. TwoThousandTwoHundredDollars. For
# the examples shown above, the answer would be:
#                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ThreeDollars
# TenDollars
# TwentyOneDollars
# FourHundredSixtySixDollars
# OneThousandTwoHundredThirtyFourDollars
#
# SOLUTION:
@dictionary = { 0=>'',
                1=>'One',
                2=>'Two',
                3=>'Three',
                4=>'Four',
                5=>'Five',
                6=>'Six',
                7=>'Seven',
                8=>'Eight',
                9=>'Nine',
                10=>'Ten',
                11=>'Eleven',
                12=>'Twelve',
                13=>'Thirteen',
                14=>'Fourteen',
                15=>'Fifteen',
                16=>'Sixteen',
                17=>'Seventeen',
                18=>'Eighteen',
                19=>'Nineteen',
                20=>'Twenty',
                30=>'Thirty',
                40=>'Forty',
                50=>'Fifty',
                60=>'Sixty',
                70=>'Seventy',
                80=>'Eighty',
                90=>'Ninety',
                100=>'Hundred',
                1000=>'Thousand',
                1000000=>'Million' }

@next_separator = { 1000000=>1000,
                    1000=>100,
                    100=>10,
                    10=>1 }

def calculate_value(value, separator)
  return @dictionary[value] if separator == 1 || value <= 20

  return_value = ''
  next_separator = @next_separator[separator]

  if separator > 10
    left_value = calculate_value(value/separator, next_separator)
    base = @dictionary[separator]
  else
    left_value = calculate_value((value/separator)*separator, next_separator)
    base = ''
  end

  right_value = calculate_value(value%separator, next_separator)

  if left_value.length > 0
    return_value << left_value
    return_value << base
  end

  return_value << right_value

  return_value
end

File.foreach(ARGV[0]) do |line|
  value = line.rstrip.to_i
  value = calculate_value(value, 1000000)

  puts "#{value}Dollars"
end