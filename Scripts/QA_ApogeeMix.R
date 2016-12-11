#################################################################################
### QUALITY CONTROL AND ASSURANCE PROTOCOL FOR SMALL-PARTICLE FLOW CYTOMETRY
### Apogee bead mixture
###     Polystyrene 110 and 500nm, Yellow Green Flourescent;
###     Silica 180, 240, 300, 590, 880 and 1300nm, Non-fluorescent
###
### Author: Jaco Botha
### Last modified: 11-12-2016
###
#################################################################################

## Loads necessary libraries for QA
library(flowCore)
library(flowViz)
library(flowQ)
library(flowDensity)

## Sources support scripts
source("C:/Users/kfp4/Desktop/FlowCytometry/Scripts/SupportFunctions.R")

## Generates file list for QA analysis
fileList<-list.files("../Data/QA_ApogeeMix/",full.names=T)

## Creates a flowSet object with all files for QA
fs<-read.flowSet(fileList)

## Creates variable names for all channels for easy calling
VSALS<-'405-SALS(Peak)'
VLALS<-'405-LALS(Peak)'
VMALS<-'DEAD11(Peak)'
VBlu<-'405-Blu(Peak)'
VGrn<-'405-Grn(Peak)'
VOrg<-'405-Org(Peak)'
RRed<-'638-Red(Peak)'
RDRed<-'638-DRed(Peak)'
BGrn<-'488-Grn(Peak)'
BOrg<-'488-Org(Peak)'
BRed<-'488-Red(Peak)'
Time<-'TIME'

## Creates a global folw cytometry frame from 10 random files in the flow set
## with twice as many data points as any of the flow sets.
globalFrame<-getGlobalFrame(fs,10,2)

## Log10 transformation of axes
logTrans<-logTransform(transformationId="log10-transformation",logbase=10,r=1,d=1)
trans<-transformList(colnames(globalFrame@exprs)[1:11],logTrans)
transGlobalFrame<-transform(globalFrame,trans)
