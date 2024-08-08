def maths_operations():
    num1 = input("Number-1: ")
    print(f"Here is what you provided => {num1}")
    num1 = int(num1) ** 2 
    return num1
    # print vs return in python 
    # print(num1)

def func2(parameter):
    print(f"Got it from {parameter}")
    print(f"90% of {parameter} is => {parameter * 0.9}")

def main():
    main_func_variable = "main_func_variable"
    print(f"This is from MAIN Function => {main_func_variable} ")
    
    # Call maths_operations() and store the result
    result = maths_operations()
    
    # Print the result of maths_operations()
    print(f"This is value from maths_operations => {result}")
    
    # Call func2 with the result from maths_operations()
    func2(result)

if __name__=="__main__": 
    main()
