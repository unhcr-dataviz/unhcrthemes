# unhcrthemes (development version)

## Breaking changes

- Replaced `{ggtext}` with `{marquee}` for rendering plot titles, subtitles and captions in `theme_unhcr()`.
- Automatic text wrapping and inline styling remain supported, but styling now follows `{marquee}` Markdown syntax.
- Plain text and standard Markdown continue to work. HTML and CSS markup previously interpreted by `{ggtext}` must be updated. For example, use `{#0072BC highlighted text}` instead of `<span style="color:#0072BC;">highlighted text</span>`.

## Other changes

- The minimum required R version is now R 4.1 because this is required by `{marquee}`.

# unhcrthemes 0.7.1

## Breaking changes

- Removed the dependency on `{extrafont}`, as its dependency `{Rttf2pt1}` is scheduled for removal from CRAN.  
- The function `lato_registered()`, which verified if Lato was registered through `{extrafont}`, has been **removed**.  
- The function `import_lato()` now only imports Lato via `{systemfonts}`.  

## Notes

- This change does **not** affect the use of `{unhcrthemes}` in general workflows.  
- However, it limits the possibility to create PDFs with the official Lato font **embedded**. Users can still rely on system-installed fonts for consistent rendering. 

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
