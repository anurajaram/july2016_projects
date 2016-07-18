# author - Anupama Rajaram
# attribution - modified code based on blog post. Link below:
# http://thinktostart.com/analyze-linkedin-with-r/


# Add required dev libraries:
install.packages("devtools")
# new network package
devtools::install_github("briatte/ggnet")
library(ggnet)

library(networkD3)
library(data.table) #fread() function
library(network)  # basic 'statnet' network library
library(maps)     # basic R map plotting library
library(sna)
library(ggplot2)
library(igraph)


# network diag for notre_dam students:
ntd <- fread("C:/anu/datasets/other/notre_dame_snw.csv")

# huge dataset, so we only take the first 300 observations.
validntd <- ntd[1:300,] # select all these rows
simpleNetwork(validntd)



# network diagram for women club.
wsnw <- fread("C:/anu/datasets/other/women-social-nwk.csv")
netw <- network(wsnw, directed = FALSE)

# vertex names
network.vertex.names(netw) = wsnw$V1

# actaul graph
ggnet2(netw, node.size = 6, node.color = "red", edge.size = 1, edge.color = "grey", 
       label = wsnw$V1)
# note this has duplicate nodes.





women <- graph_from_incidence_matrix(wsnw)
head(women)

nodes2 <- wsnw$V1
net2.bp <- bipartite.projection(women)

simpleNetwork(wsnw)

plot(net2.bp$proj1, vertex.label.color="black", vertex.label.dist=1,
     vertex.size=7, vertex.label = nodes2)


