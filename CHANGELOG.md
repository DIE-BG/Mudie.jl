# Change Log

## [0.1.2] 2025-11

## Added
- Short examples section in the documentation.

## Fixed
- Corrected docstrings in some objects.


## [0.1.1] 2025-11

## Fixed
- `tslines` and `tslines!` work more accordingly to the Makie interface to create line plots.


## [0.1.0] 2025-11

### Added 
- Add initial Makie theme for DIE
- Helper plotting functions `tslines` and `tslines!` for plotting DIE-styled time series. 
- New function `annotate_lines!`: annotates all (or just the last) lines in the given axis. 
- New functions: `dateticks!` sets new x-ticks with specified dates and formats, `dateszoom!` zooms the x-axis over the specified dates. 