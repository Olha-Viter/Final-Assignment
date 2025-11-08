import pandas as pd

##### Reading data and repeating creation of avrg_fares variable
data = pd.read_csv("C:/Users/Best/OneDrive - lnu.edu.ua/CEU/Coding/Final-Assignment_Airline-Tickets-US/data/cleaned/airline-route-panel_cleaned_python.csv")
avrg_fares = data.groupby("year")["itinfare"].mean()

##### Plotting a line graph
import matplotlib.pyplot as plt
fig = plt.figure(figsize = (10,6))
avrg_fares.plot(kind= 'line', marker= 'o')
plt.title("Average U.S. Airfares Over 2010-2015")
plt.xlabel("Year")
plt.ylabel("Average Fare (USD)")

##### Saving the graph
plt.savefig("C:/Users/Best/OneDrive - lnu.edu.ua/CEU/Coding/Final-Assignment_Airline-Tickets-US/Final-Assignment/output/average_fares.png")

##### Checking the graph
plt.show()