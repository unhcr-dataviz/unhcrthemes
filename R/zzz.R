#' @noRd
lato_exists <- function() {
  sys_fonts <- systemfonts::system_fonts()
  any(grepl("lato", sys_fonts$family, ignore.case = TRUE))
}

.onLoad <- function(libname, pkgname) {
  font_dir <- system.file("fonts", "Lato",
                          package = "unhcrthemes")

  if (!lato_exists())  {
    systemfonts::register_font(
      name = "Lato",
      plain = file.path(font_dir, "Lato-Regular.ttf"),
      italic = file.path(font_dir, "Lato-Italic.ttf"),
      bold = file.path(font_dir, "Lato-Bold.ttf"),
      bolditalic = file.path(font_dir,
                             "Lato-BoldItalic.ttf"))
    pattern <- "(?i)lato-(regular|bold|italic|bolditalic)"
    suppressMessages(extrafont::font_import(font_dir,
                                            pattern = pattern,
                                            prompt = FALSE))
    suppressMessages(extrafont::loadfonts())
  } else {
    font_dir <- systemfonts::system_fonts()
    b <- grepl("lato", font_dir$family, ignore.case = TRUE)
    font_dir <- font_dir[b, ]
    font_dir <- unique(dirname(font_dir$path))
    pattern <- "(?i)lato-(regular|bold|italic|bolditalic)"
    suppressMessages(extrafont::font_import(font_dir,
                                            pattern = pattern,
                                            prompt = FALSE))
    suppressMessages(extrafont::loadfonts())
  }
  update_geom_font_defaults()
}

.onAttach <- function(libname, pkgname) {
  if (!lato_exists()) {
    packageStartupMessage("Lato font is missing, please install it!")
  }
}
