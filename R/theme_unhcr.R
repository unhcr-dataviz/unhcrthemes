theme_unhcr <- function(base_family="Lato",
                        base_size = 10.5,
                        legend_position = "top",
                        plot_margin = margin(30, 30, 30, 30),
                        grid = TRUE,
                        axis_title = TRUE,
                        axis = FALSE,
                        ticks = FALSE) {

  # Text color
  black_text <- "#000000"
  dark_text <-  "#191919"
  medium_text <- "#4b4b4b"
  light_text  <- "#808080"

  # Line color
  dark_line <- "#191919"
  light_line <- "#d8d8d8"

  ret <- ggplot2::theme_minimal(base_family=base_family, base_size=base_size)

  ret <- ret + theme(legend.background=element_blank())
  ret <- ret + theme(legend.key=element_blank())

  if (inherits(grid, "character") | grid == TRUE) {

    ret <- ret + theme(panel.grid=element_line(color=light_line, size=0.5))
    ret <- ret + theme(panel.grid.major=element_line(color=light_line, size=0.5))
    ret <- ret + theme(panel.grid.minor=element_line(color=light_line, size=0.25))

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y=element_blank())
    }

  } else {
    ret <- ret + theme(panel.grid=element_blank())
  }

  if (inherits(axis_title, "character") | axis_title == TRUE) {
    ret <- ret + theme(axis.title=element_text(size=(base_size*8.5/10.5), color = medium_text))
    if (inherits(axis_title, "character")) {
      axis_title <- tolower(axis_title)
      if (regexpr("x", axis_title)[1] < 0) {
        ret <- ret + theme(axis.title.x=element_blank())
      } else {
        ret <- ret + theme(axis.title.x=element_text(hjust=1, size=(base_size*8.5/10.5), color = medium_text))
      }
      if (regexpr("y", axis_title)[1] < 0) {
        ret <- ret + theme(axis.title.y=element_blank())
      } else {
        ret <- ret + theme(axis.title.y=element_text(hjust=1,size=(base_size*8.5/10.5),color = medium_text))
      }
    } else {
      ret <- ret + theme(axis.title.x=element_text(hjust=1, size=(base_size*8.5/10.5), color = medium_text))
      ret <- ret + theme(axis.title.y=element_text(hjust=1, size=(base_size*8.5/10.5), color = medium_text))
    }
  } else {
    ret <- ret + theme(axis.title=element_blank())
  }

  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + theme(axis.line=element_line(color=dark_line, size=0.75))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(axis.line.x=element_blank())
      } else {
        ret <- ret + theme(axis.line.x=element_line(color=dark_line, size=0.75))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(axis.line.y=element_blank())
      } else {
        ret <- ret + theme(axis.line.y=element_line(color=dark_line, size=0.75))
      }
    } else {
      ret <- ret + theme(axis.line.x=element_line(color=dark_line, size=0.75))
      ret <- ret + theme(axis.line.y=element_line(color=dark_line, size=0.75))
    }
  } else {
    ret <- ret + theme(axis.line=element_blank())
  }

  if (!ticks) {
    ret <- ret + theme(axis.ticks = element_blank())
    ret <- ret + theme(axis.ticks.x = element_blank())
    ret <- ret + theme(axis.ticks.y = element_blank())
  } else {
    ret <- ret + theme(axis.ticks = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.x = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.y = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
  }

  ret <- ret + theme(axis.text.x=element_text(size=base_size,
                                              color = dark_text))
  ret <- ret + theme(axis.text.y=element_text(size=base_size,
                                              color = dark_text))
  ret <- ret + theme(axis.title.y.right=element_text(hjust=1,
                                                     size=(base_size*8.5/10.5),
                                                     angle=90,
                                                     color = medium_text))
  ret <- ret + theme(strip.text=element_text(hjust=0,
                                             size=(base_size*11/10.5),
                                             color = dark_text))
  ret <- ret + theme(panel.spacing=grid::unit(2, "lines"))
  ret <- ret + theme(plot.title=element_text(hjust=0,
                                             size=(base_size*16/10.5),
                                             margin=margin(b=10),
                                             face="bold",
                                             color = black_text))
  ret <- ret + theme(plot.subtitle=element_text(hjust=0,
                                                size=(base_size*11/10.5),
                                                margin=margin(b=15),
                                                color = dark_text))
  ret <- ret + theme(plot.caption=element_text(hjust=0,
                                               size=(base_size*8/10.5),
                                               margin=margin(t=10),
                                               color = light_text))
  ret <- ret + theme(legend.title = element_text(hjust=0,
                                                 size=(base_size*9.5/10.5),
                                                 color = dark_text))
  ret <- ret + theme(legend.text = element_text(hjust=0,
                                                size=(base_size*9/10.5),
                                                color = medium_text))
  ret <- ret + theme(plot.title.position = "plot")
  ret <- ret + theme(plot.caption.position = "plot")
  ret <- ret + theme(legend.position = legend_position)
  ret <- ret + theme(legend.direction = "horizontal")
  ret <- ret + theme(legend.justification = 0.5)
  ret <- ret + theme(plot.margin=plot_margin)

  ret

}
