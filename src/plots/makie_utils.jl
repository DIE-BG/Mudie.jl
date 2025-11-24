"""
    tslines(
        dates::AbstractArray{<:Date},
        y::AbstractArray{<:Union{Missing, Real}}; 
        figure = (;),
        axis = (;),
        kwargs...,
    )

Plot a time series as a continuous line on a new Figure and Axis.

## Arguments
- dates: array of Date values for the x axis.
- y: array of values (Real or Missing) for the y axis.

## Keyword arguments
- figure: keyword arguments forwarded to Figure().
- axis: keyword arguments forwarded to Axis().
- kwargs: keyword arguments forwarded to lines!().

## Behavior
- Dates are converted to plotting coordinates with `datetime2rata`.
- Tick labels are formatted with `Dates.format(..., "u-yyyy", locale="spanish")` and placed every `step` entries.
- Returns `(fig, ax, l)` where `fig` is the Figure, `ax` is the Axis, and `l` is the plotted Lines object.

See also [`tslines!()`](@ref).
"""
function tslines(
        dates::AbstractArray{<:Date},
        y::AbstractArray{<:Union{Missing, Real}};
        figure = (;),
        axis = (;),
        kwargs...,
    )
    # Create figure and axis with date ticks
    fig = Figure(; figure...)
    ax = Axis(
        fig[1, 1];
        axis...,
    )
    # Plot the line
    l1 = tslines!(
        ax,
        dates,
        y;
        kwargs...,
    )
    return fig, ax, l1
end


"""
    tslines!(
        ax::Axis,
        dates::AbstractArray{<:Date},
        y::AbstractArray{<:Union{Missing, Real}}; 
        kwargs...
    )

Add a time-series line to an existing Axis.

## Arguments
- ax: the Axis to draw into.
- dates: array of Date values for the x axis.
- y: array of values (Real or Missing) for the y axis.

## Keyword arguments
- Any keyword arguments are forwarded to `lines!()` (e.g., color, linewidth, linestyle).

## Behavior
- Dates are converted to plotting coordinates with `datetime2rata`.
- Returns the Lines object produced by `lines!()`.
"""
function tslines!(
        ax::Axis,
        dates::AbstractArray{<:Date},
        y::AbstractArray{<:Union{Missing, Real}};
        kwargs...
    )
    # Dates
    numdates = datetime2rata.(dates)
    # Plot the line
    l = lines!(
        ax,
        numdates,
        y;
        kwargs...,
    )
    # Set date ticks if not already set
    dateticks!(ax, dates)
    return l
end


## Set date xticks
"""
    dateticks!(
        ax = current_axis(),
        dates::AbstractArray{<:Date} = Date(2001, 1):Month(12):Date(2050, 1);
        step::DatePeriod = Month(12),
        format::AbstractString = "u-yyyy",
    )
Sets the current (or specified) axis to be DateTime with given steps and format.
"""
function dateticks!(
        ax = current_axis(),
        dates::AbstractArray{<:Date} = Date(2001, 1):Month(12):Date(2050, 1);
        step::DatePeriod = Month(12),
        format::AbstractString = "u-yyyy",
    )
    # Create dates for the X-axis
    date_ticks = first(dates):step:last(dates)
    numdates = datetime2rata.(date_ticks)
    strdates = Dates.format.(date_ticks, format, locale = "spanish")
    # Set them for the current axis
    ax.xticks = (numdates, strdates)
    ax.xticklabelrotation = π / 4
    return numdates, strdates
end

# """
#     cpibasechanges!(ax=current_axis(), label="CPI base changes")
# Draws vertical lines on the dates of the base changes in the Guatemalan CPI.
# """
# function cpibasechanges!(ax = current_axis(); label = "CPI base changes")
#     return vlines!(
#         ax,
#         datetime2rata.([Date(2000, 12), Date(2010, 12), Date(2023, 12)]),
#         label = label,
#         color = :black,
#         linewidth = 2,
#         linestyle = :dash,
#         alpha = 0.6,
#     )
# end


## Zoom function

"""
    dateszoom!(
        ax=current_axis(),
        datestart=today() - Year(3),
        dateend=today()
    )
Sets the x-limits of the current (or specified) axis to the given date range.
"""
function dateszoom!(
        ax::Axis = current_axis(),
        datestart::Date = today() - Year(3),
        dateend::Date = today(),
    )
    xlims!(
        ax,
        datetime2rata(datestart),
        datetime2rata(dateend),
    )
    return
end
