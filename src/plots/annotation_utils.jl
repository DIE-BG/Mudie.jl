"""
    annotate_lines!(
        ax = current_axis();
        all = false,
        format = "%0.2f",
        text_kwargs = (;
            fontsize = 12,
            align = (:left, :center),
        ),
    )
Annotates the last value of all lines in a given Axis. By default, only the last
line is annotated. You can change this behavior by setting `all=true`. 

The format of the annotation can be specified using the `format` argument, which
follows the `Printf` formatting rules. Additional keyword arguments for the text
annotations can be passed via `text_kwargs`.
"""
function annotate_lines!(
        ax::Axis = current_axis();
        all = false,
        format = "%0.2f",
        text_kwargs = (;
            fontsize = 12,
            align = (:left, :center),
        ),
    )

    # Get 'Line' objects from the axis
    lp = isa.(ax.scene.plots, Lines)
    any(lp) || return
    lplots = ax.scene.plots[lp]
    n = length(lplots)

    # Determine which plots to annotate, all or just the last?
    idx_lineplots = all ? (1:n) : (n:n)

    # Annotate desired plots (returns the text object handles)
    return map(idx_lineplots) do i
        # Get the line handle
        lineplot = lplots[i]
        # Get its last values
        x_ = lineplot[1][][end][1]
        y_ = lineplot[1][][end][2]
        # Annotate the value
        formatted = Printf.format(Printf.Format(format), y_)
        text!(
            ax,
            x_,
            y_;
            text = " " * formatted,
            color = lineplot.color[],
            text_kwargs..., # spread additional text keyword arguments
        )
    end
end
