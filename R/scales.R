#' UNHCR color scales
#'
#' @param type One of \"sequential\", \"diverging\" or \"qualitative\"
#' @param palette If a string, will use that named palette. If a number, will
#'   index into the list of palettes of appropriate `type`
#' @param direction Sets the order of colors in the scale. If 1, the default,
#'   colors are as output by [unhcr_pal()]. If -1, the
#'   order of colors is reversed
#' @inheritParams scales::gradient_n_pal
#' @inheritParams ggplot2::continuous_scale
#' @inheritParams ggplot2::discrete_scale
#' @param ... Other arguments passed on to [discrete_scale()] or
#' [continuous_scale()] to control name, limits, breaks, labels and so forth
#'
#' @importFrom ggplot2 discrete_scale continuous_scale
#' @importFrom scales gradient_n_pal
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(msleep, aes(vore, sleep_total, fill = vore)) +
#'         geom_boxplot() +
#'         scale_fill_unhcr_d(palette = 1, direction = -1)
#'
#' @rdname unhcr_scale
#' @export
#'
scale_color_unhcr_c <- function(..., type = "sequential",
                                palette = 1,
                                direction = 1,
                                na.value = "#E9E9E9", guide = "colourbar") {
  continuous_scale("colour",
                   "unhcr_continuous",
                   gradient_n_pal(unhcr_pal_scale(type,
                                                  palette,
                                                  direction)(256)),
                   na.value = na.value,
                   guide = guide,
                   ...)
}

#' @rdname unhcr_scale
#' @export
scale_color_unhcr_d <- function(..., type = "qualitative",
                                palette = 1, direction = 1,
                                na.value = "#E9E9E9") {
  discrete_scale("colour",
                 "unhcr_discrete",
                 unhcr_pal_scale(type, palette, direction),
                 na.value	= na.value,
                 ...)
}


#' @rdname unhcr_scale
#' @aliases scale_color_unhcr_c
#' @export
scale_colour_unhcr_c <- scale_color_unhcr_c

#' @rdname unhcr_scale
#' @aliases scale_color_unhcr_d
#' @export
scale_colour_unhcr_d <- scale_color_unhcr_d

#' @rdname unhcr_scale
#' @export
scale_fill_unhcr_c <- function(..., type = "sequential",
                               palette = 1, direction = 1,
                               na.value = "#E9E9E9", guide = "colourbar") {
  continuous_scale("fill",
                   "unhcr_continuous",
                   gradient_n_pal(unhcr_pal_scale(type,
                                                  palette,
                                                  direction)(256)),
                   na.value = na.value,
                   guide = guide,
                   ...)
}

#' @rdname unhcr_scale
#' @export
scale_fill_unhcr_d <- function(..., type = "qualitative",
                              palette = 1, direction = 1,
                              na.value	= "#E9E9E9") {
  discrete_scale("fill",
                 "unhcr_discrete",
                 unhcr_pal_scale(type,
                                 palette,
                                 direction),
                 na.value	= na.value,
                 ...)
}

#' @noRd
unhcr_pal_scale <- function(type = "qualitative",
                            palette = 1, direction = 1) {
  pal <- unhcr_pal_name(palette, type)

  function(n) {
    # If <3 colors are requested, brewer.pal will return a 3-color palette and
    # give a warning. This warning isn't useful, so suppress it.
    # If the palette has k colors and >k colors are requested, brewer.pal will
    # return a k-color palette and give a warning. This warning is useful, so
    # don't suppress it.
    if (n < 3) {
      pal <- suppressWarnings(unhcr_pal(n, pal))
    } else {
      pal <- unhcr_pal(n, pal)
    }
    # In both cases ensure we have n items
    pal = pal[seq_len(n)]

    if (direction == -1)
      pal = rev(pal)

    pal
  }
}


#' @noRd
unhcr_pal_name <- function(palette, type) {
  if (is.character(palette)) {
    if (!palette %in% unhcrcolors$name) {
      warning("Unknown palette ", palette)
      palette = "pal_blue_s"
    }
    return(palette)
  }

  type <- match.arg(type, unique(unhcrcolors$type))
  unhcrcolors$name[unhcrcolors$type == type][palette]
}