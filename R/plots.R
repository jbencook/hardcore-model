require("sna")

opar <- par()

png("output/histogram-number-of-ones.png")
hist(B)
dev.off()

g.coord <- matrix(data=NA, nrow=ncol(M), ncol=2)
g.coord[,1] <- rep(1:10,10)
g.coord[,2] <- c(rep(10,10),
								 rep(9,10),
								 rep(8,10),
								 rep(7,10),
								 rep(6,10),
								 rep(5,10),
								 rep(4,10),
								 rep(3,10),
								 rep(2,10),
								 rep(1,10))

png("output/empty-graph.png")
par(mar=rep(0,4), oma=rep(0,4))
gplot(M, 
			gmode="graph", 
			vertex.cex=2,
			vertex.col="white",
			coord=g.coord, 
			jitter=FALSE, 
			label.lty=FALSE)
dev.off()

B.max <- max(B)
B.max.index <- which(B %in% B.max)[1]
full.graph <- color.matrix[,B.max.index]
node.color <- ifelse(full.graph, yes="black", no="white")

png("output/full-graph.png")
par(mar=rep(0,4), oma=rep(0,4))
gplot(M, 
			gmode="graph", 
			vertex.cex=2,
			vertex.col=node.color,
			coord=g.coord, 
			jitter=FALSE, 
			label.lty=FALSE)
dev.off()

rm(B.max, B.max.index, full.graph, node.color)

options(warn=-1)
par(opar)
