#' @importFrom ggplot2 %+replace% is.theme
#' @noRd
add_gg_theme <- function(plot, object) {
  if (ggplot2::is.theme(plot$theme)) {
    plot$theme <- plot$theme %+replace% object
  } else {
    plot$theme <- object
  }
  plot
}