.onLoad <- function(libname, pkgname) {
  font_dir <- system.file("fonts", package = "unhcrthemes")
  font_dir <- file.path(font_dir, "Lato")

  sys_fonts <- systemfonts::system_fonts()
  if (!any(grepl("lato", sys_fonts$family, ignore.case = TRUE))) {
    warnings("Lato font is missing, please install it!",
             call. = FALSE)
    systemfonts::register_font(name = "Lato",
                               plain = file.path(font_dir, "Lato-Regular.ttf"),
                               italic = file.path(font_dir, "Lato-Italic.ttf"),
                               bold = file.path(font_dir, "Lato-Bold.ttf"),
                               bolditalic = file.path(font_dir,
                                                      "Lato-BoldItalic.ttf"))

  }
  update_geom_font_defaults()
}
