# README

## Author: Pat Warner
## Course: Data Products
## Date: 12/18/14

This file will help user to understand and deploy the 
dynamic portfolio rebalance application.

## Application Location
https://patwarner.shinyapps.io/DataProducts/

* Launch the applicaton by entering the Application link in browser bar

## Usage

* The Dynamic Portfolio Allocation application allows for
entering up to two individual assets, which are then retreived
from yahoo finance database and processed with reactive so as not 
to overload the yahoo finance server on each update. The dates
are fixed to a range starting 01-01-2000. Any assets not active
during periods will be reflected in the internal portfolio calculations.

## Input:

* Enter two individual asset tickers into the Asset 1 and Asset 2 
boxes, respectively. Default tickers are SPY (S&P 500 ETF) and
TLT (bonds ETF).

* Use slider bar to dynamically allocate a fixed monthly percentage
to each portfolio asset. E.g. the default 0.5 value will allocate
50% to each asset each monthly rebalancing period.

* Ouput:

* When using the allocation slider bar, notice the **Allocation Plot**
and **Results Comparison** tables automatically update to reflect the
allocation weight percentage.  

* Plotting. A plot, **Allocation Plot** is displayed showing performance 
of the individual assets, which do not move, and the dynamic portfolio asset, 
which moves along with the slider.  The portfolio plot line (green) will update with the
slider, reflecting different allocations.

* Table. A real time table, **Results Comparision** will show cagr (Compound
Annual Return) and dd (max drawdown) results in real time as slider is updated.

## Tabular Results.
* Once an optimal portfolio weighting mix is found via the slider, Allocation Plot,
and Resutls Comparison, you may hit the **Update Tabular results** button to 
generate a tabular monthly and annual performance summary, which can be 
accessed by the **Tabular results** Tab on the tab pane.

## Some useful comments.
* I have noticed that the server can often be slow, possibly due to connection speed.
Nevertheless, it is useful to often hit the update button or a tab in order to help
jerk the application out of a frozen state.