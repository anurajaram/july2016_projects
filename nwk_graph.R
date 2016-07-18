# author - Anupama Rajaram

# Add required dev libraries:
library(networkD3)
library(data.table) #fread() function
library(network)  # basic 'statnet' network library
library(maps)     # basic R map plotting library
library(sna)
library(ggplot2)
library(igraph)

# adding the ggnet (new network package) using devtools:
install.packages("devtools") 
devtools::install_github("briatte/ggnet")
library(ggnet)


# ============================================================ #
# part 1 - Simple network diagram using Notre-Dam Univ Data
# ============================================================ #
# social network data for univ of notre_dam students:
ntd <- fread("C:/anu/datasets/other/notre_dame_snw.csv")

# huge dataset, so we only take the first 300 observations.
validntd <- ntd[1:300,] # select all these rows

# plot a simple network! That easy! :)
simpleNetwork(validntd) 
# image also uploaded - social_nwk_notre_dame.jpg


# ============================================================ #
# part 2 - Another network diagram using new ggnet package.
# ============================================================ #
# social network data for women club.
wsnw <- fread("C:/anu/datasets/other/women-social-nwk.csv")
netw <- network(wsnw, directed = FALSE)

# vertex names
network.vertex.names(netw) = wsnw$V1

# actual graph
ggnet2(netw, node.size = 6, node.color = "red", edge.size = 1, edge.color = "grey", 
       label = wsnw$V1)
# note this has duplicate nodes.


# since the data is already in an incidence matrix form, 
# let's try something else! :)
women <- graph_from_incidence_matrix(wsnw)
head(women)

nodes2 <- wsnw$V1    ## creating labels for the nodes.

net2.bp <- bipartite.projection(women)
# this command simply means that there are only 2 possibilities , either a connection exists OR not.

simpleNetwork(wsnw)  # diagram example1

plot(net2.bp$proj1, vertex.label.color="black", vertex.label.dist=1,
     vertex.size=7, vertex.label = nodes2)
     # diagram example2


