library(reshape2)
um <- read.table("~/Desktop/df_master.txt")
 c("C1_D6",
 "C1_E6",
 "C1_F6",
 "C2_F7",
 "C2_G7",
 "C2_H7",
 "C3_G6",
 "C3_H6",
 "C3_A7") -> nms
um[,1] <- gsub(".txt.gz","",um[,1])
um1 <- NULL
for(i in 1:length(nms))
um1 <- c(um1,which(nms[i] == um[,1]))
better <- um[-um1,]
b1 <- melt(better, id = 1:2)
b2 <- dcast(b1, CellName ~ variable, sum)
b2[,3] <- b2[,3]/1000000
b10 <- dcast(b1, CellName~variable, function(x) length(which(x>0)))
hist(b2[,3], breaks = 20, col = "grey", xlab = "Library Size (millions)", main = "Total Counts of all Genes for each Cell", ylab = "Number of Cells")
hist(b10[,3], breaks = seq(2000,12000,length=11), col = "grey", xlab = "Number of Expressed Genes", main = "Total Number of Genes Expressed per Cell", ylab = "Number of Cells", ylim = c(0,50))