#' UNHCR [ggplot2] theme following brand recommendations
#'
#' \code{theme_unhcr} provides a basic \bold{UNHCR} theme
#' to use in \bold{ggplot2} commands.
#'
#' @param base_family Base font family, default "Lato"
#' @param base_size Base font size
#' @param legend_position Position of the legend, default "top"
#' @param plot_margin Margin around the whole plot
#' @param grid Turn on and off the grids. "X" or "Y" for major and "x" or "y" for minor
#' @param axis_title Turn on and off axis titles. Use "X" or "Y" to have only the correspondent active
#' @param axis Turn on and off axis. Use "X" or "Y" to have only the correspondent active
#' @param ticks Turn on and off tick marks
#'
#' @import ggplot2 showtext utils
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(showtext)
#'
#' font_add("Lato", regular = "Lato-Regular.ttf", bold = "Lato-Bold.ttf", italic = "Lato-Italic.ttf")
#' showtext_auto()
#'
#' # Simple scatterplot example
#'
#' ggplot(datasets::iris, aes(x = Petal.Length, y = Petal.Width)) +
#'   geom_point() +
#'   labs(
#'     x = "Petal length", y = "Petal width",
#'     title = "Iris data ggplot2 scatterplot example",
#'     subtitle = "Just a simple plot to show the basic style of theme_unhcr",
#'     caption = "Data from datasets::iris"
#'   ) +
#'   theme_unhcr()
#' }
#'
theme_unhcr <- function(base_family = "Lato",
                        base_size = 10.5,
                        legend_position = "top",
                        plot_margin = ggplot2::margin(30, 30, 30, 30),
                        grid = TRUE,
                        axis_title = TRUE,
                        axis = FALSE,
                        ticks = FALSE) {

  # Text color
  black_text <- "#000000"
  dark_text <- "#191919"
  medium_text <- "#4b4b4b"
  light_text <- "#808080"

  # Line color
  dark_line <- "#191919"
  light_line <- "#d8d8d8"

  ret <- ggplot2::theme_minimal(base_family = base_family, base_size = base_size)

  ret <- ret + ggplot2::theme(legend.background = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(legend.key = ggplot2::element_blank())

  if (inherits(grid, "character") | grid == TRUE) {
    ret <- ret + ggplot2::theme(panel.grid = ggplot2::element_line(color = light_line, size = 0.5))
    ret <- ret + ggplot2::theme(panel.grid.major = ggplot2::element_line(color = light_line, size = 0.5))
    ret <- ret + ggplot2::theme(panel.grid.minor = ggplot2::element_line(color = light_line, size = 0.25))

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + ggplot2::theme(panel.grid.major.x = ggplot2::element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + ggplot2::theme(panel.grid.major.y = ggplot2::element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + ggplot2::theme(panel.grid.minor.x = ggplot2::element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + ggplot2::theme(panel.grid.minor.y = ggplot2::element_blank())
    }
  } else {
    ret <- ret + ggplot2::theme(panel.grid = ggplot2::element_blank())
  }

  if (inherits(axis_title, "character") | axis_title == TRUE) {
    ret <- ret + ggplot2::theme(axis.title = ggplot2::element_text(size = (base_size * 8.5 / 10.5), color = medium_text))
    if (inherits(axis_title, "character")) {
      axis_title <- tolower(axis_title)
      if (regexpr("x", axis_title)[1] < 0) {
        ret <- ret + ggplot2::theme(axis.title.x = ggplot2::element_blank())
      } else {
        ret <- ret + ggplot2::theme(axis.title.x = ggplot2::element_text(hjust = 1, size = (base_size * 8.5 / 10.5), color = medium_text))
      }
      if (regexpr("y", axis_title)[1] < 0) {
        ret <- ret + ggplot2::theme(axis.title.y = ggplot2::element_blank())
      } else {
        ret <- ret + ggplot2::theme(axis.title.y = ggplot2::element_text(hjust = 1, size = (base_size * 8.5 / 10.5), color = medium_text))
      }
    } else {
      ret <- ret + ggplot2::theme(axis.title.x = ggplot2::element_text(hjust = 1, size = (base_size * 8.5 / 10.5), color = medium_text))
      ret <- ret + ggplot2::theme(axis.title.y = ggplot2::element_text(hjust = 1, size = (base_size * 8.5 / 10.5), color = medium_text))
    }
  } else {
    ret <- ret + ggplot2::theme(axis.title = ggplot2::element_blank())
  }

  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + ggplot2::theme(axis.line = ggplot2::element_line(color = dark_line, size = 0.75))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + ggplot2::theme(axis.line.x = ggplot2::element_blank())
      } else {
        ret <- ret + ggplot2::theme(axis.line.x = ggplot2::element_line(color = dark_line, size = 0.75))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + ggplot2::theme(axis.line.y = ggplot2::element_blank())
      } else {
        ret <- ret + ggplot2::theme(axis.line.y = ggplot2::element_line(color = dark_line, size = 0.75))
      }
    } else {
      ret <- ret + ggplot2::theme(axis.line.x = ggplot2::element_line(color = dark_line, size = 0.75))
      ret <- ret + ggplot2::theme(axis.line.y = ggplot2::element_line(color = dark_line, size = 0.75))
    }
  } else {
    ret <- ret + ggplot2::theme(axis.line = ggplot2::element_blank())
  }

  if (!ticks) {
    ret <- ret + ggplot2::theme(axis.ticks = ggplot2::element_blank())
    ret <- ret + ggplot2::theme(axis.ticks.x = ggplot2::element_blank())
    ret <- ret + ggplot2::theme(axis.ticks.y = ggplot2::element_blank())
  } else {
    ret <- ret + ggplot2::theme(axis.ticks = ggplot2::element_line(size = 0.15))
    ret <- ret + ggplot2::theme(axis.ticks.x = ggplot2::element_line(size = 0.15))
    ret <- ret + ggplot2::theme(axis.ticks.y = ggplot2::element_line(size = 0.15))
    ret <- ret + ggplot2::theme(axis.ticks.length = grid::unit(5, "pt"))
  }

  ret <- ret + ggplot2::theme(axis.text.x = ggplot2::element_text(
    size = base_size,
    color = dark_text
  ))
  ret <- ret + ggplot2::theme(axis.text.y = ggplot2::element_text(
    size = base_size,
    color = dark_text
  ))
  ret <- ret + ggplot2::theme(axis.title.y.right = ggplot2::element_text(
    hjust = 1,
    size = (base_size * 8.5 / 10.5),
    angle = 90,
    color = medium_text
  ))
  ret <- ret + ggplot2::theme(strip.text = ggplot2::element_text(
    hjust = 0,
    size = (base_size * 11 / 10.5),
    color = dark_text
  ))
  ret <- ret + ggplot2::theme(panel.spacing = grid::unit(2, "lines"))
  ret <- ret + ggplot2::theme(plot.title = ggplot2::element_text(
    hjust = 0,
    size = (base_size * 16 / 10.5),
    margin = ggplot2::margin(b = 10),
    face = "bold",
    color = black_text
  ))
  ret <- ret + ggplot2::theme(plot.subtitle = ggplot2::element_text(
    hjust = 0,
    size = (base_size * 11 / 10.5),
    margin = ggplot2::margin(b = 15),
    color = dark_text
  ))
  ret <- ret + ggplot2::theme(plot.caption = ggplot2::element_text(
    hjust = 0,
    size = (base_size * 8 / 10.5),
    margin = ggplot2::margin(t = 10),
    color = light_text
  ))
  ret <- ret + ggplot2::theme(legend.title = ggplot2::element_text(
    hjust = 0,
    size = (base_size * 9.5 / 10.5),
    color = dark_text
  ))
  ret <- ret + ggplot2::theme(legend.text = ggplot2::element_text(
    hjust = 0,
    size = (base_size * 9 / 10.5),
    color = medium_text
  ))
  ret <- ret + ggplot2::theme(plot.title.position = "plot")
  ret <- ret + ggplot2::theme(plot.caption.position = "plot")
  ret <- ret + ggplot2::theme(legend.position = legend_position)
  ret <- ret + ggplot2::theme(legend.direction = "horizontal")
  ret <- ret + ggplot2::theme(legend.justification = 0.5)
  ret <- ret + ggplot2::theme(plot.margin = plot_margin)

  ret
}

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#'
#' @param family Font family, default "Lato"
#' @param face Font face, default "plain"
#' @param size Size
#' @param color Font color, default "#191919"
#'
#' @export
update_geom_font_defaults <- function(family = "Lato", face = "plain", size = 3.5,
                                      color = "#191919") {
  ggplot2::update_geom_defaults("text", list(family = family, face = face, size = size, color = color))
  ggplot2::update_geom_defaults("label", list(family = family, face = face, size = size, color = color))
}
