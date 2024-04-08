query_ncbi_accession <- function(acc){
     # Given an accesion ID ('acc') as query term, searches
     # NCBI's Nucleotide database for the taxon ID
     # Returns an integer-type taxon ID
     
     # Requires the following packages: BioStrings, rentrez
     library(Biostrings)
     library(rentrez)
     
     query <- acc

     ids <- lapply(query, 
                   entrez_search, 
                   db='nucleotide', retmax = 10000, use_history=TRUE)
     
     for (i in seq_along(ids)){
          if (ids[[i]]$count==0){
               # Do nothing further if there aren't any hits
               taxon = NA
          } else {
               fetch_text <- 
                    entrez_fetch(db='nucleotide',
                                 web_history=ids[[i]]$web_history,
                                 rettype='xml')
               taxon <- str_extract(fetch_text, 'taxon:(.*)<')
               taxon <- str_replace(taxon, 'taxon:', '')
               taxon <- str_replace(taxon, '<', '')
               taxon <- as.integer(taxon)
          }
     }

     return(taxon)
}