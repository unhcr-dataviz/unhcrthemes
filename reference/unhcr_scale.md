# UNHCR ggplot2 color scales

UNHCR ggplot2 color scales

## Usage

``` r
scale_color_unhcr_c(
  ...,
  type = "sequential",
  palette = 1,
  direction = 1,
  na.value = "#E5E5E5",
  guide = "colourbar"
)

scale_color_unhcr_d(
  ...,
  type = "qualitative",
  palette = 1,
  direction = 1,
  nmax = NULL,
  order = NULL,
  na.value = "#E5E5E5"
)

scale_color_unhcr_b(
  ...,
  type = "qualitative",
  palette = 1,
  direction = 1,
  nmax = NULL,
  order = NULL,
  na.value = "#E5E5E5",
  guide = "coloursteps"
)

scale_colour_unhcr_c(
  ...,
  type = "sequential",
  palette = 1,
  direction = 1,
  na.value = "#E5E5E5",
  guide = "colourbar"
)

scale_colour_unhcr_d(
  ...,
  type = "qualitative",
  palette = 1,
  direction = 1,
  nmax = NULL,
  order = NULL,
  na.value = "#E5E5E5"
)

scale_colour_unhcr_b(
  ...,
  type = "qualitative",
  palette = 1,
  direction = 1,
  nmax = NULL,
  order = NULL,
  na.value = "#E5E5E5",
  guide = "coloursteps"
)

scale_fill_unhcr_c(
  ...,
  type = "sequential",
  palette = 1,
  direction = 1,
  na.value = "#E5E5E5",
  guide = "colourbar"
)

scale_fill_unhcr_d(
  ...,
  type = "qualitative",
  palette = 1,
  direction = 1,
  nmax = NULL,
  order = NULL,
  na.value = "#E5E5E5"
)

scale_fill_unhcr_b(
  ...,
  type = "qualitative",
  palette = 1,
  direction = 1,
  nmax = NULL,
  order = NULL,
  na.value = "#E5E5E5",
  guide = "coloursteps"
)
```

## Arguments

- ...:

  Other arguments passed on to
  [`discrete_scale`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  or
  [`continuous_scale`](https://ggplot2.tidyverse.org/reference/continuous_scale.html)
  to control name, limits, breaks, labels and so forth

- type:

  One of \\sequential\\, \\diverging\\ or \\qualitative\\

- palette:

  If a string, will use that named palette. If a number, will index into
  the list of palettes of appropriate `type`

- direction:

  Sets the order of colors in the scale. If 1, the default, colors are
  as output by
  [`unhcr_pal()`](https://unhcr-dataviz.github.io/unhcrthemes/reference/unhcr_pal.md).
  If -1, the order of colors is reversed

- na.value:

  Missing values will be replaced with this value.

- guide:

  A function used to create a guide or its name. See
  [`guides()`](https://ggplot2.tidyverse.org/reference/guides.html) for
  more information.

- nmax:

  Maximum number of different colors the palette should contain. If not
  provided, is calculated automatically from the data.

- order:

  Numeric vector listing the order in which the colors should be used.
  Default is `1:nmax`.

## Value

A discrete, continuous or binned `Scale` object

## See also

[`gradient_n_pal`](https://scales.r-lib.org/reference/pal_gradient_n.html)

## Examples

``` r
library(ggplot2)

data(msleep, package = "ggplot2")

ggplot(msleep, aes(vore, sleep_total, fill = vore)) +
  geom_boxplot() +
  scale_fill_unhcr_d(palette = 1, direction = -1)

```
