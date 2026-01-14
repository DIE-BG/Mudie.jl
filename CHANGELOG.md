# Change Log

## [0.2.1] – 2026-1

### Changed

- Updated Makie versions in Project.toml for compatibility and improvements.

## [0.2.0] – 2025-12

### Added

-   New `dateticks!` method that accepts a vector of specific `Date` values, allowing explicit control of tick positions on the x-axis.

### Fixed

-   Corrected an issue where the Spanish `locale` for Dates was not being exported properly to the `Main` scope.

## [0.1.2] 2025-11

### Added

-   Short examples section in the documentation.

### Fixed

-   Corrected docstrings in some objects.

## [0.1.1] 2025-11

### Fixed

-   `tslines` and `tslines!` work more accordingly to the Makie interface to create line plots.

## [0.1.0] 2025-11

### Added

-   Add initial Makie theme for DIE
-   Helper plotting functions `tslines` and `tslines!` for plotting DIE-styled time series.
-   New function `annotate_lines!`: annotates all (or just the last) lines in the given axis.
-   New functions: `dateticks!` sets new x-ticks with specified dates and formats, `dateszoom!` zooms the x-axis over the specified dates.
