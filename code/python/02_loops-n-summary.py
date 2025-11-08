import pandas as pd
import numpy as np

##### Reading data
data = pd.read_csv("C:/Users/Best/OneDrive - lnu.edu.ua/CEU/Coding/Final-Assignment_Airline-Tickets-US/data/cleaned/airline-route-panel_cleaned_python.csv")

##### Creating average fares (avrg_fares) variable and making a loop
avrg_fares = data.groupby("year")["itinfare"].mean()
for x in avrg_fares:
    print(x)
## So we got such average fares for each year: 2010 -- USD4193, 2011 -- USD4572, 2012 -- USD5011, 2013 -- USD5182, 2014 -- USD5670, 2015 -- USD5905

##### Summarizing the data and saving the results as a table
summary = data.groupby('year')['itinfare'].describe()
print("\nSummary statistics by year:\n", summary)
summary.to_csv("C:/Users/Best/OneDrive - lnu.edu.ua/CEU/Coding/Final-Assignment_Airline-Tickets-US/Final-Assignment/output/summary_statistics.csv")