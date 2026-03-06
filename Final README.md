# Use-of-Force
CPSC 5071

Link to the original data set: 
https://data.seattle.gov/Public-Safety/Use-Of-Force/ppi5-g2bj/about_data

Unauthorized encampments dataset:
https://data.seattle.gov/City-Administration/Unauthorized-Encampment-Reports/k7ra-jqqe/about_data

1. Project Domain and Goals

This project focuses on analyzing Seattle Police Department use-of-force incidents using a relational database system. The goal of the project is to organize incident, officer, subject, and location data into a structured schema that supports meaningful queries and analysis. By integrating additional contextual data such as unauthorized encampment reports, the dataset can provide more insight into patterns surrounding use-of-force events across different precincts and regions of the city. 

Throughout the project, our team built SQL queries to explore relationships between incidents, officers, and subjects, and used Python and pandas to clean and transform external datasets through an ETL pipeline. In the final stage, we focused on improving query performance by applying database indexing and pandas optimization techniques to evaluate how data access patterns can be made more efficient.

2. Schema design and structure

The database schema was designed to represent the key entities involved in Seattle Police Department use-of-force incidents while maintaining normalized relationships between them. The core table, Instance, stores information about each use-of-force incident, including identifiers, incident type, and occurrence time. Additional tables represent related entities such as Officer, Subject, and Location, allowing the system to capture attributes specific to each entity without duplicating data. 

Because multiple officers and subjects can be associated with the same incident, the schema uses junction tables (Instance_Officer and Instance_Subject) to model these many-to-many relationships. This structure allows each incident to link to multiple officers and subjects while maintaining referential integrity through primary and foreign keys. 

Overall, the schema supports efficient joins, filtering, and aggregation queries, making it suitable for analyzing relationships between incidents, individuals involved, and geographic context.

3. Key SQL and Pandas Workflows

Key SQL workflows included the methods used to explore the Use of Force data set, which were joins and clauses for filtering and aggregation. In SQL, to find all Level 2 Use of Force incidents in our Use of Force data, we conducted an inner join on the Officer, Instance_Officer, Subject and Instance_Subject tables, and then added a "Where" clause to search in the table Instance_Type for Level 2 Use of Force incidents. In another query, we were able to determine the number of incidents against a particular race by joining Instance_Subject on Subject and then grouping by Subject_Race. Our thoughtfully designed schema and database structure made the process of joining the tables and searching for values simplier and more efficient.

Pandas workflows were especially helpful in exploring and cleaning our Encampment data. We determined the columns in our data set with columns(), and then used a for loop to keep only the columns we needed to compare to the Use of Force data set. Pandas also allowed us to easily merge our Use of Force and Encampment data sets. After cleaning the Encampment data set, we added a police precinct column and assigned precincts to our values. This allowed us to conduct a left merge of the Encampments and Use of Force data sets on police precinct. Finally, Pandas helped us produce a derived column called "region" that combined specific values from the community_reporting_area column and zipcode to identify an encampment's location. Having a clearly named location column gave our team the ability to easily determine the general location of an encampment, which will be essential in future analysis.

4. Data Cleaning and Transformation Strategies

Before analysis, both the use-of-force dataset and the encampment dataset required cleaning and preprocessing to ensure the data was consistent and usable. Each dataset was first loaded into pandas and inspected using functions such as head(), info(), and describe() to understand the structure of the data, identify missing values, and verify column data types.

For the use-of-force dataset, rows missing critical identifiers such as the incident ID or occurrence date-time were removed because these fields are necessary to uniquely identify each incident. Other missing values in non-critical columns were replaced with "Unknown" so that the records could still be included in analysis without causing issues in queries or aggregations. The incident timestamp was converted from a string into a pandas datetime object, which allowed additional features such as the year and month to be extracted. These derived variables made it easier to analyze incident trends over time.

The encampment dataset required similar cleaning steps. Column names and formatting were standardized, missing values were handled, and relevant fields were converted to appropriate data types. This ensured that the encampment data could be reliably joined or compared with other datasets in the project.

After cleaning, both datasets were structured so they could be integrated into the relational database and analyzed using SQL joins and pandas workflows. These transformations improved data consistency and enabled more efficient querying and analysis.

5. Summary of key insights

Throughout our project, we were able to create queries and insights consisting of:
   - Filter our datasets based on the subject's race inviolved in a given use-of-force incident.
   - Cases where individuals have encountered more than one use-of-force incident.
   - Discovering specific use-of-force types that an officer has been involved in.
   - Integration of subjects and officers who were involved in a given incident.
   - In terms of data cleaning, we made filtering our database more efficient by creating columns for month and year of a given incident.
   - Merging our dataset with encampments dataset provided insights around geographic data connected to use-of-force incidents.

6. Challenges your team faced and decisions made
   - Working with large real-world datasets and deciding how to structure them in a relational database was a significant challenge. Both of the datasets contained many variables that needed to be narrowed down, as not all of them were useful for our research question. As a result, we had to spend time reviewing the data and determining which fields should actually be included in our schema. This process helped us think more carefully about how database design affects our analyses in the future.
   - Before performing any joins, we had to clean our datasets and make sure the relevant columns were consistent. Ultimately, we used pandas in Python to join the datasets using precinct information. Seeing how the join worked in practice made it clearer how relational databases rely on shared keys to connect tables.
   - Lastly, the biggest challenge our team faced was integrating another database in our project. It was hard to find a key to merge two data sets onsince we needed to have a column to join our two datasets. Ultimately, we chose a database with information on unauthorized encampments which contained similar location data. However, this new dataset did not match with our primary key in our previous schemas, so we had to update on our previous weekly submissions to account for our new data. Ultimately, this turned out to be a great lesson to learn regarding implementation of ETL and working with dynamic datasets.

7. Tools used and how your team collaborated.
   - Thorughout the quarter, we primarily used Jupyter Lab and Google Colab for our python coding, with our primary libraries being pandas and numpy. We used DB Browser for sqlite for our SQL and data management code, along with visual basic for both of these processes as well.
   - GitHub was our main data storage platform, and we wrote up the majority of our documents in Microsoft Word or TextEdit documents.
   - Collaboration throughout this project was "flat" in the sense that everyone contributed equally to each aspect of our project, which made collaboration seamless throughout the quarter.
   - Instead of one person trying to handle everything, we divided tasks such as cleaning the data, organizing the schema, and writing example queries. Discussing these steps together helped us catch mistakes and better understand the reasoning behind certain design choices.
   - Since all of the members of our group were local to Seattle U's campus, we were able to set up a regular cadence of both a weekly in-person meetings and online meetings. 
   - Overall, our collaborative approach helped us adapt to the different requirements of the project seamlessly and also helped us troubleshoot issues more efficiently as well.
