#' Save ggplot2 using sensible defaults for better output
#'
#' Save ggplot2 using sensible defaults for better output
#'
#'
#' @importFrom ggplot2 ggsave
#' @importFrom showtext showtext_opts
#'
#' @param filename File name to create on disk.
#' @param plot ggplot2 object, plot to save. Defaults to last plot.
#' @param dpi Plot resolution. Also accepts a string input: "retina" (320),
#' "print" (300), or "screen" (72). Applies only to raster (png, jpeg and tiff) output types.
#' @param ... extra param to passe to `ggsave`.
#'
#' @examples
#'
#' \dontrun{
#' library(tidyverse)
#' library(unhcrthemes)
#'
#' file <- tempfile("unhcrthemes_save", fileext = ".png")
#' cars |>
#'   ggplot(aes(speed, dist)) +
#'   geom_point() +
#'   theme_unhcr() |>
#'   unhcr_save(file)
#' }
#'
#' @export
unhcr_save <- function(plot = ggplot2::last_plot(),
                       filename,
                       dpi = 300,
                       ...) {

  stopifnot(is.numeric(dpi))
  op <- showtext_opts(dpi = dpi)

  ggplot2::ggsave(filename = filename,
                  plot = plot,
                  dpi = dpi,
                  ...)

  showtext_opts(op)
  invisible()
}
