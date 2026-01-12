# 🍕 Pizza Sales Performance Dashboard (SQL + Power BI)

This project is an end-to-end data analytics solution built using **SQL and Power BI**.  
It analyzes pizza sales data to understand customer behavior, product performance, and revenue trends for a pizza restaurant.

## 📊 Business Objective
The goal of this project is to help a pizza restaurant answer:
- Which pizzas and sizes sell the most?
- When do customers place the most orders?
- Which categories generate the highest revenue?
- How is the business performing over time?

These insights can support better decisions in pricing, promotions, inventory, and staffing.

## 🗂 Dataset
The dataset consists of four relational tables:

- `orders` – Order date and time  
- `order_details` – Items and quantities in each order  
- `pizzas` – Pizza sizes and prices  
- `pizza_types` – Pizza names and categories  

These tables were connected using a star schema in Power BI.

## 🔍 Data Analysis Using SQL
SQL was used to explore and validate the data before building the dashboard.  
Key analyses included:
- Total orders and total revenue  
- Top 5 pizzas by quantity sold  
- Most profitable pizza sizes  
- Category-wise sales  
- Order distribution by time of day  

All SQL queries are available in the `sql_queries` folder.

## 📈 Power BI Dashboard

### Sales Performance
- KPI cards for Total Orders, Quantity Sold, and Total Revenue  
- Top 5 pizzas by quantity  
- Quantity sold by pizza size  
- Sales by category  
- Peak order time analysis  
- Revenue by pizza size  
- Interactive slicers for category, size, time, and pizza name  

## 🛠 Tools Used
- **SQL** – Data analysis and validation  
- **Power BI** – Data modeling, DAX, and visualization  
- **CSV files** – Data source  

## 📌 Key Insights
- Large pizzas generate the highest revenue  
- Chicken and Classic pizzas are the top-performing categories  
- Orders peak during lunch and dinner hours  
- Revenue shows consistent growth over time  

## 🚀 Why this project matters
This dashboard demonstrates how SQL and Power BI can be used together to create a real business intelligence solution that helps restaurant managers make data-driven decisions.
