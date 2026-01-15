## Utilities for plotting quarterly data with Makie

"""
    quarterlyticks!(
        ax = current_axis(),
        dates::AbstractArray{Date} = [Date(2001, 1):Month(12):Date(2050, 1)...];
    )
Currently, Julia does not provide a DateFormat for inserting quarers (Q1, Q2, Q3, Q4)
in dates. This function creates quarterly ticks for the given dates.
Sets the current (or specified) axis to be DateTime with given quarterly ticks (they
can be unevenly spaced.)
"""
function quarterlyticks!(
        ax = current_axis(),
        dates::AbstractArray{Date} = [Date(2001, 1):Month(12):Date(2050, 1)...],
    )
    # Create dates for the X-axis
    numdates = datetime2rata.(dates)
    strdates = @. string(year(dates)) * "Q" * string(Dates.quarter(dates))
    # Set them for the current axis
    ax.xticks = (numdates, strdates)
    ax.xticklabelrotation = π / 4
    return numdates, strdates
end

function quarterly_step_labels_(dates)
    # Creates labels for the quarters in the format "YYYYQX"
    # If is not a quarter start, returns just the quarter number "QX"
    labels = String[]
    for date in dates
        if month(date) in (1, 4, 7, 10)
            push!(labels, @sprintf("%dQ%d", year(date), Dates.quarter(date)))
        else
            push!(labels, @sprintf("Q%d", Dates.quarter(date)))
        end
    end
end
