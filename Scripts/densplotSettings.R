#################################################################################
### GGPLOT2 SETTINGS FOR PLOTTING CYTOGRAMS
###
### Author: Jaco Botha
### Created: 10-02-2017
### Last modified: 10-02-2017
###
#################################################################################


#####
## Creates theme for plotting figures in PNG graphics device.
#####
themePNG<-theme(panel.background=element_rect(fill="white", colour="black",
                                              size=3),
                panel.grid.major.x=element_blank(),
                panel.grid.major.y=element_blank(),
                panel.grid.minor=element_blank(),
                plot.title=element_text(size=80,hjust=0.5,vjust=0),
                strip.text=element_text(size=100, face="bold", vjust=1),
                strip.background=element_rect(fill="white"),
                axis.text=element_text(size=68),
                axis.title=element_text(size=80),
                axis.title.y=element_text(vjust=8),
                axis.title.x=element_text(vjust=-8),
                axis.ticks=element_line(size=2, color="black"),
                axis.ticks.length=unit(15, "points"),
                plot.margin=unit(c(100,100,100,100), "points"))

#####
## Creates theme for plotting figures in EPS graphics device.
#####
themeEPS<-NULL


#####
## Creates log10 scaling for x axis when plotting.
#####
apogeeLogX<-scale_x_log10(breaks = scales::trans_breaks("log10", function(x) 10^x),
                          labels = scales::trans_format("log10", scales::math_format(10^.x)))


#####
## Creates log10 scaling for Y axis when plotting.
#####
apogeeLogY<-scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x),
                          labels = scales::trans_format("log10", scales::math_format(10^.x)))


#####
## Zoom settings for plots.
#####
coordZoom<-coord_cartesian(xlim=c(2,2.65E+06),ylim=c(2,2.65E+06))


#####
## Specifies annotation for log10 axes for PNG graphics device.
#####
PNGLogAnotate<-annotation_logticks(size=2,short = unit(10,"points"),mid = unit(15,"points"),
                                   long = unit(20,"points"))