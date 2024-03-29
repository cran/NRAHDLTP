% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TS_BS1996.R
\name{ts_bs1996}
\alias{ts_bs1996}
\title{Test proposed by Bai and Saranadasa (1996)}
\usage{
ts_bs1996(y1, y2)
}
\arguments{
\item{y1}{The data matrix (p by n1) from the first population. Each column represents a \eqn{p}-dimensional sample.}

\item{y2}{The data matrix (p by n2) from the first population. Each column represents a \eqn{p}-dimensional sample.}
}
\value{
A  (list) object of  \code{S3} class \code{htest}  containing the following elements:
\describe{
\item{statistic}{the test statistic proposed by Bai and Saranadasa (1996)}
\item{p.value}{the \eqn{p}-value of the test proposed by Bai and Saranadasa (1996).}
}
}
\description{
Bai and Saranadasa (1996)'s test for testing equality of two-sample high-dimensional mean vectors with assuming that two covariance matrices are the same.
}
\details{
Suppose we have two independent high-dimensional samples:
\deqn{
\boldsymbol{y}_{i1},\ldots,\boldsymbol{y}_{in_i}, \;\operatorname{are \; i.i.d. \; with}\; \operatorname{E}(\boldsymbol{y}_{i1})=\boldsymbol{\mu}_i,\; \operatorname{Cov}(\boldsymbol{y}_{i1})=\boldsymbol{\Sigma},i=1,2.
}
The primary object is to test
\deqn{H_{0}: \boldsymbol{\mu}_1 = \boldsymbol{\mu}_2\; \operatorname{versus}\; H_{1}: \boldsymbol{\mu}_1 \neq \boldsymbol{\mu}_2.}
Bai and Saranadasa (1996) proposed the following centralised \eqn{L^2}-norm-based test statistic:
\deqn{T_{BS} = \frac{n_1n_2}{n} \|\bar{\boldsymbol{y}}_1 - \bar{\boldsymbol{y}}_2\|^2-\operatorname{tr}(\hat{\boldsymbol{\Sigma}}),}
where  \eqn{\bar{\boldsymbol{y}}_{i},i=1,2} are the sample mean vectors and \eqn{\hat{\boldsymbol{\Sigma}}} is the pooled sample covariance matrix.
They showed that under the null hypothesis, \eqn{T_{BS}} is asymptotically normally distributed.
}
\examples{
set.seed(1234)
n1 <- 20
n2 <- 30
p <- 50
mu1 <- t(t(rep(0, p)))
mu2 <- mu1
rho <- 0.1
y <- (-2 * sqrt(1 - rho) + sqrt(4 * (1 - rho) + 4 * p * rho)) / (2 * p)
x <- y + sqrt((1 - rho))
Gamma <- matrix(rep(y, p * p), nrow = p)
diag(Gamma) <- rep(x, p)
Z1 <- matrix(rnorm(n1 * p, mean = 0, sd = 1), p, n1)
Z2 <- matrix(rnorm(n2 * p, mean = 0, sd = 1), p, n2)
y1 <- Gamma \%*\% Z1 + mu1 \%*\% (rep(1, n1))
y2 <- Gamma \%*\% Z2 + mu2 \%*\% (rep(1, n2))
ts_bs1996(y1, y2)

}
\references{
\insertRef{bai1996effect}{NRAHDLTP}
}
