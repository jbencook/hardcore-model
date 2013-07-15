require("sna")
require("animation")

color.matrix <- color.matrix[,1:280]
color.matrix <- ifelse(color.matrix, yes="black", no="white")

saveHTML({
	par(mar=rep(0,4), oma=rep(0,4))
	for (i in 1:280) {
  	gplot(M,
  				gmode="graph", 
          vertex.cex=2, 
          vertex.col=color.matrix[,i],
          coord=g.coord, 
          jitter=FALSE,
          label.lty=FALSE)
	}
}, img.name = "hardcore-model", 
   imgdir = "hardcore-model", 
   outdir = "output/animation",
   htmlfile = "animation.html", 
   autobrowse = FALSE, 
   title = "Animation of Hard-Core Model",
   interval=.15)