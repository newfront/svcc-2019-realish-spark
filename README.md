# svcc-2019-realish-spark
This is the material for the 2019 Silicon Valley Code Camp Session "Realish Time Predictive Analytics with Spark Structured Streaming"

## Note: Dockerfile, Materials and Presentation will be uploaded on October 16th, 2019.

[Session Overview Link](https://www.siliconvalley-codecamp.com/Session/2019/real-ish-time-predictive-analytics-with-spark-structured-streaming)

### Follow Along Requirements
If you are planning to follow along during the presentation you will need to have the following installed on your local machine.

1. Docker
2. System Terminal (iTerm, Terminal, etc)
2. Working Web Browser (Chrome or Firefox)

### Docker
1. Install Docker Desktop (https://www.docker.com/products/docker-desktop)
Additional Docker Resources:
* https://docs.docker.com/get-started/
* https://hub.docker.com/

#### Docker Runtime Recommendations
1. 2 or more cpu cores.
2. 8gb/ram or higher.

### Session Overview

#### A Gentle Introduction to Apache Spark DataFrames (10 minutes)
* Loading data (read / readStream)
* Schemas / Schema Inference
* StructTypes and structures
* Creating tempViews and SparkSQL
* Writing data (write / writeStream)

#### Exploratory Data Analysis with Apache SparkSQL and Apache Zeppelin (25 - 30 minutes)
* Discuss the built in org.apache.spark.sql.functions._ (col.describe, stat methods) and how to explore data statistics
* Show how to transform a DataFrame (withColumn)
* Working with timestamps / windowing (sql functions, groupBy and groupBy(window))
* Show how to add a UDF (zScoreNormalize)
* Zeppelin Graphing to the rescue for help visualizing with EDA flow
* Joins and fixing data (field imputation strategy)

#### Quick and Dirty SparkML Predictive Models (by use case) (5 minutes)
* Introduction to SparkML Pipelines
* Introduction to SparkML Transformers
* Introduction to basic SparkML Models

#### Spark Structured Streaming (loading model into a stream) (Start here and work backwards through the use case) (5 minutes)
* Read a Stream of data from Redis/Kafka
* Transform the data
* Apply new column to the DataFrame by transforming through a loaded SparkML model
* Write the prediction Stream to Redis/Kafka

#### Questions and Answers (5 minutes -> overtime)
