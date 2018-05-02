#importing the necessary 
#library lpSolveAPI supports the linear programming
library(lpSolveAPI)

# given data
model <- c('A','B')
demand <- c(100, 80)
capacity <- c(200, 170)
profit <- c(-2000, 5000)
# creating a dataframe for the above data
df <- data.frame(model, demand, capacity, profit)
df

lprec <- make.lp(0,2)
lp.control(lprec, sense="max") 
# maximize the profit as per the question
set.objfn(lprec, c(-2000, 5000))
# shipment must be greater than 200,
add.constraint(lprec, c(1,1), ">=", 200)

# as per the Demand
# minimum of 100 model A cars must be manufactured
add.constraint(lprec, c(1,0), ">=", 100)
# minimum of 80 model B cars must be manufactured
add.constraint(lprec, c(0,1), ">=", 80)

# as per the capacity
# maximum of 200 model A cars can be manufactured
add.constraint(lprec, c(1,0), "<=", 200)
# maximum of 170 model B cars can be manufactured
add.constraint(lprec, c(0,1), "<=", 170)

RowNames <- c('Shipment', 'MinA', 'MinB', 'MaxA', 'MaxB')
ColNames <- c('Model A', 'Model B')
dimnames(lprec) <- list(RowNames, ColNames)

lprec

solve(lprec)
# if = 0, implies optimal solution can be evaluated

get.objective(lprec)
# maximum profit that can be made

get.variables(lprec)
# number of cars to be made by each A and B respectively in order to maximize the profit