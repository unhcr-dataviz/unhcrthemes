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

#' @noRd
binned_pal <- function(palette) {
  function(x) {
    palette(length(x))
  }
}
