"""
    Mudie

Makie Utils for DIE (Mudie): A Julia package for plotting uniformly styled figures using Makie.

"""
module Mudie
# Necessary Packages
using Makie
using Dates

# Export makie theme
export die_theme
include("themes/makie_theme.jl")


end
