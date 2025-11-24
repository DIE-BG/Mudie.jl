
## Simple plot

```julia
fig, ax, l1 = tslines(
    df.dates,
    df.ma_weighted_mean_quantile,
)
```

## Configuring Axis and Figure parameters

```julia
fig, ax, l1 = tslines(
    df.dates,
    df.ma_weighted_mean_quantile,
    figure = (; size = (900, 400)),
    axis = (;
        title = "Weighted Mean and Mean Quantile",
        yticks = 0:0.05:1,
    ),
    linewidth=3,
)

tslines!(
    ax,
    df.dates,
    df.weighted_mean_quantile,
    color = (:gray, 0.3),
    label = "Mean Quantile",
)

Mudie.annotate_lines!(ax, all = true)
Mudie.dateszoom!(ax, Date(2015), Date(2026, 6))
ylims!(ax, 0.4, 0.8)
fig
```

## Reset or change date ticks

```julia
fig, ax, l1 = tslines(
    df.dates,
    df.ma_weighted_mean_quantile,
)
tslines!(
    ax,
    df.dates,
    df.weighted_mean_quantile,
)
Mudie.annotate_lines!(ax, all = true)
Mudie.dateszoom!(ax, Date(2015), Date(2026, 6))
Mudie.dateticks!(ax, Date(2015,1):Date(2028,6); step=Quarter(2), format="Y-mm")
fig
```

