Overview:

This project explores the relationship between infant mortality rates and GDP per capita (PPP) across more than 200 countries and regions. By analyzing these two variables, the goal is to understand how a country's wealth correlates with its infant mortality rate.

The analysis is conducted using R for data processing, reshaping, and visualization. The dataset is sourced from the World Bank, containing historical data on GDP per capita (PPP) starting from 1990 and infant mortality rates from 1960. Both datasets are regularly updated by the World Bank.

Datasets:

GDP per capita, PPP (current international $): https://data.worldbank.org/indicator/NY.GDP.PCAP.PP.CD

Mortality rate, infant (per 1,000 live births): https://data.worldbank.org/indicator/SP.DYN.IMRT.IN

Requirements:

R (version 4.0 or later)
Packages: ggplot2, tidyr, readr

Results:

The project produces a scatter plot with a linear regression line, created using the ggplot2 package.
![image](https://github.com/user-attachments/assets/ec0015a7-2e19-4906-b1d7-741a765da840)

Key Observations:

There is a negative correlation between infant mortality rate and GDP per capita. However, the linear regression model shows some limitations. For instance, when GDP per capita exceeds $48,168.63, the model predicts a negative infant mortality rate, which is not realistic. This demonstrates that the model may not be accurate for countries with very high GDP per capita.

While the scatter plot highlights a general trend—wealthier countries tend to have lower infant mortality rates—it also illustrates one limitation: the graph includes data from every year for every country, making it difficult to discern trends for specific countries.

Example: United States

To better understand the relationship for individual countries, we can narrow the analysis to a single country, such as the United States:
![image](https://github.com/user-attachments/assets/6ba5cd0c-a250-4ca8-a260-34245c95baaf)

GDP per Capita Over Time (United States):
![image](https://github.com/user-attachments/assets/2c8aff6a-0bbc-4fe9-9822-ea724b9de1af)

These plots reveal that the US GDP per capita has steadily increased over time, while the infant mortality rate has consistently decreased.

Conclusion:

This project illustrates the overall relationship between a country's wealth (as measured by GDP per capita) and infant mortality rates. However, to analyze the trends for a specific country, additional analysis is required to account for year-over-year changes and isolate country-specific data.
