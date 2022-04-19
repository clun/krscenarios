Load data into table `sources_by_group`:
```
dsbulk load -url sources.csv       \
            -k time_series         \
            -t sources_by_group    \
            -header true           \
            -logDir /tmp/logs
```{{execute}}

Retrieve rows from table `sources_by_group`:
```
cqlsh -e "
SELECT group, source, description, 
       characteristics['Model number'] 
FROM time_series.sources_by_group;"      
```{{execute}}

Load data into table `metrics`:
```
dsbulk load -url metrics.csv       \
            -k time_series         \
            -t metrics             \
            -header true           \
            -logDir /tmp/logs
```{{execute}}

Retrieve rows from table `metrics`:
```
cqlsh -e "SELECT * FROM time_series.metrics;"      
```{{execute}}

Load data into tables `series_by_source_high` and `series_by_metric_high`:
```
dsbulk load -url series_high_resolution.csv \
            -k time_series                  \
            -t series_by_source_high        \
            -header true                    \
            -logDir /tmp/logs
            
dsbulk load -url series_high_resolution.csv \
            -k time_series                  \
            -t series_by_metric_high        \
            -header true                    \
            -logDir /tmp/logs                        
```{{execute}}

Retrieve rows from tables `series_by_source_high` and `series_by_metric_high`:
```   
cqlsh -e "SELECT * FROM time_series.series_by_source_high LIMIT 5;"   
cqlsh -e "SELECT * FROM time_series.series_by_metric_high LIMIT 5;"                                         
```{{execute}}

Load data into tables `series_by_source_low` and `series_by_metric_low`:
```
dsbulk load -url series_low_resolution.csv  \
            -k time_series                  \
            -t series_by_source_low         \
            -header true                    \
            -logDir /tmp/logs
            
dsbulk load -url series_low_resolution.csv  \
            -k time_series                  \
            -t series_by_metric_low         \
            -header true                    \
            -logDir /tmp/logs
```{{execute}}

Retrieve rows from tables `series_by_source_low` and `series_by_metric_low`:
```
cqlsh -e "SELECT * FROM time_series.series_by_source_low LIMIT 5;"   
cqlsh -e "SELECT * FROM time_series.series_by_metric_low LIMIT 5;"      
```{{execute}}

Load data into table `statistics_by_source_metric`:
```
dsbulk load -url statistics_by_source_metric.csv \
            -k time_series                       \
            -t statistics_by_source_metric       \
            -header true                         \
            -logDir /tmp/logs
```{{execute}}

Retrieve rows from table `statistics_by_source_metric`:
```
cqlsh -e "SELECT * FROM time_series.statistics_by_source_metric LIMIT 5;"      
```{{execute}}

