% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_matrix.R
\name{filter_matrix}
\alias{filter_matrix}
\title{Filter OTU/ASV/gene matrix by abundance}
\usage{
filter_matrix(x, cutoff = 0)
}
\arguments{
\item{x}{A expression matrix with species/samples x genes/OTUs/ASVs}

\item{cutoff}{numeric() value of cutoff}
}
\value{
A filtered matrix
}
\description{
Filter OTU/ASV/gene matrix by abundance
}
\examples{
#Filterins genes abundance matrix
#expresion_genes <- matrix(rnorm(100), nrow = 10)
rownames(expresion_genes) <- paste0("gene_",letters[1:10])
colnames(expresion_genes) <- paste0("especie_",letters[1:10])

filter_matrix(expresion_genes)

}
