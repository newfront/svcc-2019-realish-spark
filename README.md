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

### Running the Follow Along Environment
1. Starting the Zeppelin Environment: `cd /path/to/svcc-2019-realish-spark/ && ./run.sh deploy && ./run.sh start`
2. Stopping the environment: `cd /path/to/svcc-2019-realish-spark/ && ./run.sh stop`
3. Zeppelin Info: "https://zeppelin.apache.org/docs/latest/interpreter/spark.html"


#### Optional: Enhancing your Zeppelin Experience (Bring new Spark version)
1. Jump onto the docker process: `docker exec -it zeppelin bash`
2. VIEW env variables: `cat /conf/zeppelin-env.sh.template`
3. SEE `SPARK_HOME`. You can now point this to locally installed SPARK
~~~
brew install wget && cd ~/Desktop && wget http://mirror.cc.columbia.edu/pub/software/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && tar -xvzf spark-2.4.4-bin-hadoop2.7.tgz && mv spark-2.4.4-bin-hadoop2.7 spark-2.4.4

curl -XGET http://mirror.cc.columbia.edu/pub/software/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz > ~/Desktop/spark-2.4.4.tgz && cd ~/Desktop && tar -xvzf spark-2.4.4.tgz && rm spark-2.4.4.tgz
~~~

4. Now `export SPARK_HOME=~/Desktop/spark-2.4.4/`
5. Use `./run.sh deployCustom` to now use your own local Spark

### Updating Configurations
1. **Zeppelin Configuration** http://localhost:8080/#/configuration
2. **Zeppelin Interpreters**  http://localhost:8080/#/interpreter (configure spark here)
3. If you want to use `spark-redis` from Zeppelin. Update the Zeppelin Interpreter for Spark and under `Dependencies` add `com.redislabs:spark-redis:2.0.4` and restart the interpreter.
4. Suggested Spark Configurations (double the docker cores, use 1g less than total docker memory allocation)
~~~bash
spark.cores.max: 4
spark.executor.memory: 4g
~~~

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
