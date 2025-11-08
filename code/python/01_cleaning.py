import pandas as pd
##### Reading data
data = pd.read_csv("C:/Users/Best/OneDrive - lnu.edu.ua/CEU/Coding/Final-Assignment_Airline-Tickets-US/data/raw/airline-route-panel.csv")

##### Displaying research question and seeing what kind of data and variables we have
print("How have average airfares in the U.S. changed over time (2010–2015)?")
print(data.info())

##### Cleaning data and keeping only variables we need for the research
data = data.dropna()
data = data[['airline_code', 'year', 'quarter', 'itinfare']]
data = data[(data['year'] >= 2010) & (data['year'] <= 2015)]

##### Saving cleaned data
data.to_csv("C:/Users/Best/OneDrive - lnu.edu.ua/CEU/Coding/Final-Assignment_Airline-Tickets-US/data/cleaned/airline-route-panel_cleaned_python.csv")

##### Checking if the previous commands worked 
print(data.info()) ## they did work, data is clean now





