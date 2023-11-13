#' UNHCR color palettes
#'
#' Creates a color palette from UNHCR branding
#'
#' @param n Number of different colors in the palette, minimum depending on palette (2),
#' maximum depending on palette (5, 7 or 10)
#' @param name A palette name
#' @param ... Additional arguments for [grDevices::colorRampPalette]
#'
#' @return A character vector, the palette hex color codes.
#'
#' @examples
#' unhcr_pal(3, "pal_unhcr")
#' unhcr_pal(3, "pal_blue")
#' unhcr_pal(5, "pal_navy")
#' unhcr_pal(12, "pal_red")
#' @export
unhcr_pal <- function(n = NULL, name, ...){
  if (!(name %in% unhcrcolors$name)){
    stop(paste(name, "is not a valid palette name\n"),
         call. = FALSE)
  }
  selected_metadata <- unhcrcolors[unhcrcolors$name == name, ]
  min_n <- selected_metadata$min_n
  max_n <- selected_metadata$max_n
  type <- selected_metadata$type
  if (is.null(n)) {
    n <- max_n
  }
  proper_n <- n
  if (proper_n > max_n) {
    proper_n <- max_n
  }
  if (!(n %in% min_n:max_n) && type == "qualitative") {
    warning(paste("Number of colors (n) in the", name,
                  "palette should be between", min_n, "and", max_n,
                  "\n"), call. = FALSE)
  }
  if (n < min_n) {
    warning(paste("Number of colors (n) in the", name,
                  "palette should be between", min_n, "and",
                  max_n, "\n"), call. = FALSE)
    proper_n <- min_n
    n <- min_n
  }
  coln <- paste0("n", proper_n)
  colors <- unhcrcolors[unhcrcolors$name == name, ][[coln]][[1]]
  if (n > 2) {
    colors <- grDevices::colorRampPalette(colors, ...)(n = n)
  }
  colors
}
