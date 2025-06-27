# unhcrthemes 0.7.0

## Updates aligned with 2025 UNHCR Data Visualization Guidelines

- Updated `theme_unhcr()` to reflect revised text and gridline colors based on the latest UNHCR standards.
- Revised existing color palettes for improved clarity, contrast, and alignment with new data visualization guidance.
- Added new categorical, sequential and diverging color palettes recommended in the 2025 guidelines.

*Note: Existing palettes remain available but may have slight adjustments. Deprecated colors will be phased out in a future release.*

For reference, see the [UNHCR Data Visualization Guidelines (2025)](https://dataviz.unhcr.org/guidance/) for more details.

# unhcrthemes 0.6.3

## Minor improvements and fixes

- In `theme_unhcr()`, set `legend.location = "plot"` and `legend.justification.top = 0`.

- In `continuous_scale()`, `discrete_scale()` and `binned_scale()`, removed deprecated `scale_name` argument. 

# unhcrthemes 0.6.2

## Minor changes

- Add 'sans' as a fallback font when Lato can't be installed.

# unhcrthemes 0.6.1

CRAN resubmission.

## Minor changes

- Fix quotation marks in `DESCRIPTION` file.

- Explain UNHCR acronym in `DESCRIPTION` file.

- Add `@return` to `display_unhcr_all()`, `display_unhcr_pal()`, `import_lato()` and `unhcr_scale()` functions.

# unhcrthemes 0.6.0

Initial CRAN submission.
