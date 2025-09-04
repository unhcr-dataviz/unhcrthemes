## Resubmission notes

- Removed the dependency on `{extrafont}`, as its dependency `{Rttf2pt1}` is scheduled for removal from CRAN. 
- Removed the function `lato_registered()`, which relied on `{extrafont}`.
- Updated the function `import_lato()` to use only `{systemfonts}`.

## R CMD check results

0 errors | 0 warnings | 0 note
