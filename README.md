Source: https://gabors-data-analysis.com/datasets/#airline-tickets-usa  
Languages/software used: Stata, Python (VS Code)  


Research questions:  
I. Which U.S. airlines had the lowest and highest average ticket fares throughout 2011-2016? (in Stata)  
II. How have average airfares in the U.S. changed over time (2010-2015)? (in Python)


I. Which U.S. airlines had the lowest and highest average ticket fares throughout 2011–2016? (in Stata)  

I used airline-route-panel.csv as a primary source of data for this and the second research questions. For convinience, I transformed cvs file to dta. The whole process was done in three steps:  

- 01_cleaning.do : first of all, I explored data using commands like 'describe', 'summarize', 'tab'. Then I started cleaning: I got rid of all the variables but those I needed for the research ('airline_code', 'origin', 'finaldest', 'passengers', 'quarter', 'year', 'itinfare'), I checked for missing values (there were none), and I limited observations to the period of 2011 to 2016. Lastly, I created a new variable - log_itinfare and saved cleaned data (airline-route-panel_cleaned.dta).  
	
- 02_working-with-data.do : here I started from summarizing variable 'itinfare' from cleaned data. The outcome of the command showed that the value of 95 percentile was 20,136 while of 99% - 73,351; those top 5% were likely errors or some exclusive premium flights, which might have shifted the mean. Therefore, one step later I would get rid of that. I also ran 'tabstat itinfare, by(airline_code)' and confirmed that the mean value for a lot of airlines was weirdly large, so there probably were outliers and/or errors, which I decided to remove from the analysis.  
	I limited itinfare variable values to those smaller or equal 20,136 and droped the rest; made a hist to check visually how my data looks like now. The right side looked fine but on the left one there were weirdly low values, again either error or special unusual deals; I got rid of them too ('drop if log_itinfare < 5'). Made new hist:  
	
	<img width="971" height="583" alt="01-loghist_without-outliers" src="https://github.com/user-attachments/assets/47e3e79b-d6d8-4545-a1ae-6f6c007d8d70" />  
	
	This histogram confirmed that data is balanced now and ready to be used for further analysis. I ran 'summarize' and 'tabstat' commands again. As a result, I could see a list of average ticket prices for different airlines and the top 3 cheapest turned out to be L3 (around 641$), XJ (around 1436$), and OW (around 1642$); while top 3 most expensive were WN (around 6181$) U5 (around 5890$), and NK (around 4448$).
	I saved the polished data to use later for plotting a graph (airline-route-panel_cleaned-n-polished.dta).

- 03_vizualization.do : using airline-route-panel_cleaned-n-polished.dta, I plotted a bar histogram and saved it:
	<img width="971" height="583" alt="Average-Airline-Fares_2011–2016" src="https://github.com/user-attachments/assets/43c6f65a-c44c-4634-8467-87d536d66bff" />
Conclusion:

	The cheapest airlines:
  - L3 (around $641),
  - XJ (around $1,436),
  - OW (around $1,642).
      
  The most expensive:
  - WN (around $6,181),
  - U5 (around $5,890),
  - NK (around $4,448).



II. How have average airfares in the U.S. changed over time (2010–2015)? (in Python)

Using the same raw data (airline-route-panel.csv), I attempted to answer the above-mentioned question. For this purpose, I did three steps:  

- 01_cleaning.py : I cleaned the data by getting rid of the missing values and leaving only those variables and observations that I am interested in (so 'airline_code', 'year', 'quarter', 'itinfare'; 2010 -- 2015). Cleaned data was saved to airline-route-panel_cleaned_python.csv.
- 02_loops_n_summary.py : Using cleaned data (airline-route-panel_cleaned_python.csv), I created a new variable - Average fares (avrg_fares) - which basically represents mean of each year's fare (itinfare). Then I used for loops to find those mean/average fare values for each year. The result I got were:
   - 2010 - $4,193,
    - 2011 - $4,572,
    - 2012 - $5,011,
    - 2013 - $5,182,
    - 2014 - $5,670,
    - 2015 - $5,905.

      Then I summarized the data and saved summary as a table (summary_statistics.csv).
      
- 03_plotting.py : Using cleaned data (airline-route-panel_cleaned_python.csv) and newly created variable Average fares (avrg_fares), I plotted a graph:
    <img width="1000" height="600" alt="average_fares" src="https://github.com/user-attachments/assets/1b6420c8-487e-4369-98fa-6a82dfa7ee87" />
    The dots on the line correspond to the mean values I found before with the help of loops.

  Conclusion: the average fare for this airline was constantly increasing in the period from 2010 to 2015.

Notes:
1) I could not identify what airlines correspond to the codes used in the raw dataset;
2) Due to large size of the csv and dta files (cleaned and raw) they were uploaded as zip files to GitHub; during the analysis, though, I used them as regular csv and dta files.

