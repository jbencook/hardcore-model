#Number of iterations:
T <- 10000

#Create adjacency matrix and initialize all cells to 0:
M <- matrix(data=0, nrow=100, ncol=100)

#Add ties to make the graph a 10x10 grid. Also, make it symmetric:
# so the graph is undirected:
for(i in 1:100) {
	if((i %% 10) > 0) {
		M[i, i+1] <- 1
		M[i+1, i] <- 1
	}
	
	if(i <= 90) {
		M[i, i+10] <- 1
		M[i+10, i] <- 1
	}
}

#Create a vector of vertex colors:
A <- vector(mode="logical", length=100)

#Create a vector of "number of 1's" for each iteration:
B <- vector(mode="integer", length=T)

#Initialize the first element in B to 0:
B[1] <- 0

#Initialize matrix of colors for plotting:
color.matrix <- matrix(data=NA, nrow=100, ncol=T)
color.matrix[,1] <- FALSE

for(t in 2:T) {
	i <- sample(1:100, 1)
	heads <- ifelse(runif(1,0,1) > .5, yes=TRUE, no=FALSE)
	feasible.if.changed <- TRUE
	
	if(heads) {
		for(j in 1:100) {
			if(M[i,j] == 1 & A[j]) {
				feasible.if.changed <- FALSE
			}
		}
		
		if(feasible.if.changed) {
			A[i] <- TRUE
		}
	}
	
	if(!heads) {
		A[i] <- FALSE
	}
	
	B[t] <- sum(A)
	color.matrix[,t] <- A
}

rm(i, j, t, heads, feasible.if.changed)

summary(B)
hist(B)

