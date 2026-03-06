# Use-of-Force
CPSC 5071

Link to the original data set: 
https://data.seattle.gov/Public-Safety/Use-Of-Force/ppi5-g2bj/about_data

Unauthorized encampments dataset:
https://data.seattle.gov/City-Administration/Unauthorized-Encampment-Reports/k7ra-jqqe/about_data



4. Data Cleaning and Transformation Strategies

Before analysis, both the use-of-force dataset and the encampment dataset required cleaning and preprocessing to ensure the data was consistent and usable. Each dataset was first loaded into pandas and inspected using functions such as head(), info(), and describe() to understand the structure of the data, identify missing values, and verify column data types.

For the use-of-force dataset, rows missing critical identifiers such as the incident ID or occurrence date-time were removed because these fields are necessary to uniquely identify each incident. Other missing values in non-critical columns were replaced with "Unknown" so that the records could still be included in analysis without causing issues in queries or aggregations. The incident timestamp was converted from a string into a pandas datetime object, which allowed additional features such as the year and month to be extracted. These derived variables made it easier to analyze incident trends over time.

The encampment dataset required similar cleaning steps. Column names and formatting were standardized, missing values were handled, and relevant fields were converted to appropriate data types. This ensured that the encampment data could be reliably joined or compared with other datasets in the project.

After cleaning, both datasets were structured so they could be integrated into the relational database and analyzed using SQL joins and pandas workflows. These transformations improved data consistency and enabled more efficient querying and analysis.

5. Summary of key insights


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
