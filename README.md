# NASA_Satellites_Maps
In this script, I create maps with MODIS-Aqua data, but you can modify the script for a different NASA satellite.

# About ESA vs. NASA data structures
ESA and NASA use different data structures. NASA stores all parameters in one NetCDF file, while ESA stores each parameter in a separate NetCDF.

# How to set up working directory:
<img width="294" alt="Screen Shot 2021-10-29 at 5 47 37 PM" src="https://user-images.githubusercontent.com/83712030/139505920-0bac5238-b24e-42b8-a48a-6ff29e175eec.png">
Download M_map (https://www.eoas.ubc.ca/~rich/map.html) and move to functions folder.
Store Level-2 images (NetCDFs) in data folder.

# Obtaining Level-2 Data
Options: 
- download Level-2 directly, already processed by NASA (OK for open ocean, Case I waters)
-- I recommending using getOC: https://github.com/OceanOptics/getOC
It's a fantastic batch download tool.

- process Level-1 images yourself using l2gen in NASA SeaDAS (see my other repository, Coastal-OC-Remote-Sensing for directions)
