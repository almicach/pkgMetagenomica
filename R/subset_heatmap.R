expresion_genes <- matrix(rnorm(100), nrow = 10)
rownames(expresion_genes) <- paste0("gene_",letters[1:10])
colnames(expresion_genes) <- paste0("especie_",letters[1:10])

library(ComplexHeatmap)

Heatmap(expresion_genes)

Heatmap(expresion_genes,
        cluster_columns = FALSE,
        heatmap_legend_param = list(title = "log2"))


subset_heatmap <- function(x, especies = NULL, genes = NULL) {
  # subset matrix
  x_subset <- x[genes,especies]

  #plot heatmap
  ComplexHeatmap::Heatmap(x_subset,
                          cluster_columns = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}

subset_heatmap(expresion_genes,
               especies = c("especie_a", "especie_b","especie_c"),
               genes = c("gene_d","gene_e","gene_f"))

## Actividad ##

expresion_genes_total <- cbind(expresion_genes, Total = rowSums(expresion_genes))
expresion_genes_total <- as.data.frame(expresion_genes_total)

filtered_exp_genes <- subset(expresion_genes_total, Total > 0.2)
View(filtered_exp_genes)

ComplexHeatmap::Heatmap(as.matrix(filtered_exp_genes))

# Opción 2

filter_matrix <- function(x, cutoff = 0) {
  filter_x <- x

  filter_x[filter_x <= cutoff] = NA

  #plot heatmap

  ComplexHeatmap::Heatmap(filter_x,
                          cluster_columns = FALSE,
                          cluster_rows = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}

filter_matrix(expresion_genes)
