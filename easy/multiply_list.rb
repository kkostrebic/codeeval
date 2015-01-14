# MULTIPLY LISTS
#
# CHALLENGE DESCRIPTION:
# You have 2 lists of positive integers. Write a program which multiplies corresponding elements in these lists.
#
# INPUT SAMPLE:
# Your program should accept as its first argument a path to a filename. Input example is the following
#
# 9 0 6 | 15 14 9
# 5 | 8
# 13 4 15 1 15 5 | 1 4 15 14 8 2
#
# The lists are separated with a pipe char, numbers are separated with a space char. The number of elements in lists are
# in range [1, 10]. The number of elements is the same in both lists.
#                                                                                                                                                                                                                                                                     135 0 54
# 40
# 13 16 225 14 120 10
#
# SOLUTION:
File.foreach(ARGV[0]) do |line|
  arrays = line.rstrip.split(' | ')
  arr1 = arrays[0].split(' ')
  arr2 = arrays[1].split(' ')

  result = []
  (0..arr1.length-1).each do |index|
    result << arr1[index].to_i * arr2[index].to_i
  end

  puts result.join(' ')
end