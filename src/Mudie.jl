"""
    Mudie

Makie Utils for DIE (Mudie): A Julia package for plotting uniformly styled figures using Makie.

"""
module Mudie

# Necessary Packages
using Makie
using Dates
using Printf: Printf, @sprintf

# Include locale for Spanish dates
export SPANISH_GT
include("locale.jl")

# Export makie theme
export die_theme
include("themes/initial_die_theme.jl")

# Plotting utilities
export tslines, tslines!, dateticks!, dateszoom!
include("plots/makie_utils.jl")
export annotate_lines!
include("plots/annotation_utils.jl")

end
