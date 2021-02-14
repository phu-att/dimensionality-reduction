# Dimensionality Reduction
 PCA, FA, and MDS
 
## Problem to Address
* Perform PCA on two systhetically created datasets: intercorreated and uncorrelated; and analyse the obtained results 
* Perform MDS on a dataset containing five economic and social variables, and analyse the obtained results
* Summarize the goals of the work, the data source, the methods used, the results of the analysis and the conclusions of the given paper. Also, comment on the robustness and generality of the results, and limitations of the analysis

## Directory Structure
``` bash
dimensionality-reduction
├── 00_analysis_doc.pdf
├── LICENSE
├── README.md
└── scripts
    ├── _00_analysis_code.R
    ├── datasets
    │   ├── The_Online_Dating_Intensity_Scale_Exploratory_Factor_Analysis_in_a_Sample_of_Emerging_Adults.pdf
    │   └── UNSY97.txt
    └── output
        ├── biplot_scaled_a.pdf
        ├── biplot_scaled_c.pdf
        ├── biplot_unscaled_a.pdf
        ├── biplot_unscaled_c.pdf
        ├── mds_1d.pdf
        ├── mds_2d.pdf
        ├── scree_plot_mds.pdf
        ├── variance_explained_cul_a.pdf
        ├── variance_explained_cul_c.pdf
        ├── variance_explained_ind_a.pdf
        └── variance_explained_ind_c.pdf
```
## File Description
* ```00_analysis_doc.pdf``` -> Document that explains rational and analysis of the project
### scripts
* ```00_analysis_code.R``` -> The code contains data processing process & conducted analysis, including all outputs shown in the companion document
### datasets
* ```The_Online_Dating_Intensity_Scale_Exploratory_Factor_Analysis_in_a_Sample_of_Emerging_Adults.pdf``` -> FA literature for Q3
* ```UNSY97.txt``` -> Economic and social data containing 25 contries and 5 features
### output
* ```biplot_scaled_a.pdf``` -> A biplot of the scaled dataset a.)
* ```biplot_scaled_c.pdf``` -> A biplot of the scaled dataset c.)
* ``` biplot_unscaled_a.pdf``` -> A biplot of the unscaled dataset a.)
* ```biplot_unscaled_c.pdf``` -> A biplot of the unscaled dataset c.) 
* ```mds_1d.pdf``` -> A visualization of the one-dimension MDS
* ```mds_2d.pdf``` -> A visualization of the two-dimension MDS
* ```scree_plot_mds.pdf``` -> A scree plot showing the GOF vs. number of dimensions
* ```variance_explained_cul_a.pdf``` -> A plot showing a cumulative variance explained of dataset a.) 
* ```variance_explained_cul_c.pdf``` -> A plot showing a cumulative variance explained of dataset c.) 
* ```variance_explained_ind_a.pdf``` -> A plot showing a variance explained of dataset a.) 
* ```variance_explained_ind_c.pdf``` -> A plot showing a variance explained of dataset c.) 


