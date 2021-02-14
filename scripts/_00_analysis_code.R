# install important library
install.packages('rospca')

# load library
library(rospca)

############ Q1 ############ 
# a.)
## generate the instructed data
df_all = dataGen(m = 1, n = 100, p = 9 , a = c(0.7, 0.9, 0.8), bLength = 3, SD = c(20,5,10))
df_all
df_1 = df_all$data[[1]] # get the generated data

# b.)
corr_df = cor(df_1) # check correlation among the variables of the generated data
sd_df = apply(df_1, 2 , sd)  # check standard deviation values of the generated data
corr_df # close but not exactly equal to the stated 
sd_df # close but not exactly equal to the stated 

# c.)
## generate the same data, except the intercorrelations are zeros
df2_all = dataGen(m = 1, n = 100, p = 9 , a = c(0, 0, 0), bLength = 3, SD = c(20,5,10))
df2_all
df_2 = df2_all$data[[1]]


## check correlation and sd
corr_df2 = cor(df_2) # check correlation among the variables of the generated data
sd_df2 = apply(df_2, 2 , sd)  # check standard deviation among the variables of the generated data
corr_df2 # see some variables correlate, albeit not significantly
sd_df2 # close but not exactly equal to the stated 

# d.)
## perform PCA on the first generated data (a.) ##
### convert data into dataframe format, to make the analysis easier
df_1 = data.frame(df_1)
### put the column names to ease the readers in the document
colnames(df_1) = c('Var1','Var2','Var3','Var4','Var5','Var6','Var7','Var8','Var9')
df_1
### because variances differ vastly among variables, we should scale the data before doing PCA
pr_1.out = prcomp(df_1, scale = TRUE) # we can use this directly as our variables are quantitative
pr_1.out
### plot the first two principal components
biplot(pr_1.out, scale = 0) # we see a high clustering of variables 7,8 and 9, and of variables 4,5, and 6
                            # which is expected as each variable within these two groups are highly correlated
                            # (0.8, 0.9, respectively). Also, since the outer correlations are relatively close 
                            # to zero, we clearly see that the group with variables 7,8 and 9 explains a lot for PC2, while little for PC1
                            # whereas the group 4,5 and 6 exhibits a vice versa phenomenon. 
                            
### test when we did not standardize the variables
pr_1_uc.out = prcomp(df_1)
biplot(pr_1_uc.out, scale = 0) # Var1,2,3,7,8, and 9 clearly dominate Var4,5, and 6 due to variance domination

### calculate variance explained by each principal component for the standardized case
pr_1.out$sdev
pr_1.var = pr_1.out$sdev ^2
pr_1.var 
pve_1 = pr_1.var/sum(pr_1.var)
pve_1 # individual varaince explained of each principal component as of the total (9), as each variable is standardized and 
      # hence the sum of total variance = 9 (1+1+1+ ...+ 1) 
### plot variance explained by each principal component
plot(pve_1, xlab = " Principal Component", ylab = "Proportion of Variance Explained", 
     ylim = c(0,1), type = "b") 
### plot culmulative variance explained 
plot(cumsum(pve_1), xlab = "Principal Component", 
     ylab =" Cumulative Proportion of Variance Explained", ylim = c(0,1), type = "b")
### it seems that in this case, we should focus on only three principal components
### as we can clearly identify an elbow of the plot

## perform PCA on the second generated data (c.) ##
### convert data into dataframe format, to make the analysis easier
df_2 = data.frame(df_2)
### put the column names to ease the readers in the document
colnames(df_2) = c('Var1','Var2','Var3','Var4','Var5','Var6','Var7','Var8','Var9')
df_2
### examnie the variance of the data
apply(df_2, 2, var)
### hence we should scale the data due to huge differences of variances before doing PCA
pr_2.out = prcomp(df_2, scale = TRUE) # we can use this directly as our variables are quantitative
pr_2.out
### plot the first two principal components
biplot(pr_2.out, scale = 0) # this is so constrast with pr_1, as the red arrows, which are the first 
                            # two component loading vectors, speard out in all directions 
                            # This is expected, as all the variables are marginally correlated 
### test when we did not standardize the variables
pr_2_uc.out = prcomp(df_2)
biplot(pr_2_uc.out, scale = 0) # clearly difficult to interpret
### calculate variance explained by each principal component for standardized case
pr_2.out$sdev
pr_2.var = pr_2.out$sdev ^2
pr_2.var
pve_2 = pr_2.var/sum(pr_2.var)
pve_2 
### plot variance explained by each principal component
plot(pve_2, xlab = " Principal Component", ylab = "Proportion of Variance Explained", 
     ylim = c(0,1), type = "b") # relatively, all principal components have similar variance explained
### plot culmulative variance explained 
plot(cumsum(pve_2), xlab = "Principal Component", 
     ylab =" Cumulative Proportion of Variance Explained", ylim = c(0,1), type = "b") # no clear elbow
# it seems that in this case, we are faced with difficulties, as the more principal component
# we included, the more complexities in terms of interpretation
# also it is more difficult to visualize when we have more dimentions
# To illustrate, we have to include up to 4 principal, to have the culmulative variance explained 
# well-above 50%, and this hinders interpretability and makes visualization almost imposible to 
# interpret by eyes

### In sum, we know that df_2 are just marginally linearly correlated by construction, and hence the justification
### of doing PCA analysis is limited, if not non-existence.




############ Q2 ############ 

# load data
df3 = read.table('UNSY97.txt', header = TRUE)
df3
str(df3)
summary(df3)

# get the name of each rows
nation_names = ("Albania, Argentina, Australia, Austria, Benin, Bolivia, Brazil, Cambodia, China, Colombia, Croatia, El Salvador, France, Greece, Guatemala, Iran, Italy, Malawi, Netherlands,Pakistan, Papua New Guinea, Peru, Romania, USA, Zimbabwe")
nation_names = strsplit(nation_names, ',') # split the names into single entity
nation_names = nation_names[[1]] # extract the required element in the list
rownames(df3) = nation_names # name the dataframe columns
df3
# check variance
apply(df3, 2 , var) # we see variables such as GDP dominating others in terms of variance
# check mean
apply(df3, 2 , mean) # we see variables such as GDP dominating others in terms of mean
# hence we standardize the variables first to minimise the distance effect of GDP when using Euclidean distances
df3.sc = scale(df3)
# calculate Euclidean distances
df3.sc.dist = dist(df3.sc)
#analysis
## 1 dimension 
df3_1.sc.mds = cmdscale(df3.sc.dist, k = 1)

### 1-dimensional visualisation
plot(c(df3_1.sc.mds),rep(1,25), type = 'l', ylab = '',xlab = 'Dimension 1', axes = F, xlim = c(-3,4), 
     sub = "One-dimensional plot of countries from classical MDS")
axis(side =1)
text(c(df3_1.sc.mds),rep(1,25), c(nation_names), cex=0.5, srt = 270, pos = 4, xpd = T)
# it appears that European countries and USA are located in the same cluster
# whereas the South Amercan countries are also located in the same cluster

## 2 dimension
df3_2.sc.mds = cmdscale(df3.sc.dist)

### 2-dimensional visualization 
plot(df3_2.sc.mds, type = "n", xlab = "Dimension 1", ylab = "Dimension 2", 
     sub = "Two-dimensional plot of countries from classical MDS")
text(df3_2.sc.mds, rownames(df3_2.sc.mds), cex=1)

# conduct PCA to aid the analysis
pr_3.out = prcomp(df3.sc) # we can use this directly as our variables are quantitative
pr_3.out # these loadings can be used to evaluate previous two graphs

# evaluation of dimensional competency
## conduct a GOF test
### create am empty vector to store values
gof = c()
k = c(1,2,3,4)
### create a for loop to extract GOF values
for (i in k){
  to_store = cmdscale(df3.sc.dist, k = i, eig = TRUE)$GOF[1]
  gof = append(gof, to_store)
  
}
### plot GOF vs. dimensions
plot(k, gof, type = "b", xlab = "Number of dimensions", ylab = "GOF") 

