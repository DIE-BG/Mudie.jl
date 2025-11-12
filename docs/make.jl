using Mudie
using Documenter

DocMeta.setdocmeta!(Mudie, :DocTestSetup, :(using Mudie); recursive = true)

makedocs(;
    modules = [Mudie],
    authors = "DIE-BG contributors",
    repo = "https://github.com/DIE-BG/Mudie.jl/blob/{commit}{path}#{line}",
    sitename = "Mudie.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://die-bg.github.io/Mudie.jl",
        assets = String[],
    ),
    pages = [
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo = "github.com/DIE-BG/Mudie.jl",
    devbranch = "main",
)
