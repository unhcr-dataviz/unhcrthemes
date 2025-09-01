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

#' Import Lato font
#'
#' Import Lato font for use in R graphic devices
#'
#' @importFrom systemfonts register_font
#'
#' @return No return value, called for side effects
#' @export
import_lato <- function() {
  if (!lato_installed()) {
    font_dir <- system.file("fonts", "Lato", package = "unhcrthemes")
    systemfonts::register_font(
      name = "Lato",
      plain = file.path(font_dir, "Lato-Regular.ttf"),
      italic = file.path(font_dir, "Lato-Italic.ttf"),
      bold = file.path(font_dir, "Lato-Bold.ttf"),
      bolditalic = file.path(
        font_dir,
        "Lato-BoldItalic.ttf"
      )
    )
  }
  update_geom_font_defaults()
}
