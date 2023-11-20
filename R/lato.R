#' Check if Lato font is installed in the system
#'
#' Verify if you have Lato font installed in your system
#'
#' @importFrom systemfonts system_fonts
#'
#' @returns TRUE if Lato is installed in the system
#' @export
lato_installed <- function() {
  sys_fonts <- systemfonts::system_fonts()
  any(grepl("lato", sys_fonts$family, ignore.case = TRUE))
}

#' Check if Lato font is registered through \code{extrafont}
#'
#' Verify if Lato is registered through \code{extrafont}
#'
#' @importFrom systemfonts system_fonts
#' @importFrom extrafont fonts
#'
#' @returns TRUE if Lato is registered
#' @export
lato_registered <- function() {
  any(grepl("lato", extrafont::fonts(), ignore.case = TRUE))
}

#' Import Lato font
#'
#' Import Lato font for use in R graphic devices
#'
#' @importFrom systemfonts register_font
#' @importFrom extrafont font_import
#'
#' @return No return value, called for side effects
#' @export
import_lato <- function() {
  if (!lato_installed()) {
    font_dir <- system.file("fonts", "Lato",
      package = "unhcrthemes"
    )
    register_font(
      name = "Lato",
      plain = file.path(font_dir, "Lato-Regular.ttf"),
      italic = file.path(font_dir, "Lato-Italic.ttf"),
      bold = file.path(font_dir, "Lato-Bold.ttf"),
      bolditalic = file.path(
        font_dir,
        "Lato-BoldItalic.ttf"
      )
    )
    pattern <- "(?i)lato-(regular|bold|italic|bolditalic)"
    suppressMessages(extrafont::font_import(font_dir,
      pattern = pattern,
      prompt = FALSE
    ))
    suppressMessages(extrafont::loadfonts())
  } else {
    font_dir <- systemfonts::system_fonts()
    b <- grepl("lato", font_dir$family, ignore.case = TRUE)
    font_dir <- font_dir[b, ]
    font_dir <- unique(dirname(font_dir$path))
    pattern <- "(?i)lato-(regular|bold|italic|bolditalic)"
    suppressMessages(extrafont::font_import(font_dir,
      pattern = pattern,
      prompt = FALSE
    ))
    suppressMessages(extrafont::loadfonts())
  }
  update_geom_font_defaults()
}
