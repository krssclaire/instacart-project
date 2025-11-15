# Instacart EDA with SQL

## Description
This case study is part of the [Data Lemur](https://datalemur.com/sql-tutorial/instacart-sql-data-analytics-case-study)  SQL course and focuses on exploring a complex relational database through SQL.  
The analysis combines SQL queries with spreadsheet-based inspection to uncover product trends, user behavior, and pseudo-temporal dynamics within the Instacart dataset.  
Tools used:
* PostgreSQL – full database hosting
* Visual Studio Code + SQLTools – query execution & CSV extraction
* Excel Power Query – data shaping & visualization  

**Important note on the data**
The original dataset contains no real timestamps, so the case study uses pseudo-timelines:
* `order_products_prior` as Q2
* `order_products_train` + `order_products_test` as Q3

## Objective
Perform an Exploratory Data Analysis (EDA) using SQL first, and Excel/Power Query for second-layer insights and data visualization.  
The goal is not business forecasting but hands-on analytical practice with a large dataset.

**Disclaimers**: 
* The dataset is outdated (2017), partially incomplete and especially sparse in pesudo-Q3.  
The results should not be used for actual strategic decision.
* The complete dataset is too large for this repository.  
You can download it directly from [Kaggle](https://www.kaggle.com/datasets/yasserh/instacart-online-grocery-basket-analysis-dataset).


## Repository content
*Work in progress - feel free to browse folders meanwhile*  
* /img - images used in report, this will contain graphs too
* /output - future CSV files produced from Excel Power Query and XLSX file
* /queries - SQL queries in the analysis
* /report - ongoing report writing

## How to view report progress
1. Clone the repository
2. Open the `/report/instacart-case-study.docx` file 