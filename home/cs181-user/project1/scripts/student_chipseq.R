# Make Necessary Imports
library(ChIPseeker)
library(GenomicRanges)
library(TxDb.Dmelanogaster.UCSC.dm6.ensGene)
library(tidyverse)
library(ggplot2)

# Note that the tutorial uses HG19 - the human genome.
txdb <- TxDb.Dmelanogaster.UCSC.dm6.ensGene

# TODO: Determine the filepaths of your BED files WITHIN the container.
a_file <- "???/a.bed"
b_file <- "???/b.bed"
c_file <- "???/c.bed"

# TODO: Determine how to read in the BED file into a peaks object.
# Hint: Look at how the tutorial does this.
a_peaks <- ???
b_peaks <- ???
c_peaks <- ???

make_covplot <- function(peaks, name) {
    plot <- covplot(peaks)

     # Prepare the creation of the image.
    output_file <- paste0("../outputs/", name, "_covplot.jpg")
    ggsave(output_file, plot, width = 8, height = 6, dpi = 300)
}

make_heatmap <- function(peaks, name) {
    output_file <- paste0("../outputs/", name, "_heatmap.jpg")

    # TODO: Fill in this function using peakHeatmap().
    # You should need the following: peak, TxDb, nbin, upstream, downstream
    # If this code fails or returns "Killed" see the handout for tips.
    ggsave(output_file, plot, width = 8, height = 6, dpi = 300)
}

makePeakProfile <- function(peaks, name) {
    # TODO: Looking at the tutorial, fill in these blank spaces! 
    # Feel free to change the scope to look at a smaller or bigger plot.

    plot <- plotPeakProf2(peak = ???, upstream = ???, downstream = ???,
              conf = 0.95, by = ???, type = "body", nbin = 200,
              TxDb = txdb,ignore_strand = F)
    
    output_file <- paste0("../outputs/", name, "_peakprofile.png")
    ggsave(output_file, plot, width = 8, height = 6, dpi = 300)
}

# TODO: Call each of your implemented functions on all of your Peaks objects.

## Make the Genome Wide Binding Plots!
make_covplot(???, "???")
make_covplot(???, "???")
make_covplot(???, "???")
print("Finished Generating Covplots.")

## Make the Heatmap Plots!
# This has a different plotting method because the data is stored in a different
# data structure than the other plots!!
make_heatmap(???, "???")
make_heatmap(???, "???")
make_heatmap(???, "???")
print("Finished Generating Heatmaps.")

## Make the PeakProfile2 Plots!
makePeakProfile(???, "???")
makePeakProfile(???, "???")
makePeakProfile(???, "???")
print("Finished Generating Peak Profiles.")