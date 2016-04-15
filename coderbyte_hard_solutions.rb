# Have the function ArrayRotation(arr) take the arr parameter being passed which will be an array of non-negative integers and circularly rotate the array starting from the Nth element where N is equal to the first integer in the array. For example: if arr is [2, 3, 4, 1, 6, 10] then your program should rotate the array starting from the 2nd position because the first element in the array is 2. The final array will therefore be

# [4, 1, 6, 10, 2, 3], and your program should return the new array as a string, so for this example your program would return 4161023. The first element in the array will always be an integer greater than or equal to 0 and less than the size of the array.

def ArrayRotation(arr)
  result = []
  result << arr.slice!(arr[0], arr.length - 1)
  result << arr
  result.flatten.join
end

# Have the function ApproachingFibonacci(arr) take the arr parameter being passed which will be an array of integers and determine the smallest positive integer (including zero) that can be added to the array to make the sum of all of the numbers in the array add up to the next closest Fibonacci number. For example: if arr is [15, 1, 3], then your program should output 2 because if you add up 15 + 1 + 3 + 2 you get 21 which is the closest Fibonacci number.

def ApproachingFibonacci(arr)
  order = arr.inject(:+)
  fib = [0, 1]

  while fib[-1] < order
    fib << fib[-1] + fib[-2]
  end

  fib[-1] - order
end

# Have the function SquareFigures(num) read num which will be an integer. Your program should return the smallest integer that when squared has a length equal to num. For example: if num is 6 then your program should output 317 because 317^2 = 100489 while 316^2 = 99856 which does not have a length of six.

def SquareFigures(num)
  product = 0
  counter = 0

  while product.to_s.size < num
    product = counter ** 2
    if product.to_s.size == num
      return counter
    end
    counter += 1
  end
  
  counter
end
