#' UNHCR ggplot2 color scales
#'
#' UNHCR ggplot2 color scales
#'
#' @inheritParams scales::gradient_n_pal
#' @inheritParams ggplot2::continuous_scale
#' @inheritParams ggplot2::discrete_scale
#'
#' @param type One of \"sequential\", \"diverging\" or \"qualitative\"
#' @param palette If a string, will use that named palette. If a number, will
#'   index into the list of palettes of appropriate `type`
#' @param direction Sets the order of colors in the scale. If 1, the default,
#' colors are as output by [unhcr_pal()]. If -1, the order of colors is reversed
#' @param nmax Maximum number of different colors the palette should contain.
#' If not provided, is calculated automatically from the data.
#' @param order Numeric vector listing the order in which the colors
#' should be used. Default is \code{1:nmax}.
#' @param ... Other arguments passed on to
#' \code{\link[ggplot2:discrete_scale]{discrete_scale}} or
#' \code{\link[ggplot2:continuous_scale]{continuous_scale}}
#' to control name, limits, breaks, labels and so forth
#'
#' @seealso \code{\link[scales:gradient_n_pal]{gradient_n_pal}}
#'
#' @importFrom scales gradient_n_pal
#' @importFrom ggplot2 discrete_scale continuous_scale
#'
#' @return A discrete, continuous or binned `Scale` object
#'
#' @examples
#' library(ggplot2)
#'
#' data(msleep, package = "ggplot2")
#'
#' ggplot(msleep, aes(vore, sleep_total, fill = vore)) +
#'   geom_boxplot() +
#'   scale_fill_unhcr_d(palette = 1, direction = -1)
#'
#' @rdname unhcr_scale
#' @export
scale_color_unhcr_c <- function(..., type = "sequential",
                                palette = 1,
                                direction = 1,
                                na.value = "#E9E9E9", guide = "colourbar") {
  pal <- unhcr_pal_scale(
    type = type,
    palette = palette,
    direction = direction
  )(256)

  continuous_scale(
    aesthetics = "colour",
    palette = gradient_n_pal(pal),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @rdname unhcr_scale
#' @export
scale_color_unhcr_d <- function(..., type = "qualitative",
                                palette = 1,
                                direction = 1,
                                nmax = NULL,
                                order = NULL,
                                na.value = "#E9E9E9") {
  pal <- unhcr_pal_scale(
    type = type,
    palette = palette,
    nmax = nmax,
    order = order,
    direction = direction
  )

  discrete_scale(
    aesthetics = "colour",
    palette = pal,
    na.value = na.value,
    ...
  )
}

#' @rdname unhcr_scale
#' @export
scale_color_unhcr_b <- function(..., type = "qualitative",
                                palette = 1,
                                direction = 1,
                                nmax = NULL,
                                order = NULL,
                                na.value = "#E9E9E9",
                                guide = "coloursteps") {
  pal <- binned_pal(unhcr_pal_scale(
    type = type,
    palette = palette,
    nmax = nmax,
    order = order,
    direction = direction
  ))

  binned_scale(
    aesthetics = "colour",
    palette = pal,
    na.value = na.value,
    guide = guide,
    ...
  )
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
#' @aliases scale_color_unhcr_b
#' @export
scale_colour_unhcr_b <- scale_color_unhcr_b

#' @rdname unhcr_scale
#' @export
scale_fill_unhcr_c <- function(..., type = "sequential",
                               palette = 1,
                               direction = 1,
                               na.value = "#E9E9E9",
                               guide = "colourbar") {
  pal <- unhcr_pal_scale(
    type = type,
    palette = palette,
    direction = direction
  )(256)

  continuous_scale(
    aesthetics = "fill",
    palette = gradient_n_pal(pal),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @rdname unhcr_scale
#' @export
scale_fill_unhcr_d <- function(..., type = "qualitative",
                               palette = 1,
                               direction = 1,
                               nmax = NULL,
                               order = NULL,
                               na.value = "#E9E9E9") {
  pal <- unhcr_pal_scale(
    type = type,
    palette = palette,
    nmax = nmax,
    order = order,
    direction = direction
  )

  discrete_scale(
    aesthetics = "fill",
    palette = pal,
    na.value = na.value,
    ...
  )
}

#' @rdname unhcr_scale
#' @export
scale_fill_unhcr_b <- function(..., type = "qualitative",
                               palette = 1,
                               direction = 1,
                               nmax = NULL,
                               order = NULL,
                               na.value = "#E9E9E9",
                               guide = "coloursteps") {
  pal <- binned_pal(unhcr_pal_scale(
    type = type,
    palette = palette,
    nmax = nmax,
    order = order,
    direction = direction
  ))

  binned_scale(
    aesthetics = "fill",
    palette = pal,
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @noRd
unhcr_pal_scale <- function(type = "qualitative",
                            nmax = NULL, order = NULL,
                            palette = 1, direction = 1) {
  pal <- unhcr_pal_name(palette, type)

  function(n) {
    if (is.null(nmax) | type != "qualitative") {
      nmax <- n
    }
    if (is.null(order) | type != "qualitative") {
      order <- 1:n
    }

    if (n > nmax) {
      warning("Insufficient values in scale_{color|fill}_unhcr_d. ",
        n, " needed but only ",
        nmax, " provided.",
        call. = FALSE
      )
    }

    # If <3 colors are requested, brewer.pal will return a 3-color palette and
    # give a warning. This warning isn't useful, so suppress it.
    # If the palette has k colors and >k colors are requested, brewer.pal will
    # return a k-color palette and give a warning. This warning is useful, so
    # don't suppress it.
    if (nmax < 3) {
      pal <- suppressWarnings(unhcr_pal(nmax, pal))
    } else {
      pal <- unhcr_pal(nmax, pal)
    }

    # In both cases ensure we have n items
    pal <- pal[order]

    if (direction == -1) {
      pal <- rev(pal)
    }

    unname(pal)
  }
}

#' @noRd
unhcr_pal_name <- function(palette, type) {
  if (is.character(palette)) {
    if (!palette %in% unhcrcolors$name) {
      warning("Unknown palette ", palette)
      palette <- "pal_blue"
    }
    return(palette)
  }
  type <- match.arg(type, unique(unhcrcolors$type))
  unhcrcolors$name[unhcrcolors$type == type][palette]
}

#' @noRd
binned_pal <- function(palette) {
  function(x) {
    palette(length(x))
  }
}
