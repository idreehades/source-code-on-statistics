#
# Package Development
# Author: galaa
# Created on 2016/06/10 20:59:41
#

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Library dependence
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# install.packages("devtools", repos = "https://cran.rstudio.com");
# install.packages("roxygen2");

library(devtools);
library(roxygen2);

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Create a package
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

setwd("/home/galaa/R/x86_64-pc-linux-gnu-library/3.2");
create("izbali");

# Edit DESCRIPTION

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Add some functions
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Create file "edf.R" in folder "R"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Compile documentation and Reload the package
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

setwd("./izbali");
document();

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Test the package
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

help(edf);

edf(x = 0, X = c(-1,0,1));

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Build the package
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

setwd("..");
build("izbali");