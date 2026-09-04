# UNHCR color palettes viewer

Displays a set of the color palettes from UNHCR color

## Usage

``` r
display_unhcr_all(n = NULL, type = "all")
```

## Arguments

- n:

  Number of different colors in the palette, minimum depending on the
  palette (2), maximum depending on the palette (5, 7 or 10)

- type:

  Type of the palette, can be "sequential", "diverging", "qualitative"
  or "all"

## Value

No return value, called for side effects

## Examples

``` r
library(unhcrthemes)
display_unhcr_all()

display_unhcr_all(type = "diverging")

display_unhcr_all(type = c("diverging", "qualitative", "sequential"))

display_unhcr_all(n = 3, type = "sequential")

display_unhcr_all(n = 5, type = "sequential")

```
