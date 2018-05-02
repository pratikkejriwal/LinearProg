#importing puLP which is a linear programming package
import pulp

linear = pulp.LpProblem("Linear Programming", pulp.LpMaximize)

x = pulp.LpVariable('x', lowBound=100, upBound=200, cat='Continuous')
y = pulp.LpVariable('y', lowBound=80, upBound=170, cat='Continuous')

# objective function
linear += -2000 * x + 5000 * y, "Z"

# constraints
linear += x + y >= 200
print(linear)

linear.solve()
pulp.LpStatus[linear.status]

for variable in linear.variables():
    print(variable.name, variable.varValue)

print (pulp.value(linear.objective))
