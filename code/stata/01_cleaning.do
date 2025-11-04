////// Research question //////
display "Research question: Which U.S. airlines had the lowest and highest average ticket fares throughout 2011–2016?"

///// Working directory, import of dataset /////
cd "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US"
import delimited "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US\data\raw\airline-route-panel.csv", clear
save "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US\data\raw\airline-route-panel.dta", replace
use "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US\data\raw\airline-route-panel.dta", clear

///// Exploring data /////
describe
summarize
tab year
tab airline_code

////// Filtering variables //////
keep airline_code origin finaldest passengers quarter year itinfare

////// Looking for missing values /////
count if missing(itinfare)
count if missing(passengers) // so no values are missing

////// Filtering observations //////
keep if year >= 2011 & year <= 2016

////// Creating transformations of variables /////
gen log_itinfare = log(itinfare)
drop if missing(log_itinfare)

///// Saving a smaller component of the research /////
save "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US\data\cleaned\airline-route-panel_cleaned.dta", replace

