/* Given parameter */

param N integer , > 0;
param p integer , > 0;
param q integer , > 0;

set V := 1 .. N;
set E within {V, V};

param cost{E};

/* Decision Variables */
var x{E} <= 1, >=0;

/* Objective Function */
minimize PATH_COST : sum{i in V} (sum{ j in V} (cost [i, j] * x[i,j] ) );

/* Constraints */
s.t.	SOURCE { i in V: i =p && p != q}:
	sum{j in V} (x[i,j]) - sum{j in V} (x[j,i]) = 1;
s.t.	INTERNAL{i in V: i!= p && i!= q && p!=q }:
	sum{j in V} (x[i,j]) - sum{j in V}(x[j, i]) = 0;
end;
