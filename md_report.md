
# Linear Programming

### Linear Programming (also known as Linear Optimization), is a simple optimization technique where we try to simplify complex relationships in terms of linear functions and then find optimum points in such linear functions, so as to achieve the best outcome (either as lowest cost or as maximum profit).

### Linear Programming is used to obtain the most optimal solution for a problem provided the constraints are given. In linear programming, we formulate the real life problem into a mathematical model. The process involves an objective function, linear inequalities with subject to constraints. It can also be modelled to work for multi-dimensional problems.
### We apply linear programming by making simple assumptions, using which we can reduce the complexity of the problem drastically and can create solution(s) which works in most of the cases. Moreover, it can change/adjust with changing conditions and can help in selecting the best alternative based on the cost and profit among various alternatives.

### Applications of Linear Programming

### We can use linear programming for analyzing the supply chain operations in the manufacturing industries. Where we can maximize efficiency with minimum operation cost. As per the recommendations from the linear programming model, we can reconfigure the storage layout, adjust the workforce and reduce the bottlenecks associated with the industry.
### Linear programming is also used for shelf space optimization. As the number of products in the market have increased exponentially, it is important to understand what does the customer want. Optimization is aggressively used in stores where the products are placed strategically, keeping in mind the customer shopping pattern. The objective is to make it easy for a customer to locate & select the right products. This is with subject to constraints like limited shelf space, the variety of products, etc.
### Linear Programming is also used in optimization of Delivery Routes, extension of the traveling salesman problem. In such cases industry uses linear programming for finding the best route for multiple salesmen traveling to multiple cities. And with agglomerating it with clustering and greedy algorithms the delivery routes are decided by the companies. Here, the objective is to minimize the operation cost and time.
### Supervised Learning works on the basics of linear programming. A system is trained to fit on a mathematical model using a function from the labeled input data and the trained model is used to predict values for an unknown test data.
### The applications of linear programming also include Stock Market, Sports, etc predictions and optimization. The Linear Programming technique is used for selecting the best possible strategy from a number of alternatives.

## Problem Formulation
### A car company produces 2 models, model A and model B. Long-term projections indicate an expected demand of at least 100 model A cars and 80 model B cars each day. Because of limitations on production capacity, no more than 200 model A cars and 170 model B cars can be made daily. To satisfy a shipping contract, a total of at least 200 cars much be shipped each day. If each model A car sold results in a \$2000 loss, but each model B car produces a \$5000 profit, how many of each type should be made daily to maximize net profits?

### Solution in R programming


```python
#importing the necessary 
#library lpSolveAPI supports the linear programming
library(lpSolveAPI)
```


```python
# given data
model <- c('A','B')
demand <- c(100, 80)
capacity <- c(200, 170)
profit <- c(-2000, 5000)
# creating a dataframe for the above data
df <- data.frame(model, demand, capacity, profit)
df
```


<table>
<thead><tr><th scope=col>model</th><th scope=col>demand</th><th scope=col>capacity</th><th scope=col>profit</th></tr></thead>
<tbody>
	<tr><td>A    </td><td>100  </td><td>200  </td><td>-2000</td></tr>
	<tr><td>B    </td><td> 80  </td><td>170  </td><td> 5000</td></tr>
</tbody>
</table>




```python
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
```


<dl>
	<dt>$anti.degen</dt>
		<dd><ol class=list-inline>
	<li>'fixedvars'</li>
	<li>'stalling'</li>
</ol>
</dd>
	<dt>$basis.crash</dt>
		<dd>'none'</dd>
	<dt>$bb.depthlimit</dt>
		<dd>-50</dd>
	<dt>$bb.floorfirst</dt>
		<dd>'automatic'</dd>
	<dt>$bb.rule</dt>
		<dd><ol class=list-inline>
	<li>'pseudononint'</li>
	<li>'greedy'</li>
	<li>'dynamic'</li>
	<li>'rcostfixing'</li>
</ol>
</dd>
	<dt>$break.at.first</dt>
		<dd>FALSE</dd>
	<dt>$break.at.value</dt>
		<dd>1e+30</dd>
	<dt>$epsilon</dt>
		<dd><dl class=dl-horizontal>
	<dt>epsb</dt>
		<dd>1e-10</dd>
	<dt>epsd</dt>
		<dd>1e-09</dd>
	<dt>epsel</dt>
		<dd>1e-12</dd>
	<dt>epsint</dt>
		<dd>1e-07</dd>
	<dt>epsperturb</dt>
		<dd>1e-05</dd>
	<dt>epspivot</dt>
		<dd>2e-07</dd>
</dl>
</dd>
	<dt>$improve</dt>
		<dd><ol class=list-inline>
	<li>'dualfeas'</li>
	<li>'thetagap'</li>
</ol>
</dd>
	<dt>$infinite</dt>
		<dd>1e+30</dd>
	<dt>$maxpivot</dt>
		<dd>250</dd>
	<dt>$mip.gap</dt>
		<dd><dl class=dl-horizontal>
	<dt>absolute</dt>
		<dd>1e-11</dd>
	<dt>relative</dt>
		<dd>1e-11</dd>
</dl>
</dd>
	<dt>$negrange</dt>
		<dd>-1e+06</dd>
	<dt>$obj.in.basis</dt>
		<dd>TRUE</dd>
	<dt>$pivoting</dt>
		<dd><ol class=list-inline>
	<li>'devex'</li>
	<li>'adaptive'</li>
</ol>
</dd>
	<dt>$presolve</dt>
		<dd>'none'</dd>
	<dt>$scalelimit</dt>
		<dd>5</dd>
	<dt>$scaling</dt>
		<dd><ol class=list-inline>
	<li>'geometric'</li>
	<li>'equilibrate'</li>
	<li>'integers'</li>
</ol>
</dd>
	<dt>$sense</dt>
		<dd>'maximize'</dd>
	<dt>$simplextype</dt>
		<dd><ol class=list-inline>
	<li>'dual'</li>
	<li>'primal'</li>
</ol>
</dd>
	<dt>$timeout</dt>
		<dd>0</dd>
	<dt>$verbose</dt>
		<dd>'neutral'</dd>
</dl>




```python
lprec
```


    Model name: 
              Model A  Model B         
    Maximize    -2000     5000         
    Shipment        1        1  >=  200
    MinA            1        0  >=  100
    MinB            0        1  >=   80
    MaxA            1        0  <=  200
    MaxB            0        1  <=  170
    Kind          Std      Std         
    Type         Real     Real         
    Upper         Inf      Inf         
    Lower           0        0         



```python
solve(lprec)
# if = 0, implies optimal solution can be evaluated
```


0



```python
get.objective(lprec)
# maximum profit that can be made
```


650000



```python
get.variables(lprec)
# number of cars to be made by each A and B respectively in order to maximize the profit
```


<ol class=list-inline>
	<li>100</li>
	<li>170</li>
</ol>



### Solution in Python


```python
#importing puLP which is a linear programming package
import pulp
```


```python
linear = pulp.LpProblem("Linear Programming", pulp.LpMaximize)
```


```python
x = pulp.LpVariable('x', lowBound=100, upBound=200, cat='Continuous')
y = pulp.LpVariable('y', lowBound=80, upBound=170, cat='Continuous')
```


```python
# objective function
linear += -2000 * x + 5000 * y, "Z"

# constraints
linear += x + y >= 200
```


```python
linear
```




    Linear Programming:
    MAXIMIZE
    -2000*x + 5000*y + 0
    SUBJECT TO
    _C1: x + y >= 200
    
    VARIABLES
    100 <= x <= 200 Continuous
    80 <= y <= 170 Continuous




```python
linear.solve()
pulp.LpStatus[linear.status]
```




    'Optimal'




```python
for variable in linear.variables():
    print(variable.name, variable.varValue)
```

    x 100.0
    y 170.0
    


```python
print (pulp.value(linear.objective))
```

    650000.0
    

## Conclusion: 
## The company must manufacture 100 model A cars and 170 model B cars in order to get a maximum profit of \$650,000
