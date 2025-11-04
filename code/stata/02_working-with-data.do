////// Research question //////
display "Research question: Which U.S. airlines had the lowest and highest average ticket fares throughout 2011–2016?"

///// Working directory, using cleaned dataset /////
cd "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US"
use "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US\data\cleaned\airline-route-panel_cleaned.dta", clear

///// Sorting, summarizing /////
sort airline_code year
summarize itinfare, detail //we can see that 95 percentile is 20136 while 99% is 73351; those top 5% are likely errors or some exclusive premium flights, which might shift the mean
tabstat itinfare, by(airline_code) stats(mean sd min max n) //here is a confiramtion that the mean value for a lot of airlines is weirdly big, so there probably are outliers and/or errors, which we don't need in this research

///// Getting rid of the outliers /////
drop if itinfare > 20136
histogram log_itinfare, width(0.5) freq // the right side looks fine but on the left one we can see weirdly low values, again either error or special unusual deals; let's get rid of them
drop if log_itinfare < 5
histogram log_itinfare, width(0.5) freq // looks balanced now, so let's repeat summarizing
graph export "output\01-loghist_without-outliers.png"

///// Summary of outlier-free data /////
summarize itinfare, detail
tabstat itinfare, by(airline_code) stats(mean sd min max n)

// Now data looks fine and balanced. So, looking at the mean value we can define top 3 cheapest and top 3 the most expensive airlines: 
// The cheapest: L3 (around 641$), XJ (around 1436$), and OW (around 1642$)
// The most expensive: WN (around 6181$) U5 (around 5890$), and NK (around 4448$).

save "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US\data\cleaned\airline-route-panel_cleaned-n-polished.dta"
