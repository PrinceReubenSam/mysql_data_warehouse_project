# mysql_data_warehouse_project

# Data Warehouse & Analytics Project

Welcome to the Data Warehouse & Analytics Project repository!  
This project showcases my ability to design and engineer a modern database system to support advanced analytics and business intelligence.

It demonstrates end-to-end implementation — from raw data ingestion and transformation to actionable insights — reflecting industry best practices in data engineering and analytics.
##  Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:

<img width="558" height="375" alt="image" src="https://github.com/user-attachments/assets/9882dee4-3813-4569-8118-3828109b9641" />

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into MySQL Database.
3. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
4. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---

## Project Overview

**Goal:**  
Build a modern data warehouse using **MySQL** that integrates sales data from multiple sources and enables analytics for informed business decision-making.

---

##  Data Engineering – Building the Warehouse

**Key Components:**

- **Data Sources:**  
- **[Datasets](datasets/):** Access to the project dataset (csv files).

- **Data Cleaning:**  
  Identified and resolved data quality issues to ensure reliable analysis.

- **Data Integration:**  
  Merged both sources into a single, analytical schema optimized for querying.

- **Scope Limitation:**  
  Focused only on the **latest dataset snapshot** (no historical tracking).

- **Documentation:**  
  Documented the data model clearly for both business users and analysts.

---

## Data Analytics – BI & Reporting

**Objective:**  
Leverage SQL-based analytics to uncover key insights in:

-  **Customer Behavior**
-  **Product Performance**
-  **Sales Trends**

These insights empower stakeholders to make **data-driven decisions** and monitor key business metrics effectively.

---
## Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
```
---

##  License

This project is licensed under the [MIT License](LICENSE).  
Feel free to use or modify it with proper credit.

---

##  Let's Connect!

Please feel free to ⭐ the repo or reach out on [LinkedIn](https://www.linkedin.com/in/reuben-samuel-b55b97234/) to connect!

## About Me

I'm a passionate data analyst and researcher with a strong interest in building data-driven solutions. I specialize in database design, data analysis, data visualization, and turning raw data into meaningful insights. I'm always learning and looking for opportunities to solve real-world problems through data.

