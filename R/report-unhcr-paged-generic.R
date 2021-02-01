#' @name unhcr_page_generic
#' @rdname unhcr_page_generic
#'
#' @title UNHCR Generic Paged Report
#' @description Create a generic paged HTML report with UNHCR Branding that can be printed as PDF
#'
#' @param ... Arguments passed to
#' \code{pagedown::\link[pagedown]{html_paged}}.
#'
#' @return An R Markdown output format.
#' @import pagedown
#' @export
unhcr_page_generic = function(...) {
  pagedown::html_paged(
    css = c('unhcr-generic-fonts.css', 'unhcr-generic-page.css', 'unhcr-generic.css'),
    ...)
}
