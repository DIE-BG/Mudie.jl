## Makie theme for the plots

BG_GREEN = colorant"#213830"
BG_LIGHTGREEN = colorant"#2a5446"
BG_RED = colorant"#781f0e"
BG_YELLOW = colorant"#c4922b"
BG_BONEWHITE = colorant"#c0c1b5"
BG_GRAY = colorant"#9d9e9f"
BG_SKINBROWN = colorant"#bca580"
WONG_COLORS = Makie.wong_colors()

"""
    die_theme_tex_font::Makie.Theme

A Makie theme for DIE plots with specific fonts and styles.
"""
die_theme_texfonts = Makie.Theme(
    size=(950, 750),
    fontsize=18,
    grid=true,
    fonts=(;
        regular="New Computer Modern",
        italic="New Computer Modern Italic",
        bold="New Computer Modern Bold",
    ),
    # palette = (;
    #     # Order of colors
    #     color = [
    #         BG_GREEN,
    #         BG_YELLOW,
    #         BG_RED,
    #         BG_BONEWHITE,
    #         BG_GRAY,
    #         BG_LIGHTGREEN,
    #         BG_SKINBROWN,
    #         WONG_COLORS...,
    #     ]
    # ),
    # cycle = [:color, :marker],
    Axis=(;
        titlesize=20,
        xticklabelsize=18,
        yticklabelsize=18,
        xlabelsize=20,
        ylabelsize=20,
        xticklabelrotation=pi / 4,
        # Axis borders
        leftspinevisible=false,
        rightspinevisible=false,
        topspinevisible=false,
        bottomspinevisible=true,
        # Grid
        xgridvisible=false,
    ),
    Legend=(;
        framevisible=false,
        labelsize=16,
    ),
    Lines=(;
        linewidth=3,
    ),
    Text=(;
        fontsize=18,
    ),
    # For the bottom source labels
    Label=(;
        fontsize=14,
    ),
)
