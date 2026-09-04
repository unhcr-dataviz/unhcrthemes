# UNHCR color palettes

Creates a color palette from UNHCR branding

## Usage

``` r
unhcr_pal(n = NULL, name, ...)
```

## Arguments

- n:

  Number of different colors in the palette, minimum depending on
  palette (2), maximum depending on palette (5, 7 or 10)

- name:

  A palette name

- ...:

  Additional arguments for
  [grDevices::colorRampPalette](https://rdrr.io/r/grDevices/colorRamp.html)

## Value

A character vector, the palette hex color codes.

## Examples

``` r
unhcr_pal(3, "pal_unhcr")
#> [1] "#0072BC" "#FFC740" "#32C189"
unhcr_pal(3, "pal_blue")
#> [1] "#8FC1E1" "#0072BC" "#0B3754"
unhcr_pal(5, "pal_yellow")
#> [1] "#FEF1D1" "#FFC740" "#E4A202" "#B98405" "#8F6808"
unhcr_pal(12, "pal_red")
#>  [1] "#FCE2DE" "#FACCC5" "#F9B7AC" "#F7A090" "#F68875" "#EC745F" "#DB644F"
#>  [8] "#C85642" "#AF4D3C" "#974435" "#7F3B2F" "#683229"
```
