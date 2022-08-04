#' Filter OTU/ASV/gene matrix by abundance
#'
#' @param x A expression matrix with species/samples x genes/OTUs/ASVs
#' @param cutoff numeric() value of cutoff
#'
#' @return A filtered matrix
#' @export
#'
#' @examples
#' #Filterins genes abundance matrix
#' #expresion_genes <- matrix(rnorm(100), nrow = 10)
#' rownames(expresion_genes) <- paste0("gene_",letters[1:10])
#' colnames(expresion_genes) <- paste0("especie_",letters[1:10])
#'
#' filter_matrix(expresion_genes)
#'
filter_matrix <- function(x, cutoff = 0) {
  filter_x <- x

  filter_x[filter_x <= cutoff] = NA

  #plot heatmap

  ComplexHeatmap::Heatmap(filter_x,
                          cluster_columns = FALSE,
                          cluster_rows = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}
