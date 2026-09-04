# Changelog

## unhcrthemes (development version)

## unhcrthemes 0.7.1

CRAN release: 2025-09-04

### Breaking changes

- Removed the dependency on
  [extrafont](https://github.com/fbertran/extrafont), as its dependency
  [Rttf2pt1](https://github.com/fbertran/Rttf2pt1) is scheduled for
  removal from CRAN.  
- The function `lato_registered()`, which verified if Lato was
  registered through [extrafont](https://github.com/fbertran/extrafont),
  has been **removed**.  
- The function
  [`import_lato()`](https://unhcr-dataviz.github.io/unhcrthemes/reference/import_lato.md)
  now only imports Lato via
  [systemfonts](https://github.com/r-lib/systemfonts).

### Notes

- This change does **not** affect the use of
  [unhcrthemes](https://github.com/vidonne/unhcrthemes) in general
  workflows.  
- However, it limits the possibility to create PDFs with the official
  Lato font **embedded**. Users can still rely on system-installed fonts
  for consistent rendering.

## unhcrthemes 0.7.0

CRAN release: 2025-06-27

### Updates aligned with 2025 UNHCR Data Visualization Guidelines

- Updated
  [`theme_unhcr()`](https://unhcr-dataviz.github.io/unhcrthemes/reference/theme_unhcr.md)
  to reflect revised text and gridline colors based on the latest UNHCR
  standards.
- Revised existing color palettes for improved clarity, contrast, and
  alignment with new data visualization guidance.
- Added new categorical, sequential and diverging color palettes
  recommended in the 2025 guidelines.

*Note: Existing palettes remain available but may have slight
adjustments. Deprecated colors will be phased out in a future release.*

For reference, see the [UNHCR Data Visualization Guidelines
(2025)](https://dataviz.unhcr.org/guidance/) for more details.

## unhcrthemes 0.6.3

CRAN release: 2025-01-16

### Minor improvements and fixes

- In
  [`theme_unhcr()`](https://unhcr-dataviz.github.io/unhcrthemes/reference/theme_unhcr.md),
  set `legend.location = "plot"` and `legend.justification.top = 0`.

- In
  [`continuous_scale()`](https://ggplot2.tidyverse.org/reference/continuous_scale.html),
  [`discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  and
  [`binned_scale()`](https://ggplot2.tidyverse.org/reference/binned_scale.html),
  removed deprecated `scale_name` argument.

## unhcrthemes 0.6.2

CRAN release: 2023-11-27

### Minor changes

- Add ‘sans’ as a fallback font when Lato can’t be installed.

## unhcrthemes 0.6.1

CRAN release: 2023-11-20

CRAN resubmission.

### Minor changes

- Fix quotation marks in `DESCRIPTION` file.

- Explain UNHCR acronym in `DESCRIPTION` file.

- Add `@return` to
  [`display_unhcr_all()`](https://unhcr-dataviz.github.io/unhcrthemes/reference/display_unhcr_all.md),
  [`display_unhcr_pal()`](https://unhcr-dataviz.github.io/unhcrthemes/reference/display_unhcr_pal.md),
  [`import_lato()`](https://unhcr-dataviz.github.io/unhcrthemes/reference/import_lato.md)
  and `unhcr_scale()` functions.

## unhcrthemes 0.6.0

Initial CRAN submission.
