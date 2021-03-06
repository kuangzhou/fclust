\name{FKM.ent.noise} 
\alias{FKM.ent.noise}
\title{Fuzzy \emph{k}-means with entropy regularization and noise cluster}
\description{
 Performs the fuzzy \emph{k}-means clustering algorithm with entropy regularization and noise cluster.
 \cr The entropy regularization allows us to avoid using the artificial fuzziness parameter \emph{m}. This is replaced by the degree of fuzzy entropy \emph{ent}, related to the concept of temperature in statistical physics.
 An interesting property of the fuzzy \emph{k}-means with entropy regularization is that the prototypes are obtained as weighted means with weights equal to the membership degrees (rather than to the membership degrees at
 the power of \emph{m} as is for the fuzzy k-means).
 \cr The noise cluster is an additional cluster (with respect to the \emph{k} standard clusters) such that objects recognized to be outliers are assigned to it with high membership degrees.
} 
\usage{ 
 FKM.ent.noise (X, k, ent, delta, RS, stand, startU, conv, maxit)
}
\arguments{
 \item{X}{Matrix or data.frame}
 \item{k}{Number of clusters (default: 2)}
 \item{ent}{Degree of fuzzy entropy (default: 1)}
 \item{delta}{Noise distance (default: average squared Euclidean distance between objects and prototypes from \code{FKM.ent} using the same values of \code{k} and \code{m})}
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
 \item{F}{Array containing the covariance matrices of all the clusters (\code{NULL} for \code{FKM.ent.noise})}
 \item{clus}{Matrix containing the indices of the clusters where the objects are assigned (column 1) and the associated membership degrees (column 2)}
 \item{medoid}{Vector containing the indices of the medoid objects (\code{NULL} for \code{FKM.ent.noise})}
 \item{value}{Vector containing the loss function values for the \code{RS} starts}
 \item{cput}{Vector containing the computational times (user times) for the \code{RS} starts}
 \item{iter}{Vector containing the numbers of iterations for the \code{RS} starts}
 \item{k}{Number of clusters}
 \item{m}{Parameter of fuzziness (\code{NULL} for \code{FKM.ent.noise})}
 \item{ent}{Degree of fuzzy entropy}
 \item{b}{Parameter of the polynomial fuzzifier (\code{NULL} for \code{FKM.ent.noise})}
 \item{vp}{Volume parameter (\code{NULL} for \code{FKM.ent.noise})} 
 \item{delta}{Noise distance}
 \item{stand}{Standardization (Yes if \code{stand=1}, No if \code{stand=0})}
 \item{Xca}{Data used in the clustering algorithm (standardized data if \code{stand=1})}
 \item{X}{Raw data}
 \item{call}{Matched call}
} 
\details{
 If \code{startU} is given, the argument \code{k} is ignored (the number of clusters is \code{ncol(startU)}).
 \cr If \code{startU} is given, the first element of \code{value}, \code{cput} and \code{iter} refer to the rational starting point.
 \cr The default value for \code{ent} is in general not reasonable if \code{FKM.ent} is run using raw data. 
 \cr The update of the membership degrees requires the computation of exponential functions. In some cases, this may produce \code{NaN} values and the algorithm stops. Such a problem is usually solved by running \code{FKM.ent} using standardized data (\code{stand=1}).
} 
\references{
 Dave' R.N., 1991. Characterization and detection of noise in clustering. Pattern Recognition Letters, 12, 657-664.
 \cr Li R., Mukaidono M., 1995. A maximum entropy approach to fuzzy clustering. Proceedings of the Fourth IEEE Conference on Fuzzy Systems (FUZZ-IEEE/IFES '95), pp. 2227-2232.
 \cr Li R., Mukaidono M., 1999. Gaussian clustering method based on maximum-fuzzy-entropy interpretation. Fuzzy Sets and Systems, 102, 253-258.
}
\author{Paolo Giordani, Maria Brigida Ferraro}
\seealso{\code{\link{FKM.ent}}, \code{\link{Fclust}}, \code{\link{Fclust.index}}, \code{\link{print.fclust}}, \code{\link{summary.fclust}}, \code{\link{plot.fclust}}, \code{\link{butterfly}}}
\examples{
## butterfly data
data(butterfly)
## fuzzy k-means with entropy regularization and noise cluster
clust=FKM.ent.noise(butterfly,RS=5,delta=3)
}
\keyword{multivariate}

