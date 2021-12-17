#' UNHCR [ggplot2] theme for maps following brand recommendations
#'
#' \code{theme_unhcr} provides a basic \bold{UNHCR} theme
#' to use with map made using \bold{ggplot2}.
#'
#' @rdname theme_unhcr
#'
#' @param font_size Base font size
#' @param font_family Base font family, default "Lato"
#' @param line_size Base line size for axis. Gridlines are line_size/2
#' @param rel_small Relative size of small text (e.g., axis labels)
#' @param rel_tiny Relative size of tiny text (e.g., caption)
#' @param rel_large Relative size of large text (e.g., title)
#' @param legend_title Turn on and off title of the legend, default FALSE.
#'
#' @return The theme style
#' @importFrom ggplot2 %+replace%
#' @importFrom grid unit
#' @export
theme_unhcr_map <- function (font_size = 14, font_family = "Lato", line_size = 0.5,
    rel_small = 12/14, rel_tiny = 11/14, rel_large = 16/14, legend_title = FALSE) {
    theme_unhcr(font_size = font_size, font_family = font_family,
                line_size = line_size, rel_small = rel_small,
                rel_tiny = rel_tiny, rel_large = rel_large,
                grid = FALSE, axis = FALSE, ticks = FALSE) %+replace%
      theme(line = element_blank(),
            rect = element_blank(), axis.line = element_blank(),
            axis.line.x = NULL, axis.line.y = NULL, axis.text = element_blank(),
            axis.text.x = NULL, axis.text.x.top = NULL, axis.text.y = NULL,
            axis.text.y.right = NULL, axis.ticks = element_blank(),
            axis.ticks.length = unit(0, "pt"), axis.title = element_blank(),
            axis.title.x = NULL, axis.title.x.top = NULL, axis.title.y = NULL,
            axis.title.y.right = NULL, complete = TRUE)
}
