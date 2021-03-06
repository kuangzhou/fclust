\name{FKM.pf} 
\alias{FKM.pf}
\title{Fuzzy \emph{k}-means with polynomial fuzzifier}
\description{
 Performs the fuzzy \emph{k}-means clustering algorithm with polynomial fuzzifier function. 
 \cr The polynomial fuzzifier creates areas of crisp membership degrees around the prototypes while, outside of these areas of crisp membership degrees, fuzzy membership degrees are given. Therefore, the polynomial fuzzifier produces membership degrees equal to one for objects clearly assigned to clusters, that is, very close to the cluster prototypes.
} 
\usage{ 
 FKM.pf (X, k, b, RS, stand, startU, conv, maxit)
}
\arguments{
 \item{X}{Matrix or data.frame}
 \item{k}{Number of clusters (default: 2)}
 \item{b}{Parameter of the polynomial fuzzifier (default: 0.5)}
 \item{RS}{Number of (random) starts (default: 1)}
 \item{stand}{Standardization: if \code{stand=1}, the clustering algorithm is run using standardized data (default: no standardization)}
 \item{startU}{Rational starting point for the membership degree matrix \code{U} (default: no rational start)}
 \item{conv}{Convergence criterion (default: 1e-9)}
 \item{maxit}{Maximum number of iterations (default: 1e+6)}
}
\value{
 Object of class \code{fclust}, which is a list with the following components:
 \item{U}{Membership degree matrix}
 \item{H}{Prototype matrix}
 \item{F}{Array containing the covariance matrices of all the clusters (\code{NULL} for \code{FKM.pf})}
 \item{clus}{Matrix containing the indices of the clusters where the objects are assigned (column 1) and the associated membership degrees (column 2)}
 \item{medoid}{Vector containing the indices of the medoid objects (\code{NULL} for \code{FKM.pf})}
 \item{value}{Vector containing the loss function values for the \code{RS} starts}
 \item{cput}{Vector containing the computational times (user times) for the \code{RS} starts}
 \item{iter}{Vector containing the numbers of iterations for the \code{RS} starts}
 \item{k}{Number of clusters}
 \item{m}{Parameter of fuzziness (\code{NULL} for \code{FKM.pf})}
 \item{ent}{Degree of fuzzy entropy (\code{NULL} for \code{FKM.pf})}
 \item{b}{Parameter of the polynomial fuzzifier}
 \item{vp}{Volume parameter (\code{NULL} for \code{FKM.pf})} 
 \item{delta}{Noise distance (\code{NULL} for \code{FKM.pf})}
 \item{stand}{Standardization (Yes if \code{stand=1}, No if \code{stand=0})}
 \item{Xca}{Data used in the clustering algorithm (standardized data if \code{stand=1})}
 \item{X}{Raw data}
 \item{call}{Matched call}
} 
\details{
 If \code{startU} is given, the argument \code{k} is ignored (the number of clusters is \code{ncol(startU)}).
 \cr If \code{startU} is given, the first element of \code{value}, \code{cput} and \code{iter} refer to the rational starting point.
} 
\references{
Winkler R., Klawonn F., Hoeppner F., Kruse R., 2010. Fuzzy Cluster Analysis of Larger Data Sets. In: Scalable Fuzzy Algorithms for Data Management and Analysis: Methods and Design IGI Global, pp. 302-331. IGI Global, Hershey.
\cr Winkler R., Klawonn F., Kruse R., 2011. Fuzzy clustering with polynomial fuzzifier function in connection with M-estimators. Applied and Computational Mathematics, 10, 146-163.
}
\author{Paolo Giordani, Maria Brigida Ferraro}
\seealso{\code{\link{FKM.pf.noise}}, \code{\link{Fclust}}, \code{\link{Fclust.index}}, \code{\link{print.fclust}}, \code{\link{summary.fclust}}, \code{\link{plot.fclust}}, \code{\link{Mc}}}
\examples{
## McDonald's data
data(Mc)
names(Mc)
## data normalization by dividing the nutrition facts by the Serving Size (column 1)
for (j in 2:(ncol(Mc)-1))
Mc[,j]=Mc[,j]/Mc[,1]
## removing the column Serving Size
Mc=Mc[,-1]
## fuzzy k-means with polynomial fuzzifier 
## (excluded the factor column Type (last column))
clust=FKM.pf(Mc[,1:(ncol(Mc)-1)],k=6,stand=1)
}
\keyword{multivariate}
