### This is a sample DBT and Great Expectations project for MIS-581 (CSU-Global)

### Note: This is a modified starter project taken from DBT's official documentation, and expanded to include Great Expectations

# The goal of this project is to explore using DBT and Great Expectations--among other Python/SQL based tooling to perform data quality validation against sample health-related datasets. There is also a Notebook stored within the Analysis folder titled, data_quality_analysis_notebook.ipynb that shows some example tests that can be run using a Pandas Profiler library. This tool offers rather simple data profiling once the dataset has been loaded and coverted into a dataframe.

To run, use the following commands:
- dbt run
- dbt test


### Great Exppectations:
- great_expectations new datasource
- great_expectations suite new

