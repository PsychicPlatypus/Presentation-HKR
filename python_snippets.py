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
