# remove output folders so all previous output is empty
unlink("output", recursive = T)
unlink("figs", recursive = T)

# create output folders
dir.create("output")
dir.create("figs")
