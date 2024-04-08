
# Prepare NCBI taxonomy SQL database on cluster (runs out of memory locally) 

# Setup -----------------------------------------------------------------------

library(taxonomizr); packageVersion('taxonomizr') # Read in library

# Format SQL database ---------------------------------------------------------
prepareDatabase('accessionTaxa.sql')
