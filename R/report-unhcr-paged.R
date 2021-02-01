#' @name unhcr_paged
#' @rdname unhcr_paged
#'
#' @title UNHCR Paged Report
#' @description Create a paged HTML report with UNHCR Branding that can be printed as PDF
#'
#' @param ... Arguments passed to
#' \code{pagedown::\link[pagedown]{html_paged}}.
#'
#' @return An R Markdown output format.
#' @import pagedown
#' @export
unhcr_paged = function(...) {
  pagedown::html_paged(...)
}
