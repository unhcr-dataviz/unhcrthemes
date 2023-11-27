#' UNHCR [ggplot2] theme
#'
#' \code{theme_unhcr} provides a basic \bold{UNHCR} theme
#' to use in \bold{ggplot2} commands.
#'
#' @rdname theme_unhcr
#'
#' @param font_family Base font family "Lato".
#' You need to have "Lato" font installed on your device in order to use it.
#' @param font_size Base font size in pt. Default to 12 pts.
#' @param plot_title_size Plot title font size. Default to `font_size` * 1.35.
#' @param plot_title_margin Plot title bottom margin. Default to `font_size`.
#' @param subtitle_size Plot subtitle font size. Default to `font_size`.
#' @param subtitle_margin Plot subtitle bottom margin. Default to `font_size` * 1.5.
#' @param strip_text_size Facet label font size. Default to `font_size` * 0.9.
#' @param strip_text_face Facet label font face. Default to "bold".
#' @param strip_text_just Facet label justification. Default to 0.
#' @param caption_size Caption font size. Default to `font_size` * 0.7.
#' @param caption_margin Caption top margin. Default to `font_size`.
#' @param axis_text Logical `TRUE`/`FALSE` or `xy`. Turn on and off axis label.
#' Use `x` or `y` to have only the correspondent active. Default to `TRUE`.
#' @param axis_text_size Axis label font size. Default to `font_size` * 0.9.
#' @param axis_title Logical `TRUE`/`FALSE` or `xy`. Turn on and off axis title.
#' Use `x` or `y` to have only the correspondent active. Default to `TRUE`.
#' @param axis_title_size Axis title font size. Default to `font_size` * 0.9.
#' @param axis Logical `TRUE`/`FALSE` or `xy`. Turn on and off axis.
#' Use `x` or `y` to have only the correspondent axis active. Don't forget to review
#' the `expand` argument of the `scale_x_*`/`scale_y_*` to avoid spacing between
#' the axis and the baseline of the plot. Default to `FALSE`.
#' @param axis_ticks Logical `TRUE`/`FALSE` or `xy`. Turn on and off axis ticks.
#' Use `x` or `y` to have only the correspondent axis ticks active. Default to `FALSE`.
#' @param grid Logical `TRUE`/`FALSE` or a combination of `X` or `x` and `Y` or y`.
#' Turn on and off panel grids. Use `X` or `Y` for major grids,
#' and `x` or `y` for minor grid.  Default to `XY`.
#' @param legend Logical `TRUE`/`FALSE`. Turn on and off the legend.
#' Default to `TRUE`.
#' @param legend_text_size Legend key font size. Default to `font_size` * 0.9.
#' @param legend_title Logical `TRUE`/`FALSE`. Turn on and off the legend title.
#' Default to `FALSE`.
#' @param legend_title_size Legend title font size. Default to `font_size` * 0.9.
#' @param plot_margin Plot margin (specify with `ggplot2::margin()`).
#' Default to `ggplot2::margin(font_size, font_size, font_size, font_size)`.
#' @param plot_background Plot background.
#' Put "transparent" for no background color. Default to "white".
#' @param void Logical `TRUE`/`FALSE`. If `TRUE`, all grid lines, ticks
#' and axes are removed. Default to `FALSE`.
#'
#' @return A ggplot2 theme object, the theme style.
#' @import ggplot2
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#'
#' data(mpg, package = "ggplot2")
#'
#' ggplot(mpg, aes(displ, hwy)) +
#'   geom_point() +
#'   theme_unhcr()
#' }
#'
#' @export
theme_unhcr <- function(
    font_family = if (lato_installed()) "Lato" else "sans",
    font_size = 12,
    plot_title_size = rel(1.35),
    plot_title_margin = font_size,
    subtitle_size = font_size,
    subtitle_margin = font_size * 1.5,
    strip_text_size = rel(0.9),
    strip_text_face = "bold",
    strip_text_just = 0,
    caption_size = rel(0.7),
    caption_margin = font_size,
    axis_text = TRUE,
    axis_text_size = rel(0.9),
    axis_title = TRUE,
    axis_title_size = rel(0.9),
    axis = FALSE,
    axis_ticks = FALSE,
    grid = "XY",
    legend = TRUE,
    legend_text_size = rel(0.9),
    legend_title = FALSE,
    legend_title_size = rel(0.9),
    plot_margin = margin(font_size, font_size, font_size, font_size),
    plot_background = "#ffffff",
    void = FALSE) {
  # colors
  dark_text <- "#1a1a1a"
  light_text <- "#666666"
  grid_col <- "#cccccc"

  # base theme override
  ret <- theme_minimal(base_family = font_family, base_size = font_size)

  ret <- ret + theme(text = element_text(
    family = font_family,
    color = dark_text
  ))

  # title
  ret <- ret + theme(plot.title = ggtext::element_textbox_simple(
    family = font_family,
    size = plot_title_size,
    face = "bold",
    color = "#000000",
    hjust = 0,
    lineheight = 1.2,
    margin = margin(0, 0, plot_title_margin, 0, "pt")
  ))
  ret <- ret + theme(plot.title.position = "plot")

  # subtitle
  ret <- ret + theme(plot.subtitle = ggtext::element_textbox_simple(
    family = font_family,
    size = subtitle_size,
    face = "plain",
    color = dark_text,
    hjust = 0,
    lineheight = 1.2,
    margin = margin(0, 0, subtitle_margin, 0, "pt")
  ))

  # strip
  ret <- ret + theme(strip.text = element_text(
    family = font_family,
    size = strip_text_size,
    face = strip_text_face,
    color = dark_text,
    hjust = strip_text_just
  ))

  # caption
  ret <- ret + theme(plot.caption = ggtext::element_textbox_simple(
    family = font_family,
    size = caption_size,
    face = "plain",
    color = light_text,
    hjust = 0,
    lineheight = 1.1,
    margin = margin(caption_margin, 0, 0, 0, "pt"),
  ))
  ret <- ret + theme(plot.caption.position = "plot")

  # axis text
  if (inherits(axis_text, "character") | axis_text == TRUE) {
    ret <- ret + theme(axis.text = element_text(
      size = axis_text_size,
      color = dark_text
    ))
    if (inherits(axis_text, "character")) {
      axis_text <- tolower(axis_text)
      if (regexpr("x", axis_text)[1] < 0) {
        ret <- ret + theme(axis.text.x = element_blank())
      } else {
        ret <- ret + theme(axis.text.x = element_text(
          size = axis_text_size,
          color = dark_text
        ))
      }
      if (regexpr("y", axis_text)[1] < 0) {
        ret <- ret + theme(axis.text.y = element_blank())
      } else {
        ret <- ret + theme(axis.text.y = element_text(
          size = axis_text_size,
          color = dark_text
        ))
      }
    } else {
      ret <- ret + theme(axis.text.x = element_text(
        size = axis_text_size,
        color = dark_text
      ))
      ret <- ret + theme(axis.text.y = element_text(
        size = axis_text_size,
        color = dark_text
      ))
    }
  } else {
    ret <- ret + theme(axis.text = element_blank())
  }

  # axis title
  if (inherits(axis_title, "character") | axis_title == TRUE) {
    ret <- ret + theme(axis.title = element_text(
      size = axis_title_size,
      color = light_text
    ))
    if (inherits(axis_title, "character")) {
      axis_title <- tolower(axis_title)
      if (regexpr("x", axis_title)[1] < 0) {
        ret <- ret + theme(axis.title.x = element_blank())
      } else {
        ret <- ret + theme(axis.title.x = element_text(
          size = axis_title_size,
          color = light_text
        ))
      }
      if (regexpr("y", axis_title)[1] < 0) {
        ret <- ret + theme(axis.title.y = element_blank())
      } else {
        ret <- ret + theme(axis.title.y = element_text(
          size = axis_title_size,
          color = light_text
        ))
      }
    } else {
      ret <- ret + theme(axis.title.x = element_text(
        size = axis_title_size,
        color = light_text
      ))
      ret <- ret + theme(axis.title.y = element_text(
        size = axis_title_size,
        color = light_text
      ))
    }
  } else {
    ret <- ret + theme(axis.title = element_blank())
  }

  # void
  if (void) {
    ret <- ret + theme(
      line = element_blank(),
      rect = element_blank(),
      axis.line = element_blank(),
      axis.line.x = NULL,
      axis.line.y = NULL,
      axis.text = element_blank(),
      axis.text.x = NULL,
      axis.text.x.top = NULL,
      axis.text.y = NULL,
      axis.text.y.right = NULL,
      axis.ticks = element_blank(),
      axis.ticks.length = grid::unit(0, "pt"),
      axis.title = element_blank(),
      axis.title.x = NULL,
      axis.title.x.top = NULL,
      axis.title.y = NULL,
      axis.title.y.right = NULL
    )
  } else {
    # axis line
    if (inherits(axis, "character") | axis == TRUE) {
      ret <- ret + theme(axis.line = element_line(
        color = dark_text,
        linewidth = rel(0.8)
      ))
      if (inherits(axis, "character")) {
        axis <- tolower(axis)
        if (regexpr("x", axis)[1] < 0) {
          ret <- ret + theme(axis.line.x = element_blank())
        } else {
          ret <- ret + theme(axis.line.x = element_line(
            color = dark_text
          ))
        }
        if (regexpr("y", axis)[1] < 0) {
          ret <- ret + theme(axis.line.y = element_blank())
        } else {
          ret <- ret + theme(axis.line.y = element_line(
            color = dark_text
          ))
        }
      } else {
        ret <- ret + theme(axis.line.x = element_line(
          color = dark_text
        ))
        ret <- ret + theme(axis.line.y = element_line(
          color = dark_text
        ))
      }
    } else {
      ret <- ret + theme(axis.line = element_blank())
    }

    # axis ticks
    if (inherits(axis_ticks, "character") | axis_ticks == TRUE) {
      ret <- ret + theme(axis.ticks.length = grid::unit(
        font_size / 2, "pt"
      ))
      ret <- ret + theme(axis.ticks = element_line(
        color = grid_col,
        linewidth = rel(.6)
      ))
      if (inherits(axis_ticks, "character")) {
        axis_ticks <- tolower(axis_ticks)
        if (regexpr("x", axis_ticks)[1] < 0) {
          ret <- ret + theme(axis.ticks.x = element_blank())
        } else {
          ret <- ret + theme(axis.ticks.x = element_line(
            color = grid_col
          ))
        }
        if (regexpr("y", axis_ticks)[1] < 0) {
          ret <- ret + theme(axis.ticks.y = element_blank())
        } else {
          ret <- ret + theme(axis.ticks.y = element_line(
            color = grid_col
          ))
        }
      } else {
        ret <- ret + theme(axis.ticks.x = element_line(
          color = grid_col
        ))
        ret <- ret + theme(axis.ticks.y = element_line(
          color = grid_col
        ))
      }
    } else {
      ret <- ret + theme(axis.ticks = element_blank())
    }

    # grid
    if (inherits(grid, "character") | grid == TRUE) {
      ret <- ret + theme(panel.grid = element_line(
        color = grid_col,
        linewidth = rel(.6)
      ))
      ret <- ret + theme(panel.grid.major = element_line(
        color = grid_col
      ))
      ret <- ret + theme(panel.grid.minor = element_line(
        color = grid_col
      ))

      if (inherits(grid, "character")) {
        if (regexpr("X", grid)[1] < 0) {
          ret <- ret + theme(panel.grid.major.x = element_blank())
        }
        if (regexpr("Y", grid)[1] < 0) {
          ret <- ret + theme(panel.grid.major.y = element_blank())
        }
        if (regexpr("x", grid)[1] < 0) {
          ret <- ret + theme(panel.grid.minor.x = element_blank())
        }
        if (regexpr("y", grid)[1] < 0) {
          ret <- ret + theme(panel.grid.minor.y = element_blank())
        }
      }
    } else {
      ret <- ret + theme(panel.grid = element_blank())
    }
  }

  # legend
  if (!legend) {
    ret <- ret + theme(legend.position = "none")
  } else {
    ret <- ret + theme(legend.text = element_text(
      size = legend_text_size,
      color = dark_text
    ))
    ret <- ret + theme(legend.position = "top")
    ret <- ret + theme(legend.justification = 0)
    if (!legend_title) {
      ret <- ret + theme(legend.title = element_blank())
    } else {
      ret <- ret + theme(legend.title = element_text(
        size = legend_title_size,
        color = dark_text,
        face = "bold"
      ))
    }
  }

  # tag
  ret <- ret + theme(plot.tag = element_text(
    size = font_size,
    color = "#0072bc",
    hjust = 0,
    vjust = 1
  ))
  ret <- ret + theme(plot.tag.position = c(0, 1))

  # margin
  ret <- ret + theme(plot.margin = plot_margin)

  # background
  ret <- ret + theme(plot.background = element_rect(
    fill = plot_background,
    color = plot_background
  ))

  ret
}

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#' @importFrom ggrepel GeomTextRepel GeomLabelRepel
#'
#' @param family Font family, default "Lato".
#' @param face Font face, default "plain".
#' @param size font size in mm.
#' @param color Font color, default "#1a1a1a".
#'
#' @noRd
update_geom_font_defaults <- function(
    family = if (lato_installed()) "Lato" else "sans",
    face = "plain",
    size = 3.5,
    color = "#1a1a1a") {
  ggplot2::update_geom_defaults(
    "text",
    list(family = family, face = face, size = size, color = color)
  )
  ggplot2::update_geom_defaults(
    "label",
    list(family = family, face = face, size = size, color = color)
  )
  ggplot2::update_geom_defaults(
    "text_repel",
    list(family = family, face = face, size = size, color = color)
  )
  ggplot2::update_geom_defaults(
    "label_repel",
    list(family = family, face = face, size = size, color = color)
  )
}
