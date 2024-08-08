# To get and add on 
import pandas as pd

# run  pip install pandas in terminal to install pandas

input_data =  {
         "Name": [
             "Braund, Mr. Owen Harris",
           "Allen, Mr. William Henry",
             "Bonnell, Miss. Elizabeth",
        ],
        "Age": [22, 35, 58],
        "Sex": ["male", "male", "female"],
       }
       
# pandas_output = pandas.DataFrame(input_data)
# DataFrame is a class in pandas module
# Dataframe is just like view in database
# print(pandas_output)

df2 = pd.DataFrame(input_data["Age"])
df2.max()

# you haver to print dataframe to see the output
print(df2)
print(f"Here is Max age ==> {df2.max()}")

# def dataframe(input_data)  => pandas.py ==> dataframe(input_data) 
