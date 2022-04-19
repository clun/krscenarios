Create tables `sources_by_group`, `metrics`, `series_by_source_high`, 
`series_by_source_low`, `series_by_metric_high`, `series_by_metric_low` and `statistics_by_source_metric`:
```
cqlsh -e "

USE time_series;

CREATE TABLE sources_by_group (
  group TEXT,
  source TEXT,
  characteristics MAP<TEXT,TEXT>,
  description TEXT STATIC,
  PRIMARY KEY ((group), source)
);

CREATE TABLE metrics (
  bucket TEXT,
  metric TEXT,
  unit TEXT,
  PRIMARY KEY ((bucket), metric)
);

CREATE TABLE series_by_source_high (
  group TEXT,
  source TEXT,
  timestamp TIMESTAMP,
  metric TEXT,
  value DECIMAL,
  PRIMARY KEY ((group, source), timestamp, metric)
) WITH CLUSTERING ORDER BY (timestamp DESC, metric ASC);

CREATE TABLE series_by_source_low (
  group TEXT,
  year INT,
  source TEXT,
  timestamp TIMESTAMP,
  metric TEXT,
  value DECIMAL,
  PRIMARY KEY ((group, year), source, timestamp, metric)
) WITH CLUSTERING ORDER BY (source ASC, timestamp DESC, metric ASC);

CREATE TABLE series_by_metric_high (
  group TEXT,
  metric TEXT,  
  timestamp TIMESTAMP,
  source TEXT,
  value DECIMAL,
  PRIMARY KEY ((group, metric), timestamp, source)
) WITH CLUSTERING ORDER BY (timestamp DESC, source ASC);

CREATE TABLE series_by_metric_low (
  group TEXT,
  year INT,
  metric TEXT,  
  timestamp TIMESTAMP,
  source TEXT,
  value DECIMAL,
  PRIMARY KEY ((group, year, metric), timestamp, source)
) WITH CLUSTERING ORDER BY (timestamp DESC, source ASC);

CREATE TABLE statistics_by_source_metric (
  source TEXT,
  metric TEXT,
  date DATE,
  min DECIMAL,
  max DECIMAL,
  median DECIMAL,
  mean DECIMAL,
  stdev DECIMAL,       
  PRIMARY KEY ((source,metric),date)
) WITH CLUSTERING ORDER BY (date DESC);"
```{{execute}}

