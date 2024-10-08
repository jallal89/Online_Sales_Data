# SQL and Tableau dashboard Project: Online_Sales_Data


## Discription: 
This dataset has information about customers and their orders from online sales data. The dataset has two files, Orders, which include info about customers, such as their name, city, state and more; and the other file is purchase_details, which has details about orders such as profit, quantity, category of sales orders and more. First, I opened dataset in Excel, arranged everything, cleaned from empty cells, incorrrect data. Then, I created a DB in SQL Server, imported the data, wrote and ran 24 SELECT Statements (Queries) to explore the data. Then, I created a complete dashboard in Tableau, the link is provided in the "Tools Used" section below.
## Files in this project: 
- online_sales_data.sql: This has all SQL querries and explanation for each
- queries_results.PDF: This has answers for all queries, basically, it shows how results look in Grid when you click on "Run" in SQL Server
- tableau_dashboard.pdf: A pdf that has all tableau work saved in it
- Note: The link provided to Tableau Public shows the visualizations much better than the ones in pdf
- Also: In the packed bubbles, some of the bubbles do not show labels until you click on them, this is due to Tableau label and visibility sizes
## Languages Used: 
- SQL

## Tools Used: 
- SQL Server Management Studio (SSMS)
- Tableau
- Tableau Public dashboard link: https://public.tableau.com/views/book-1_17282658291020/onlineordersdashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
##   Dataset Source: 
- Online Sales Data from Kaggle
- Link to dataset: https://www.kaggle.com/datasets/samruddhi4040/online-sales-data
-  CC0: Public Domain license: Meaning you can download it and work on it since it is public domain
-  Note: Please don't copy my work from this project, feel free to download dataset from the link and do your own work

## Project Key Findings and Analysis 
- Of all items, more money was spent on printers (electronics) than any other sub-category, $59,252.00
- Saree (clothing category) had more online sales orders (quantity) than any other one, 795, while tables had the least, 61
- A total of 2456 (quantity) items were purchased online by using the payment mode, COD (cash on delivery), while Debit card at 741
- The city of Indore had the most online sales orders (940), while city of Prayagraj only had 43 in total, the least
- Up to 25 cities in India had at least 40 online sales orders each, with Indore the most, 940
- City of Indore had spend the most (amount) at $63,680.00, while Mumbai at second place, $58,886.00
- City of Kashmire spent up to $10,829.00 by ordering 177 online sales items
- 17 different sub-categories were purchased online by customers from India, with saree (clothes) the most, 795
