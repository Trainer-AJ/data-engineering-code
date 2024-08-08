"""
Tyoe anyhy'
fireighgt
hdjkhc
"""
# Online Python - IDE, Editor, Compiler, Interpreter

# Order 
list1 = ["Hassan", 56.0, 87, "Texas", "Hassan"]
#          0     , 1   , 2  , 3 
print(list1[4])

# UNIQUE ==> sets ==> unique values 
set1 = {"Hassan", 56.0, 87, "Texas","Hassan" }

set2 = {"Hassan", "AJ", "Vinesh"}

######## HOw to Unsort Set ??

# either value is in set1 or set2 OR condition 
print(set1 | set2)

# And Condition (Common values in both set)
print(set1 & set2)

# Docs = https://docs.python.org/3/tutorial/datastructures.html#sets

# Sets are Unordered so, Below Gives Error: 
# print(set1[0])

# so How to find a value ??
# Use List Comprehensions :) 

# Dictnary in Py = JSON like Key Value Pair 
doc1 = {
    "Key": "String",
    "Name": "Hassan",
    "Age": 25,
    "City": "Dallas",
    "Working": True,
    "Key": "Duplicate",
    "Key": "India"
}

## Hassan
# {'Key': 'India', 'Name': 'Hassan', 'Age': 25, 'City': 'Dallas', 'Working': True}

# Above Print ==> 
print(doc1["Key"])

# tuple => oredered list but Read-only aka immutable 
t = ("Hassan", 56.0, 87, "Texas", "Hassan")

print(t)

# chnaging value in my list => mutable 
# AT 2nd poition to 87
# position, value 
list1.insert(2,20)
print(list1)


conversion = set(t)
print("This is Converted to set ==> ", conversion)

######################### Loops 

"""
1. for item in items:
    # TODO: write code...
2. If else
3. while
4. Until
5. Match 

"""

for iterable in conversion:
    print("Found ", iterable, "In Your Collection called as Conversion")
    # print(f"Found {iterable} In Your Collection called as Conversion")
    print("*" * 20)
print("Out of loop now")

numbers = [1,2,3,4,4,4,5,6]

for var_name in set([1,2,3,4,4,4,5,6]):
    # # print("Found ", var_name, "In Your Collection called as Conversion")
    # print(f"Found {var_name} In Your Collection called as Conversion")
    # print("#" * 20)
    print(var_name / 2)
    print(f"REMAINDER => {var_name % 2}")
    if (var_name % 2 == 0) :
        print(f"{var_name} is EVEN")
    else: 
        print(f"The Condition EVavlutates to {(var_name % 2 == 0)}")
        
print("Out of loop now")





    





