# Progress in Epigenetic Research of Breast Cancer — VOSviewer Geographic Mapping

## 📖 Overview
This project aims to **assign geographic coordinates (longitude and latitude) to countries mentioned in research** and generate data compatible with **VOSviewer** for geographic distribution visualization.  
By standardizing country names and linking them with accurate geographic information, it allows **visualizing research collaboration and distribution** in VOSviewer more intuitively.

---

## 🗂 Features
1. **Read geographic boundary data** (`TM_WORLD_BORDERS-0.3` shapefile).
2. **Load the original mapping table exported from VOSviewer** (`map.csv`).
3. **Standardize country names** (e.g., change "USA" to "UNITED STATES").
4. **Match longitude and latitude** coordinates to countries.
5. **Export a new file** (`mapnew.csv`) containing geographic coordinates for use in VOSviewer.

---

## 📦 Dependencies

Before running the script, ensure the following R packages are installed:

```r
install.packages(c("sp", "rgdal", "tidyverse"))
