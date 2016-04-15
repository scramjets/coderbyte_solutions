# Have the function PrimeTime(num) take the num parameter being passed and return the string true if the parameter is a prime number, otherwise return the string false. The range will be between 1 and 2^16.

def PrimeTime(num)
  (2...num).each {|i| return false if num % i == 0}
  true
end

# Have the function RunLength(str) take the str parameter being passed and return a compressed version of the string using the Run-length encoding algorithm. This algorithm works by taking the occurrence of each repeating character and outputting that number along with a single character of the repeating sequence. For example: "wwwggopp" would return 3w2g1o2p. The string will not contain any numbers, punctuation, or symbols.

def RunLength(str)
  splt = str.split("")
  result = ""
  counter = 1

  (0...splt.length).each do |i|
    if splt[i] == splt[i+1]
      counter += 1
    else
      result << counter.to_s
      result << splt[i]
      counter = 1
    end
  end

  result
end


# Have the function PrimeMover(num) return the numth prime number. The range will be from 1 to 10^4. For example: if num is 16 the output should be 53 as 53 is the 16th prime number.

def is_prime?(x)
  (2...num).each {|i| return false if num % i == 0}
  true
end


def PrimeMover(num)
  primes = []
  counter = 2

  while primes.length < num
    if is_prime?(counter)
      primes << counter
    end
    counter += 1
  end

  primes[-1]
end

# Have the function PalindromeTwo(str) take the str parameter being passed and return the string true if the parameter is a palindrome, (the string is the same forward as it is backward) otherwise return the string false. The parameter entered may have punctuation and symbols but they should not affect whether the string is in fact a palindrome. For example: "Anne, I vote more cars race Rome-to-Vienna" should return true.

def PalindromeTwo(str)
  str.downcase.scan(/\w+/).join == str.downcase.scan(/\w+/).join.reverse
end

# Have the function StringScramble(str1,str2) take both parameters being passed and return the string true if a portion of str1 characters can be rearranged to match str2, otherwise return the string false. For example: if str1 is "rkqodlw" and str2 is "world" the output should return true. Punctuation and symbols will not be entered with the parameters.

def StringScramble(str1,str2)
  str2.each_char do |i|
    if str1.count(i) < str2.count(i)
      return false
    end
  end

  true
end

# Have the function ArithGeoII(arr) take the array of numbers stored in arr and return the string "Arithmetic" if the sequence follows an arithmetic pattern or return "Geometric" if it follows a geometric pattern. If the sequence doesn't follow either pattern return -1. An arithmetic sequence is one where the difference between each of the numbers is consistent, where as in a geometric sequence, each term after the first is multiplied by some constant or common ratio. Arithmetic example: [2, 4, 6, 8] and Geometric example: [2, 6, 18, 54]. Negative numbers may be entered as parameters, 0 will not be entered, and no array will contain all the same elements.

def ArithGeoII(arr)
  return "Arithmetic" if (1...arr.length).map {|i| arr[i] - arr[i - 1]}.uniq.size == 1
  return "Geometric" if (1...arr.length).map {|i| arr[i] / arr[i - 1]}.uniq.size == 1
  -1
end

# Have the function ArrayAddition(arr) take the array of numbers stored in arr and return the string true if any combination of numbers in the array can be added up to equal the largest number in the array, otherwise return the string false. For example: if arr contains [4, 6, 23, 10, 1, 3] the output should return true because 4 + 6 + 10 + 3 = 23. The array will not be empty, will not contain all the same elements, and may contain negative numbers.

def ArrayAddition(arr)
  largest = arr.sort!.pop

  (2..arr.length).each {|i| arr.combination(i).to_a.each {|x| return true if x.inject(:+) == largest}}

  false
end

# Have the function BinaryConverter(str) return the decimal form of the binary value. For example: if 101 is passed return 5, or if 1000 is passed return 8.

def BinaryConverter(str)
  count = str.length - 1

  result = 0

  digits = str.split("").map{|i| i.to_i}

  digits.each do |num|
    if num == 1
      result += 2 ** count
    end
    count -= 1
  end

  result
end

# Have the function LetterCount(str) take the str parameter being passed and return the first word with the greatest number of repeated letters. For example: "Today, is the greatest day ever!" should return greatest because it has 2 e's (and 2 t's) and it comes before ever which also has 2 e's. If there are no words with repeating letters return -1. Words will be separated by spaces.

def LetterCount(str)
  greatest = ""

  str.downcase.split(" ").each do |i|
    if (i.chars.length - i.chars.uniq.length) > (greatest.chars.length - greatest.chars.uniq.length)
      greatest = i
    end
  end

  greatest.length > 0 ? greatest : -1
end

# Have the function SimpleMode(arr) take the array of numbers stored in arr and return the number that appears most frequently (the mode). For example: if arr contains [10, 4, 5, 2, 4] the output should be 4. If there is more than one mode return the one that appeared in the array first (ie. [5, 10, 10, 6, 5] should return 5 because it appeared first). If there is no mode return -1. The array will not be empty.

def SimpleMode(arr)
  frequent = 0
  count = 0

  arr.each do |i|
    if arr.count(i) > count
      count = arr.count(i)
      frequent = i
    end
  end

  count > 1 ? frequent : -1
end

# Have the function CaesarCipher(str,num) take the str parameter and perform a Caesar Cipher shift on it using the num parameter as the shifting number. A Caesar Cipher works by shifting each letter in the string N places down in the alphabet (in this case N will be num). Punctuation, spaces, and capitalization should remain intact. For example if the string is "Caesar Cipher" and num is 2 the output should be "Ecguct Ekrjgt".

def CaesarCipher(str,num)
  result = str.split("")
  idx = 0

  while idx < result.length
    num.times do
      if result[idx] == "Z"
        result[idx] = "A"
      elsif result[idx] == "z"
        result[idx] = "a"
      elsif result[idx] =~ /[a-yA-Y]/
        result[idx] = result[idx].next
      end
    end
    idx += 1
  end

  result.join
end

# Have the function FormattedDivision(num1,num2) take both parameters being passed, divide num1 by num2, and return the result as a string with properly formatted commas and 4 significant digits after the decimal place. For example: if num1 is 123456789 and num2 is 10000 the output should be "12,345.6789". The output must contain a number in the one's place even if it is a zero.

def FormattedDivision(num1,num2)
  float = sprintf("%.4f", num1/num2.to_f)

  split = float.to_s.split(".")

  first = split[0].reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

  second = split[1]

  first + "." + second
end

# Have the function Consecutive(arr) take the array of integers stored in arr and return the minimum number of integers needed to make the contents of arr consecutive from the lowest number to the highest number. For example: If arr contains [4, 8, 6] then the output should be 2 because two numbers need to be added to the array (5 and 7) to make it a consecutive array of numbers from 4 to 8. Negative numbers may be entered as parameters and no array will have less than 2 elements.

def Consecutive(arr)
  complete_range = ((arr.sort[0])..(arr.sort[-1])).to_a
  complete_range.length - arr.length
end

# Have the function CountingMinutes(str) take the str parameter being passed which will be two times (each properly formatted with a colon and am or pm) separated by a hyphen and return the total number of minutes between the two times. The time will be in a 12 hour clock format. For example: if str is 9:00am-10:00am then the output should be 60. If str is 1:00pm-11:00am the output should be 1320.

def CountingMinutes(str)
  parts = str.scan(/\A(\d+):(\d\d)(..)-(\d+):(\d\d)(..)\Z/).flatten

  first_min = (parts[0].to_i * 60) + (parts[1].to_i) + (parts[2] == "pm" ? 720 : 0)
  second_min = (parts[3].to_i * 60) + (parts[4].to_i) + (parts[5] == "pm" ? 720 : 0)

  second_min += 1440 if first_min > second_min

  second_min - first_min
end

# Have the function PermutationStep(num) take the num parameter being passed and return the next number greater than num using the same digits. For example: if num is 123 return 132, if it's 12453 return 12534. If a number has no greater permutations, return -1 (ie. 999).

def PermutationStep(num)
  combos = num.to_s.split("").map{|i|i.to_i}.permutation(num.to_s.size).to_a

  greater = []

  combos.each do |i|
    if i.join.to_i > num
      greater << i.join.to_i
    end
  end

  greater.sort[0] == nil ? -1 : greater.sort[0]
end

# Have the function PrimeChecker(num) take num and return 1 if any arrangement of num comes out to be a prime number, otherwise return 0. For example: if num is 910, the output should be 1 because 910 can be arranged into 109 or 019, both of which are primes.

def is_prime?(num)
  (2...num).each {|i| return false if num % i == 0}
  true
end

def PrimeChecker(num)
  bank = num.to_s.split("").map{|i|i.to_i}.permutation(num.to_s.length).to_a

  bank.each do |i|
    if is_prime?(i.join.to_i)
      return 1
    end
  end
  0
end

# Have the function DashInsertII(str) insert dashes ('-') between each two odd numbers and insert asterisks ('*') between each two even numbers in str. For example: if str is 4546793 the output should be 454*67-9-3. Don't count zero as an odd or even number.

def DashInsertII(num)
  first = num.to_s.gsub(/([13579])(?=[13579])/,"\\1-")
  first.gsub(/([2468])(?=[2468])/,"\\1*")
end

# Have the function SwapII(str) take the str parameter and swap the case of each character. Then, if a letter is between two numbers (without separation), switch the places of the two numbers. For example: if str is "6Hello4 -8World, 7 yes3" the output should be 4hELLO6 -8wORLD, 7 YES3.

def SwapII(str)
  str.swapcase!
  words = str.split(" ")
  results = []

  words.each do |i|
    if i =~ /(\d)([a-zA-Z]+)(\d)/
      results << i.gsub(/(\d+)([a-zA-Z]+)(\d+)/,'\3\2\1')
    else
      results << i
    end
  end
  results.join(" ")
end

# Have the function TripleDouble(num1,num2) take both parameters being passed, and return 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2. For example: if num1 equals 451999277 and num2 equals 41177722899, then return 1 because in the first parameter you have the straight triple 999 and you have a straight double, 99, of the same number in the second parameter. If this isn't the case, return 0.

def TripleDouble(num1,num2)
  triple = num1.to_s.scan(/(\d)\1\1/)
  double = num2.to_s.scan(/(\d)\1/)
  (triple & double).flatten.length == 1 ? 1 : 0
end

# Have the function BracketMatcher(str) take the str parameter being passed and return 1 if the brackets are correctly matched and each one is accounted for. Otherwise return 0. For example: if str is "(hello (world))", then the output should be 1, but if str is "((hello (world))" the the output should be 0 because the brackets do not correctly match up. Only "(" and ")" will be used as brackets. If str contains no brackets return 1.

def BracketMatcher(str)
  pairing = 0

  str.split("").each do |i|
    if i == "("
      pairing += 1
    elsif i == ")"
      pairing -= 1
    end

    if pairing < 0
      return 0
    end
  end

  pairing == 0 ? 1 : 0
end

# Have the function StringReduction(str) take the str parameter being passed and return the smallest number you can get through the following reduction method. The method is: Only the letters a, b, and c will be given in str and you must take two different adjacent characters and replace it with the third. For example "ac" can be replaced with "b" but "aa" cannot be replaced with anything. This method is done repeatedly until the string cannot be further reduced, and the length of the resulting string is to be outputted. For example: if str is "cab", "ca" can be reduced to "b" and you get "bb" (you can also reduce it to "cc"). The reduction is done so the output should be 2. If str is "bcab", "bc" reduces to "a", so you have "aab", then "ab" reduces to "c", and the final string "ac" is reduced to "b" so the output should be 1.

def StringReduction(str)
  while str.split("").uniq.length != 1
    str.sub! "ab", "c"
    str.sub! "ba", "c"
    str.sub! "ac", "b"
    str.sub! "ca", "b"
    str.sub! "bc", "a"
    str.sub! "cb", "a"
  end

  str.length
end

# Have the function ThreeFiveMultiples(num) return the sum of all the multiples of 3 and 5 that are below num. For example: if num is 10, the multiples of 3 and 5 that are below 10 are 3, 5, 6, and 9, and adding them up you get 23, so your program should return 23. The integer being passed will be between 1 and 100.

def ThreeFiveMultiples(num)
  sum = 0

  (0...num).each do |i|
    if i % 3 == 0 || i % 5 == 0
      sum += i
    end
  end

  sum
end

# Have the function FibonacciChecker(num) return the string yes if the number given is part of the Fibonacci sequence. This sequence is defined by: Fn = Fn-1 + Fn-2, which means to find Fn you add the previous two numbers up. The first two numbers are 0 and 1, then comes 1, 2, 3, 5 etc. If num is not in the Fibonacci sequence, return the string no.

def FibonacciChecker(num)
  fib = [0, 1]

  while fib[-1] < num
    fib << fib[-1] + fib[-2]
  end

  fib[-1] == num ? "yes" : "no"
end

# Have the function MultipleBrackets(str) take the str parameter being passed and return 1 #ofBrackets if the brackets are correctly matched and each one is accounted for. Otherwise return 0. For example: if str is "(hello [world])(!)", then the output should be 1 3 because all the brackets are matched and there are 3 pairs of brackets, but if str is "((hello [world])" the the output should be 0 because the brackets do not correctly match up. Only "(", ")", "[", and "]" will be used as brackets. If str contains no brackets return 1.

def MultipleBrackets(str)
  round = 0
  square = 0
  count = 0

  str.each_char do |i|
    if i == "("
      round += 1
    elsif i == ")"
      round -= 1
      count += 1
    end

    if i == "["
      square += 1
    elsif i == "]"
      square -= 1
      count += 1
    end

    if round < 0 || square < 0
      return 0
    end
  end

  if round == 0 && square == 0 && count == 0
    return 1
  elsif round == 0 && square == 0
    return "1 #{count}"
  else
    return 0
  end
end

# Have the function MostFreeTime(strArr) read the strArr parameter being passed which will represent a full day and will be filled with events that span from time X to time Y in the day. The format of each event will be hh:mmAM/PM-hh:mmAM/PM. For example, strArr may be ["10:00AM-12:30PM","02:00PM-02:45PM","09:10AM-09:50AM"]. Your program will have to output the longest amount of free time available between the start of your first event and the end of your last event in the format: hh:mm. The start event should be the earliest event in the day and the latest event should be the latest event in the day. The output for the previous input would therefore be 01:30 (with the earliest event in the day starting at 09:10AM and the latest event ending at 02:45PM). The input will contain at least 3 events and the events may be out of order.

def TimeConvert(num)
  hours = num/60
  minutes = num % 60

  if minutes < 10 && hours < 10
  	return "0#{hours}:0#{minutes}"
  elsif hours < 10
    return "0#{hours}:#{minutes}"
  elsif minutes < 10
    return "#{hours}:0#{minutes}"
  else
  	return "#{hours}:#{minutes}"
  end
end


def MostFreeTime(strArr)
  holder = []

  strArr.map! do |i|
    i.scan(/\A(\d+):(\d\d)(..)-(\d+):(\d\d)(..)\Z/).flatten
  end

  strArr.map do |i|
    holder << (i[0].to_i * 60) + (i[1].to_i) + (i[2] == "PM" && i[0].to_i != 12 ? 720 : 0)
    holder << (i[3].to_i * 60) + (i[4].to_i) + (i[5] == "PM" && i[3].to_i != 12 ? 720 : 0)
  end

  holder.sort!

  difference = 0
  idx = 2

  while idx + 1 <= holder.length
    if holder[idx] - holder[idx - 1] > difference
      difference = holder[idx] - holder[idx - 1]
    end
    idx += 2
  end

  TimeConvert(difference)
end

# Have the function OverlappingRectangles(strArr) read the strArr parameter being passed which will represent two rectangles on a Cartesian coordinate plane and will contain 8 coordinates with the first 4 making up rectangle 1 and the last 4 making up rectange 2. It will be in the following format: ["(0,0),(2,2),(2,0),(0,2),(1,0),(1,2),(6,0),(6,2)"] Your program should determine the area of the space where the two rectangles overlap, and then output the number of times this overlapping region can fit into the first rectangle. For the above example, the overlapping region makes up a rectangle of area 2, and the first rectangle (the first 4 coordinates) makes up a rectangle of area 4, so your program should output 2. The coordinates will all be integers. If there's no overlap between the two rectangles return 0.

def OverlappingRectangles(strArr)
  pool = strArr[0].scan(/(-?[0-9]+)/).flatten.map{|i|i.to_i}

  rec1_l = [pool[1], pool[3], pool[5], pool[7]].sort
  rec1_w = [pool[0], pool[2], pool[4], pool[6]].sort
  rec2_l = [pool[9], pool[11], pool[13], pool[15]].sort
  rec2_w = [pool[8], pool[10], pool[12], pool[14]].sort

  rec1_long = ((rec1_l[0])..(rec1_l[-1])).to_a
  rec1_wide = ((rec1_w[0])..(rec1_w[-1])).to_a
  rec2_long = ((rec2_l[0])..(rec2_l[-1])).to_a
  rec2_wide = ((rec2_w[0])..(rec2_w[-1])).to_a

  mix_long = rec1_long & rec2_long
  mix_wide = rec2_wide & rec1_wide

  fit = (rec1_wide.length - 1) / (mix_wide.length - 1)

  if mix_long.length < 2 || mix_wide.length < 2
    return 0
  elsif (rec1_long.length - 1) > 1
    fit * ((rec1_long.length - 1) / (mix_long.length - 1))
  else
  	fit
  end
end

# Have the function DistinctList(arr) take the array of numbers stored in arr and determine the total number of duplicate entries. For example if the input is [1, 2, 2, 2, 3] then your program should output 2 because there are two duplicates of one of the elements.

def DistinctList(arr)
  arr.length - arr.uniq.length
end

# Have the function LookSaySequence(num) take the num parameter being passed and return the next number in the sequence according to the following rule: to generate the next number in a sequence read off the digits of the given number, counting the number of digits in groups of the same digit. For example, the sequence beginning with 1 would be: 1, 11, 21, 1211, ... The 11 comes from there being "one 1" before it and the 21 comes from there being "two 1's" before it. So your program should return the next number in the sequence given num.

def LookSaySequence(num)
  result = []

  clean = num.to_s.scan(/((\d)\2*)/).map(&:first)

  clean.each do |i|
    result << i.length
    result << i[0].to_i
  end

  result.join
end

# Have the function NumberEncoding(str) take the str parameter and encode the message according to the following rule: encode every letter into its corresponding numbered position in the alphabet. Symbols and spaces will also be used in the input. For example: if str is "af5c a#!" then your program should return 1653 1#!.

def NumberEncoding(str)
  alphabet = ("a".."z").to_a

  result = []

  str.each_char do |i|
    if alphabet.include?(i)
      i = (alphabet.index(i) + 1)
      result << i
    else
      result << i
    end
  end

  result.join
end

# Have the function StockPicker(arr) take the array of numbers stored in arr which will contain integers that represent the amount in dollars that a single stock is worth, and return the maximum profit that could have been made by buying stock on day x and selling stock on day y where y > x. For example: if arr is [44, 30, 24, 32, 35, 30, 40, 38, 15] then your program should return 16 because at index 2 the stock was worth $24 and at index 6 the stock was then worth $40, so if you bought the stock at 24 and sold it at 40, you would have made a profit of $16, which is the maximum profit that could have been made with this list of stock prices.

# If there is not profit that could have been made with the stock prices, then your program should return -1. For example: arr is [10, 9, 8, 2] then your program should return -1.

def StockPicker(arr)
  profit = 0

  arr.each do |i|
    arr.each do |x|
      if (arr.index(i) < arr.index(x)) && (x - i > profit)
        profit = x - i
      end
    end
  end

  profit > 0 ? profit : -1
end
