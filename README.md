# 🛍️ Retail Data Engineering Project using Microsoft Fabric

## 📖 Overview

This project demonstrates an end-to-end data engineering workflow built in Microsoft Fabric. Retail sales data stored in GitHub was ingested into a Fabric Lakehouse using a Data Pipeline, transformed using the Medallion Architecture (Bronze → Silver → Gold), and modeled in a Data Warehouse for analytics.

---

## 🏗️ Architecture

GitHub (Retail CSV)  
↓  
Fabric Data Pipeline (Migration)  
↓  
Lakehouse (UpcomingSrc)  
↓  
Medallion Architecture (Bronze → Silver → Gold)  
↓  
Data Warehouse (Star Schema)  

---

## 📂 Project Workflow

### 1️⃣ Data Source
- Retail CSV file uploaded to GitHub
- Contains transactional sales data

### 2️⃣ Data Ingestion
<p align="center">
  <img src="diagram\Pipeline.png">
</p>
- Created a Fabric Data Pipeline (Migration)
- Connected to GitHub repository
- Ingested CSV data into Lakehouse 

### 3️⃣ Lakehouse Layer
**Lakehouse Name:** `UpcomingSrc`

- Raw retail data stored
- Initial landing layer before transformation

---

## 🏢 Medallion Architecture 
<p align="center">
  <img src="diagram\DataWarehouse.png">
</p>

The Data Warehouse was structured using the Medallion Architecture:

### 🥉 Bronze Layer
- Raw ingested data
- Minimal transformation

### 🥈 Silver Layer
- Cleaned and standardized data
- Removed null values and duplicates
- Corrected data types

### 🥇 Gold Layer
- Business-ready data model
- Star schema design

#### Tables Created:
- FactRetail
- DimDate
- DimDriver
- DimLocation
- DimPayment

---

## 🗄️ Data Warehouse
- Created inside Fabric Workspace
- Implemented star schema modeling
- Optimized for reporting queries

---

## 🛠️ Technologies Used
- Microsoft Fabric
- Fabric Data Pipeline
- Lakehouse
- Data Warehouse
- SQL

---

## 🎯 Key Skills Demonstrated
- End-to-end ETL pipeline development
- GitHub to Lakehouse ingestion
- Medallion Architecture implementation
- Star schema modeling

---
👤 Author

Sumit Vishwakarma
📅 Completed: March 2026

---

⭐️ If you found this project useful, give it a star on GitHub!