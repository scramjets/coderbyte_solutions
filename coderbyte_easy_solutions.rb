# Have the function FirstReverse(str) take the str parameter being passed and return the string in reversed order.

def FirstReverse(str)
  str.reverse
end

# Have the function LetterChanges(str) take the str parameter being passed and modify it using the following algorithm. Replace every letter in the string with the letter following it in the alphabet (ie. c becomes d, z becomes a). Then capitalize every vowel in this new string (a, e, i, o, u) and finally return this modified string.

def LetterChanges(str)
  filtered = ""
  result = ""

  str.each_char do |i|
    if /[a-yA-Y]/ =~ i
      filtered << i.next
    elsif i == "z"
      filtered << "a"
    elsif i == "Z"
      filtered << "A"
    else
      filtered << i
    end
  end

  filtered.each_char do |i|
    if /[aeiou]/ =~ i
      result << i.upcase
    else
      result << i
    end
  end

  result
end

# Have the function SimpleAdding(num) add up all the numbers from 1 to num. For the test cases, the parameter num will be any number from 1 to 1000.

def SimpleAdding(num)
  (1..num).inject(:+)
end

# Have the function LetterCapitalize(str) take the str parameter being passed and capitalize the first letter of each word. Words will be separated by only one space.

def LetterCapitalize(str)
  str.split(" ").map(&:capitalize).join(" ")
end

# Have the function SimpleSymbols(str) take the str parameter being passed and determine if it is an acceptable sequence by either returning the string true or false. The str parameter will be composed of + and = symbols with several letters between them (ie. ++d+===+c++==a) and for the string to be true each letter must be surrounded by a + symbol. So the string to the left would be false. The string will not be empty and will have at least one letter.

def SimpleSymbols(str)
  things = str.split("")

  things.each_with_index do |unit, idx|
    if unit =~ /[a-z]/
      return false if things[idx - 1] != "+" || things[idx + 1] != "+"
    end
  end

  true
end

# Have the function CheckNums(num1,num2) take both parameters being passed and return the string true if num2 is greater than num1, otherwise return the string false. If the parameter values are equal to each other then return the string -1.

def CheckNums(num1,num2)
  if num2 > num1
    true
  elsif num2 < num1
    false
  else
    -1
  end
end

# Have the function TimeConvert(num) take the num parameter being passed and return the number of hours and minutes the parameter converts to (ie. if num = 63 then the output should be 1:3). Separate the number of hours and minutes with a colon.

def TimeConvert(num)
  hours = num/60
  minutes = num % 60
  "#{hours}:#{minutes}"
end

# Have the function AlphabetSoup(str) take the str string parameter being passed and return the string with the letters in alphabetical order (ie. hello becomes ehllo). Assume numbers and punctuation symbols will not be included in the string.

def AlphabetSoup(str)
  str.split("").sort.join
end

# Have the function ABCheck(str) take the str parameter being passed and return the string true if the characters a and b are separated by exactly 3 places anywhere in the string at least once (ie. "lane borrowed" would result in true because there is exactly three characters between a and b). Otherwise return the string false.

def ABCheck(str)
  str =~ /a...b/ || str =~ /b...a/ ? true : false
end

# Have the function VowelCount(str) take the str string parameter being passed and return the number of vowels the string contains (ie. "All cows eat grass" would return 5). Do not count y as a vowel for this challenge.

def VowelCount(str)
  str.scan(/[aeiouAEIOU]/).count
end

# Have the function WordCount(str) take the str string parameter being passed and return the number of words the string contains (ie. "Never eat shredded wheat" would return 4). Words will be separated by single spaces.

def WordCount(str)
  str.split(" ").count
end

# Have the function ExOh(str) take the str parameter being passed and return the string true if there is an equal number of x's and o's, otherwise return the string false. Only these two letters will be entered in the string, no punctuation or numbers. For example: if str is "xooxxxxooxo" then the output should return false because there are 6 x's and 5 o's.

def ExOh(str)
  str.scan("x").count == str.scan("o").count ? true : false
end

# Have the function Palindrome(str) take the str parameter being passed and return the string true if the parameter is a palindrome, (the string is the same forward as it is backward) otherwise return the string false. For example: "racecar" is also "racecar" backwards. Punctuation and numbers will not be part of the string.

def Palindrome(str)
  str.delete(" ") == str.delete(" ").reverse
end

# Have the function ArithGeo(arr) take the array of numbers stored in arr and return the string "Arithmetic" if the sequence follows an arithmetic pattern or return "Geometric" if it follows a geometric pattern. If the sequence doesn't follow either pattern return -1. An arithmetic sequence is one where the difference between each of the numbers is consistent, where as in a geometric sequence, each term after the first is multiplied by some constant or common ratio. Arithmetic example: [2, 4, 6, 8] and Geometric example: [2, 6, 18, 54]. Negative numbers may be entered as parameters, 0 will not be entered, and no array will contain all the same elements.

def ArithGeo(arr)
  return "Arithmetic" if (1..arr.length - 1).map {|i| arr[i] - arr[i - 1]}.uniq.size == 1
  return "Geometric" if (1..arr.length - 1).map {|i| arr[i] / arr[i - 1]}.uniq.size == 1
  -1
end

# Have the function ArrayAdditionI(arr) take the array of numbers stored in arr and return the string true if any combination of numbers in the array can be added up to equal the largest number in the array, otherwise return the string false. For example: if arr contains [4, 6, 23, 10, 1, 3] the output should return true because 4 + 6 + 10 + 3 = 23. The array will not be empty, will not contain all the same elements, and may contain negative numbers.

def ArrayAdditionI(arr)
  largest = arr.sort!.pop

  (2..arr.length).each {|i| arr.combination(i).to_a.each {|x| return true if x.inject(:+) == largest}}

  false
end

# Have the function LetterCountI(str) take the str parameter being passed and return the first word with the greatest number of repeated letters. For example: "Today, is the greatest day ever!" should return greatest because it has 2 e's (and 2 t's) and it comes before ever which also has 2 e's. If there are no words with repeating letters return -1. Words will be separated by spaces.

def LetterCountI(str)
  greatest = ""

  str.downcase.split(" ").each do |i|
    if (i.chars.length - i.chars.uniq.length) > (greatest.chars.length - greatest.chars.uniq.length)
      greatest = i
    end
  end

  greatest.length > 0 ? greatest : -1
end

# Have the function DivisionStringified(num1,num2) take both parameters being passed, divide num1 by num2, and return the result as a string with properly formatted commas. If an answer is only 3 digits long, return the number with no commas (ie. 2 / 3 should output "1"). For example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".

def DivisionStringified(num1,num2)
  quotient = num1.to_f / num2.to_f

  "#{quotient.round.to_s.reverse.gsub(/(...)(?=.)/, '\1,').reverse}"
end

# Have the function CountingMinutesI(str) take the str parameter being passed which will be two times (each properly formatted with a colon and am or pm) separated by a hyphen and return the total number of minutes between the two times. The time will be in a 12 hour clock format. For example: if str is 9:00am-10:00am then the output should be 60. If str is 1:00pm-11:00am the output should be 1320.

def CountingMinutesI(str)
  parts = str.scan(/(\d+):(\d\d)(..)-(\d+):(\d\d)(..)/).flatten

  first_min = (parts[0].to_i * 60) + (parts[1].to_i) + (parts[2] == "pm" ? 720 : 0)
  second_min = (parts[3].to_i * 60) + (parts[4].to_i) + (parts[5] == "pm" ? 720 : 0)

  second_min += 1440 if first_min > second_min

  second_min - first_min
end

# Have the function MeanMode(arr) take the array of numbers stored in arr and return 1 if the mode equals the mean, 0 if they don't equal each other (ie. [5, 3, 3, 3, 1] should return 1 because the mode (3) equals the mean (3)). The array will not be empty, will only contain positive integers, and will not contain more than one mode.

def MeanMode(arr)
  arr.select {|i| arr.count(i) > 1}[0] == arr.inject(:+) / arr.length ? 1 : 0
end

# Have the function DashInsert(str) insert dashes ('-') between each two odd numbers in str. For example: if str is 454793 the output should be 4547-9-3. Don't count zero as an odd number.

def DashInsert(str)
  str.to_s.gsub(/([13579])(?=[13579])/, '\1-')
end

# Have the function SwapCase(str) take the str parameter and swap the case of each character. For example: if str is "Hello World" the output should be hELLO wORLD. Let numbers and symbols stay the way they are.

def SwapCase(str)
  str.swapcase
end

# Have the function NumberSearch(str) take the str parameter, search for all the numbers in the string, add them together, then return that final number. For example: if str is "88Hello 3World!" the output should be 91. You will have to differentiate between single digit numbers and multiple digit numbers like in the example above. So "55Hello" and "5Hello 5" should return two different answers. Each string will contain at least one letter or symbol.

def NumberAddition(str)
  str.scan(/\d+/).map {|i| i.to_i}.length == 0 ? 0 : str.scan(/\d+/).map {|i|i.to_i}.inject(:+)
end

# Have the function ThirdGreatest(strArr) take the array of strings stored in strArr and return the third largest word within in. So for example: if strArr is ["hello", "world", "before", "all"] your output should be world because "before" is 6 letters long, and "hello" and "world" are both 5, but the output should be world because it appeared as the last 5 letter word in the array. If strArr was ["hello", "world", "after", "all"] the output should be after because the first three words are all 5 letters long, so return the last one. The array will have at least three strings and each string will only contain letters.

def ThirdGreatest(strArr)
  top = ["", "", ""]

  strArr.each do |i|
    if i.length > top[0].length
      top.insert(0, i)
    elsif i.length > top[1].length
      top.insert(1, i)
    elsif i.length > top[2].length
      top.insert(2, i)
    end
  end

  top[2]
end

# Have the function PowersofTwo(num) take the num parameter being passed which will be an integer and return the string true if it's a power of two. If it's not return the string false. For example if the input is 16 then your program should return the string true but if the input is 22 then the output should be the string false.

def PowersofTwo(num)
  idx = 0

  while 2 ** idx <= num
    return true if 2 ** idx == num
    idx += 1
  end

  false
end

# Have the function AdditivePersistence(num) take the num parameter being passed which will always be a positive integer and return its additive persistence which is the number of times you must add the digits in num until you reach a single digit. For example: if num is 2718 then your program should return 2 because 2 + 7 + 1 + 8 = 18 and 1 + 8 = 9 and you stop at 9.

def AdditivePersistence(num)
  count = 0

  while num > 9
    num = num.to_s.split("").map{|i| i.to_i}.inject(:+)
    count += 1
  end

  count
end

# Have the function MultiplicativePersistence(num) take the num parameter being passed which will always be a positive integer and return its multiplicative persistence which is the number of times you must multiply the digits in num until you reach a single digit. For example: if num is 39 then your program should return 3 because 3 * 9 = 27 then 2 * 7 = 14 and finally 1 * 4 = 4 and you stop at 4.

def MultiplicativePersistence(num)
  count = 0

  while num > 9
    num = num.to_s.split("").map{|i| i.to_i}.inject(:*)
    count += 1
  end

  count
end

# Have the function OffLineMinimum(strArr) take the strArr parameter being passed which will be an array of integers ranging from 1...n and the letter "E" and return the correct subset based on the following rules. The input will be in the following format: ["I","I","E","I",...,"E",...,"I"] where the I's stand for integers and the E means take out the smallest integer currently in the whole set. When finished, your program should return that new set with integers separated by commas. For example: if strArr is ["5","4","6","E","1","7","E","E","3","2"] then your program should return 4,1,5.

def OffLineMinimum(strArr)
  batch = []
  result = []

  strArr.each do |i|
    if i == "E"
      batch.sort!
      result << batch.shift
    else
      batch << i.to_i
    end
  end

  result.join(",")
end

# Have the function ChangingSequence(arr) take the array of numbers stored in arr and return the index at which the numbers stop increasing and begin decreasing or stop decreasing and begin increasing. For example: if arr is [1, 2, 4, 6, 4, 3, 1] then your program should return 3 because 6 is the last point in the array where the numbers were increasing and the next number begins a decreasing sequence. The array will contain at least 3 numbers and it may contains only a single sequence, increasing or decreasing. If there is only a single sequence in the array, then your program should return -1. Indexing should begin with 0.

def ChangingSequence(arr)
  idx = 2

  while idx < arr.length
    if arr[1] > arr[0] && arr[idx] < arr[idx-1]
      return idx - 1
    elsif arr[1] < arr[0] && arr[idx] > arr[idx-1]
      return idx - 1
    end
    idx += 1
  end

  -1
end

# Have the function OverlappingRanges(arr) take the array of numbers stored in arr which will contain 5 positive integers, the first two representing a range of numbers (a to b), the next 2 also representing another range of integers (c to d), and a final 5th element (x) which will also be a positive integer, and return the string true if both sets of ranges overlap by at least x numbers. For example: if arr is [4, 10, 2, 6, 3] then your program should return the string true. The first range of numbers are 4, 5, 6, 7, 8, 9, 10 and the second range of numbers are 2, 3, 4, 5, 6. The last element in the array is 3, and there are 3 numbers that overlap between both ranges: 4, 5, and 6. If both ranges do not overlap by at least x numbers, then your program should return the string false.

def OverlappingRanges(arr)
  ((arr[0]..arr[1]).to_a & (arr[2]..arr[3]).to_a).size >= arr[4]
end

# Have the function Superincreasing(arr) take the array of numbers stored in arr and determine if the array forms a superincreasing sequence where each element in the array is greater than the sum of all previous elements. The array will only consist of positive integers. For example: if arr is [1, 3, 6, 13, 54] then your program should return the string "true" because it forms a superincreasing sequence. If a superincreasing sequence isn't formed, then your program should return the string "false"

def Superincreasing(arr)
  total = 0
  arr.each do |i|
    if i <= total
      return false
    end
    total += i
  end

  true
end

# Have the function HammingDistance(strArr) take the array of strings stored in strArr, which will only contain two strings of equal length and return the Hamming distance between them. The Hamming distance is the number of positions where the corresponding characters are different. For example: if strArr is ["coder", "codec"] then your program should return 1. The string will always be of equal length and will only contain lowercase characters from the alphabet and numbers.

def HammingDistance(strArr)
  hamming = 0

  (0...strArr[0].length).each do |i|
    if strArr[0][i] != strArr[1][i]
      hamming += 1
    end
  end

  hamming
end

# Have the function RectangleArea(strArr) take the array of strings stored in strArr, which will only contain 4 elements and be in the form (x y) where x and y are both integers, and return the area of the rectangle formed by the 4 points on a Cartesian grid. The 4 elements will be in arbitrary order. For example: if strArr is ["(0 0)", "(3 0)", "(0 2)", "(3 2)"] then your program should return 6 because the width of the rectangle is 3 and the height is 2 and the area of a rectangle is equal to the width * height.

def RectangleArea(strArr)
  pool = strArr.join.scan(/(-?[0-9]+)/).flatten.map{|i|i.to_i}

  rec_l = [pool[1], pool[3], pool[5], pool[7]].sort
  rec_w = [pool[0], pool[2], pool[4], pool[6]].sort

  length = (rec_l[-1] - rec_l[0]).abs
  width = (rec_w[-1] - rec_w[0]).abs

  length * width
end

# Have the function BitwiseOne(strArr) take the array of strings stored in strArr, which will only contain two strings of equal length that represent binary numbers, and return a final binary string that performed the bitwise OR operation on both strings. A bitwise OR operation places a 0 in the new string where there are zeroes in both binary strings, otherwise it places a 1 in that spot. For example: if strArr is ["1001", "0100"] then your program should return the string "1101"

def BitwiseOne(strArr)
  result = ""
  first = strArr[0]
  second = strArr[1]
  idx = 0

  while idx < strArr[0].length
    if first[idx] == "0" && second[idx] == "0"
      result << "0"
    else
      result << "1"
    end
    idx += 1
  end

  result
end
