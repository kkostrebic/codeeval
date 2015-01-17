# DIGIT STATISTICS
#
# CHALLENGE DESCRIPTION:
# Given the numbers "a" and "n" find out how many times each digit from zero to nine is the last digit of the number in
# a sequence [a, a^2, a^3, ... a^(n-1), a^n]
#
# INPUT SAMPLE:
# Your program should accept as its first argument a path to a filename. Each line of input contains two space separated
# integers "a" and "n" E.g:
#
# 2 5
#
# OUTPUT SAMPLE:
# For each line of input print out how many times the digits zero, one, two ... nine occur as the last digit of numbers
# in the sequence E.g:
#
# 0: 0, 1: 0, 2: 2, 3: 0, 4: 1, 5: 0, 6: 1, 7: 0, 8: 1, 9: 0
#
# In this example, the sequence consists of numbers 2, 4, 8, 16 and 32. Among the last digits, the digit two occurs
# twice, and each of the digits four, six and eight occurs once.
#
# Constraints:
# 1 ≤ n ≤ 1 000 000 000 000,
# 2 ≤ a ≤ 9
#
# SOLUTION:
File.open(ARGV[0]).each_line do |line|
  array = line.split(' ')
  digit_base = array[0].to_i(10)
  exp = array[1].to_i(10)
  statistics = { 0=>0,
                 1=>0,
                 2=>0,
                 3=>0,
                 4=>0,
                 5=>0,
                 6=>0,
                 7=>0,
                 8=>0,
                 9=>0 }

  fix_stat = { 2 => { 'len'=>4, 'val'=>[2,4,8,6] },
               3 => { 'len'=>4, 'val'=>[3,9,7,1] },
               4 => { 'len'=>2, 'val'=>[4,6] },
               5 => { 'len'=>1, 'val'=>[5] },
               6 => { 'len'=>1, 'val'=>[6] },
               7 => { 'len'=>4, 'val'=>[7,9,3,1] },
               8 => { 'len'=>4, 'val'=>[8,4,2,6] },
               9 => { 'len'=>2, 'val'=>[9,1] }, }

  add_to_all = exp / fix_stat[digit_base]['len']
  add_to_some = exp % fix_stat[digit_base]['len']

  (0..add_to_some-1).each do |index|
    key = fix_stat[digit_base]['val'][index]
    statistics[key] += 1
  end

  fix_stat[digit_base]['val'].each do |key|
    statistics[key] += add_to_all
  end

  mapa = []
  statistics.each { |key, value| mapa << "#{key}: #{value}" }

  puts mapa.join(', ')
end