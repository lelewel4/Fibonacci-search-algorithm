import random

max_value_of_number = 64
how_much_numbers = 25

numbers = random.sample(range(max_value_of_number), how_much_numbers)
numbers.sort()

print(numbers)
