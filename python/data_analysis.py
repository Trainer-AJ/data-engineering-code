import pandas as pd 

# read the data from csv file into a pandas dataframe.
# data = pd.read_csv('data.csv')

data = {
    'name': ['John', 'Jane', 'Bob', 'Alice'],
    'age': [25, 30, 35, 40],
    'salary': [50000, 60000, 70000, 80000],
    'department': ['IT', 'HR', 'IT', 'HR']
}

# create a pandas dataframe from the dictionary
df = pd.DataFrame(data)
print(df)

only_HR = df[df['department'] == 'HR']

print("\nOnly HR Dept")
print(only_HR)

all_data = df.describe()

print(all_data)

# this will calculate average salary for each department
def average_salary(df):
    df = df.groupby('department').mean()
    return df

print("\nAverage Salary")


# # this will calculate total salary for each department      
# def total_salary(df):
#     df = df.groupby('department').sum()
    #return df