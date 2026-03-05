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
