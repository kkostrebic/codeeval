# ROMAN AND ARABIC
#
# CHALLENGE DESCRIPTION:
# This challenge involves calculating the value of “aromatic” numbers which are a combination of Arabic digits and Roman
# numerals. An aromatic number is of the form A1R1A2R2 ... AnRn, where each Ai is an Arabic digit, and each Ri is a
# Roman numeral. Each pair AiRi contributes a value described below, and by adding or subtracting these values together
# we get the value of the entire aromatic number.
#                                                                                                                                                                                                                                                                                                                                                                                                                    An Arabic digit A can be 0, 1, 2, 3, 4, 5, 6, 7, 8 or 9.
# A Roman numeral R is one of the seven letters I, V, X, L, C, D, or M. Each Roman numeral has a base value: 1, 5, 10,
# 50, 100, 500, 1000, respectively.
#
# The value of a pair AR is A times the base value of R. Normally, you add up the values of the pairs to get the overall
# value. However, wherever there are consecutive symbols ARA`R` with R` having a strictly bigger base value than R, the
# value of pair AR must be substracted from the total, instead of being added.
#
# For example, the number 3M1D2C has the value 3 × 1000 + 1 × 500 + 2 × 100 = 3700 and 3X2I4X has the value
# 3 × 10 - 2 × 1 + 4 × 10 = 68 . Write a program that calculates the values of aromatic numbers.
#
# INPUT SAMPLE:
# The input is a valid aromatic number consisting of between 2 and 20 symbols. Your program should accept as its first
# argument a path to a filename. E.g.:
#
# 3M1D2C
# 2I3I2X9V1X
#
# OUTPUT SAMPLE:
# The output is the decimal value of the given aromatic number.
#
# 3700
# -16
#
# SOLUTION:
romans = { 'I'=>1,
           'V'=>5,
           'X'=>10,
           'L'=>50,
           'C'=>100,
           'D'=>500,
           'M'=>1000 }

File.foreach(ARGV[0]) do |line|
  number = line.rstrip

  sum = 0
  value = 0
  check = 1
  last_roman_base = 0

  (number.length - 1).downto(0) do |index|
    if check % 2 == 0
      sum += (number[index].to_i * value)
    else
      base = romans[number[index]]
      prefix = (base < last_roman_base ? -1 : 1)
      value = (prefix * base)

      last_roman_base = base
    end

    check += 1
  end

  puts sum
end