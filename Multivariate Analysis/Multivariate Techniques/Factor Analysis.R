#
# Factor Analysis: Principal Component Method
# Author: galaa
# Created on 2016/03/19 07:49:41
#

## Data

X = matrix(data = c(2.40, 2.37, 2.65, 2.99, 2.45, 2.89, 3.43, 2.34, 3.36, 3.38, 3.44, 2.31, 2.59, 2.72, 3.30, 2.15, 2.51, 2.08, 3.85, 2.25, 2.74, 2.09, 2.28, 2.24, 2.35, 2.73, 2.32, 2.61, 3.03, 2.16, 3.00, 3.01, 3.13, 2.11, 2.50, 2.52, 2.89, 1.97, 2.24, 1.91, 3.49, 2.05, 2.69, 1.87, 2.12, 2.13, 2.33, 2.42, 2.07, 2.80, 2.57, 1.95, 2.53, 2.57, 2.91, 1.83, 2.52, 2.32, 2.58, 1.68, 2.19, 1.59, 2.75, 1.95, 2.34, 1.62, 1.61, 1.69, 1.86, 1.81, 1.57, 2.42, 1.86, 1.44, 1.78, 1.72, 2.19, 1.39, 2.10, 1.70, 1.88, 1.28, 1.77, 1.17, 2.05, 1.53, 1.53, 1.25, 1.08, 1.08, 1.09, 1.16, 1.03, 1.46, 1.21, 0.88, 1.06, 0.96, 1.34, 0.93, 1.40, 0.98, 1.12, 0.78, 1.19, 0.65, 1.25, 0.94, 0.88, 0.76, 0.63, 0.67, 0.69, 0.71, 0.60, 0.90, 0.60, 0.44, 0.45, 0.33, 0.67, 0.58, 0.82, 0.39, 0.52, 0.37, 0.68, 0.35, 0.60, 0.52, 0.45, 0.39, 0.37, 0.49, 0.46, 0.47, 0.42, 0.77, 0.30, 0.25, 0.22, 0.04, 0.35, 0.42, 0.52, 0.12, 0.26, 0.21, 0.44, 0.22, 0.34, 0.36, 0.28, 0.24, 0.50, 0.61, 0.60, 0.62, 0.56, 0.84, 0.50, 0.37, 0.37, 0.25, 0.56, 0.56, 0.67, 0.34, 0.40, 0.34, 0.59, 0.34, 0.51, 0.48, 0.46, 0.36, 0.95, 1.01, 1.07, 1.03, 1.04, 1.29, 1.03, 0.83, 0.93, 0.81, 1.07, 0.94, 1.11, 0.79, 0.95, 0.73, 1.03, 0.68, 1.09, 0.90, 0.93, 0.76, 1.44, 1.52, 1.60, 1.59, 1.53, 2.02, 1.85, 1.31, 1.70, 1.67, 1.90, 1.33, 1.71, 1.51, 1.76, 1.19, 1.61, 1.11, 1.97, 1.40, 1.45, 1.16, 1.93, 2.14, 2.25, 2.28, 2.01, 2.72, 2.62, 1.88, 2.49, 2.61, 2.65, 1.83, 2.22, 2.23, 2.52, 1.67, 2.13, 1.65, 2.89, 1.93, 1.94, 1.62, 2.19, 2.35, 2.58, 2.75, 2.43, 2.77, 3.15, 2.16, 3.15, 3.26, 3.04, 2.12, 2.37, 2.50, 2.99, 1.97, 2.29, 1.99, 3.54, 2.16, 2.53, 1.94), nrow = 22, ncol = 12, byrow = FALSE)

print(X)

## Dimenshion

p = length(X[1,])

## Sample Size

n = length(X[,1])

## The number of factors

k = 2

## Degrees of freedom

d = ((p-k)^2-(p+k))/2

## Sample covariation

S = cov(X)

## Spectral decomposition

eig = eigen(S)

Lambda = eig$values

Gamma = eig$vectors

## Factor Loading

# detailed version
L = c();
for (i in 1:k) {
  L = cbind(L, sqrt(Lambda[i]) * Gamma[,i]);
}
print(L)

# general version
t(diag(sqrt(Lambda[1:k])) %*% t(Gamma[,1:k]))

## Specific variance \psi_{jj}

diag(S - L %*% t(L))

## Communality

diag(L %*% t(L))

## Factor Score (unrotated)

t(t(L) %*% solve(S) %*% t(scale(X, center = TRUE, scale = FALSE)))

## Factor Analysis with specific function from the package psych -- COMPARE IT previous results

install.packages("psych") # if required

library(psych)
result <- principal(X, nfactors = 2, covar = TRUE, rotate = "none")
print(result)

# explanation of return value

round(Lambda[1:2], digits = 2) # SS loadings
round(Lambda[1:2] / sum(Lambda), digits = 2) # SProportion Var
round(cumsum(Lambda)[1:2] / sum(Lambda), digits = 2) # Cumulative Var
round(Lambda[1:2] / sum(Lambda[1:2]), digits = 2) # Proportion Explained
round(-L, digits = 2) # Unstandardized loadings (pattern matrix) based upon covariance matrix
round(diag(L %*% t(L)), digits = 3) # h2
round(diag(S - L %*% t(L)), digits = 4) # u2
h2 = diag(L %*% t(L)); round(h2 / diag(S), digits = 2) # H2
u2 = diag(S - L %*% t(L)); round(u2 / diag(S), digits = 4) # U2
