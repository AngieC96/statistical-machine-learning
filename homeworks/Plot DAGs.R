setwd("/home/angela/Documenti/Statistical Machine Learning/Laboratory/statistical-machine-learning/homeworks")

install.packages("bnlearn")
install.packages("Rgraphviz")

# If you experience problems installing Rgraphviz, try the following script:
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Rgraphviz")


# empty graph
library(bnlearn)

dag <- empty.graph(nodes = c("A","S","E","O","R","T"))
arc.set <- matrix(c("A", "E",
                    "S", "E",
                    "E", "O",
                    "E", "R",
                    "O", "T",
                    "R", "T"),
                  byrow = TRUE, ncol = 2,
                  dimnames = list(NULL, c("from", "to")))
arcs(dag) <- arc.set
nodes(dag)

arcs(dag)

# plot dag with plot function
plot(dag)

# plot dag with graphviz.plot function. Default layout is dot
graphviz.plot(dag, layout = "dot")

# plot dag with graphviz.plot function. change layout to "fdp"
graphviz.plot(dag, layout = "fdp")

# plot dag with graphviz.plot function. change layout to "circo"
graphviz.plot(dag, layout = "circo")

hlight <- list(nodes = nodes(dag), arcs = arcs(dag),
               col = "blue", textCol = "blue")
pp <- graphviz.plot(dag, highlight = hlight)

# See https://bookdown.org/robertness/causalml/docs/tutorial-probabilistic-modeling-with-bayesian-networks-and-bnlearn.html


## Exercise 1.1

library(bnlearn)

dag <- empty.graph(nodes = c("A","B","C","D","E","F", "G", "H"))
arc.set <- matrix(c("A", "B",
                    "A", "F",
                    "D", "G",
                    "F", "G",
                    "B", "D",
                    "E", "H"),
                  byrow = TRUE, ncol = 2,
                  dimnames = list(NULL, c("from", "to")))
arcs(dag) <- arc.set
nodes(dag)
arcs(dag)

png(width=700, height=620, pointsize=15, file="graph.png")
plot(dag)
dev.off()
