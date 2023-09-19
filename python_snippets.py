"""
 Mutability Example: Bad Default arguments
"""


def append_to_list(value, my_list=[]):
    my_list.append(value)
    return my_list


result1 = append_to_list(1)
result2 = append_to_list(2)

print(result1)  # Output: [1, 2]
print(result2)  # Output: [1, 2]


# Using mutable list (bad practice)
def modify_list_bad(numbers):
    numbers.append(10)
    return numbers


original_list = [1, 2, 3]
modified_list = modify_list_bad(original_list)

print(original_list)  # Output: [1, 2, 3, 10]
print(modified_list)  # Output: [1, 2, 3, 10]


# Using immutable tuple (good practice)
def modify_tuple_good(numbers):
    numbers = numbers + (10,)
    return numbers


original_tuple = (1, 2, 3)
modified_tuple = modify_tuple_good(original_tuple)

print(original_tuple)  # Output: (1, 2, 3)
print(modified_tuple)  # Output: (1, 2, 3, 10)

"""
Pattern Matching examples
"""


class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age


def pattern_matching_example(value):
    match value:
        case 1:
            return "One"
        case 2:
            return "Two"
        case 3:
            return "Three"
        case _:
            return "Other"


# Write live
def advanced_pattern_matching_example(obj):
    match obj:
        case 0:
            return "Zero"
        case [x, y]:
            return f"List with elements {x} and {y}"
        case {"key": value}:
            return f"Dictionary with key 'key' and value {value}"
        case Person(name="Alice", age=a):
            return f"Person named Alice, aged {a}"
        case Person(name=n, age=a) if a > 18:
            return f"Person named {n}, aged {a} (adult)"
        case _:
            return "Other"


result1 = advanced_pattern_matching_example(0)
result2 = advanced_pattern_matching_example([1, 2])
result3 = advanced_pattern_matching_example({"key": "value"})
result4 = advanced_pattern_matching_example(Person("Alice", 25))
result5 = advanced_pattern_matching_example(Person("Bob", 30))

print(result1)  # Output: "Zero"
print(result2)  # Output: "List with elements 1 and 2"
print(result3)  # Output: "Dictionary with key 'key' and value value"
print(result4)  # Output: "Person named Alice, aged 25"
print(result5)  # Output: "Person named Bob, aged 30 (adult)"
