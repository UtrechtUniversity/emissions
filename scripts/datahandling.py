"""This script is used to prepare the CBS dataset for analysis.

This script does the following:

- read data from csv file
- fix multiline header
- convert year column into numeric data
- make a subselection of relevant data
- load data into new CSV file

Authors:

- Jonathan de Bruin (j.debruin1@uu.nl)
- Barbara Vreede (b.m.i.vreede@uu.nl)

"""

import os

import pandas as pd

# read the CBS datafile Emissions_to_air__ro_190918144657.csv
data_fp = os.path.join("data", "Emissions_to_air__ro_190918144657.csv")
data = pd.read_csv(
    data_fp,
    sep=";",
    header=[2, 3, 4],  # multirow header
    skipfooter=1,  # skip the last line of the file
    encoding='latin1'  # the encoding is latin1 at CBS
)

# print the head of the dataframe
print(data.head())

# The column names are complicated for this dataset. We fix this in a
# not very robust way.
# TODO: Find a more robust way to extract the column names from file.
data.columns = ["Source", "Period", "CO2 emission",
                "N2O emission", "CH4 emission"]

# output the corrected dataframe
print(data.head())
print(data.dtypes)
# Source           object
# Period           object
# CO2 emission      int64
# N2O emission    float64
# CH4 emission    float64
# dtype: object

# the Period is an object. This needs to be an int64.
# Show all unique values:
print(data["Period"].unique())

# Convert the value "2017*" into 2017 and convert to int64.
data["Period"] = data["Period"].str.replace("[^0-9]+", "").astype(int)
print(data.head())
print(data.dtypes)
print(data["Period"].unique())
# Source           object
# Period            int64
# CO2 emission      int64
# N2O emission    float64
# CH4 emission    float64
# dtype: object

# make output folder
if not os.path.isdir("output"):
    os.mkdir("output")

# write the data to a CSV file.
data_output_fp = os.path.join(
    "output", "emissions_to_air_190918144657_clean.csv")
data.to_csv(data_output_fp, sep=";", index=False, encoding='utf-8')
