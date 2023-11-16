.onLoad <- function(libname, pkgname) {
  update_geom_font_defaults()
}

.onAttach <- function(libname, pkgname) {
  if (!lato_installed()) {
    packageStartupMessage("Lato font is missing, please install it!")
  }
}
