# UGLY NUMBERS
#
# CHALLENGE DESCRIPTION:
# Credits: This challenge has appeared in a google competition before.
# Once upon a time in a strange situation, people called a number ugly if it was divisible by any of the one-digit
# primes (2, 3, 5 or 7). Thus, 14 is ugly, but 13 is fine. 39 is ugly, but 121 is not. Note that 0 is ugly. Also note
# that negative numbers can also be ugly: -14 and -39 are examples of such numbers.
#
# One day on your free time, you are gazing at a string of digits, something like: 123456
# You are amused by how many possibilities there are if you are allowed to insert plus or minus signs between the
# digits. For example you can make: 1 + 234 - 5 + 6 = 236 which is ugly. Or 123 + 4 - 56 = 71 which is not ugly.
#
# It is easy to count the number of different ways you can play with the digits: Between each two adjacent digits you
# may choose put a plus sign, a minus sign, or nothing. Therefore, if you start with D digits there are 3^(D-1)
# expressions you can make. Note that it is fine to have leading zeros for a number. If the string is '01023', then
# '01023', '0+1-02+3' and '01-023' are legal expressions.
#
# Your task is simple: Among the 3^(D-1) expressions, count how many of them evaluate to an ugly number.
#
# INPUT SAMPLE:
# Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Each
# test case will be a single line containing a non-empty string of decimal digits. The string in each test case will be
# non-empty and will contain only characters '0' through '9'. Each string is no more than 13 characters long. E.g.
#
# 1
# 9
# 011
# 12345
#
# OUTPUT SAMPLE:
# Print out the number of expressions that evaluate to an ugly number for each test case, each one on a new line. E.g.
#
# 0
# 1
# 6
# 64
#
# SOLUTION:
def get_values(numbers)
  next_value = numbers[0]
  return [next_value] if numbers[1] == nil

  values = get_values(numbers[1..-1])

  return_values = []

  values.each do |value|
    return_values << "#{next_value}+#{value}"
    return_values << "#{next_value}+-#{value}"
    return_values << "#{next_value}#{value}"
  end

  return_values
end

File.foreach(ARGV[0]) do |line|
  counter = 0
  numbers = line.rstrip

  boost = numbers.gsub(/^0*/, '')
  boost = '0' if boost.empty?

  all_values = get_values(boost)

  all_values.each do |value|
    sum = value.split('+').inject(0) { |sum, item| sum += item.to_i }
    counter += 1 if (sum % 2 == 0 || sum % 3 == 0 || sum % 5 == 0 || sum % 7 == 0)
  end

  exponent = numbers.length - boost.length
  p 3**exponent*counter
end