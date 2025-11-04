////// Research question //////
display "Research question: Which U.S. airlines had the lowest and highest average ticket fares throughout 2011–2016?"

////// Working directory, using cleaned dataset /////
cd "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US"
use "\\tsclient\C\Users\Best\OneDrive - lnu.edu.ua\CEU\Coding\Final-Assignment_Airline-Tickets-US\data\cleaned\airline-route-panel_cleaned-n-polished.dta", clear

///// Plotting a bar histogram /////
graph bar itinfare, over(airline_code, label(angle(vertical))) title("Average Airline Fares, 2011 - 2016") ytitle("Mean Ticket Fare (USD)") 

///// Saving the graph //////
graph export "output\Average-Airline-Fares_2011–2016.png"