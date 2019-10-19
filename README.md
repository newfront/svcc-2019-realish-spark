# svcc-2019-realish-spark
This is the material for the 2019 Silicon Valley Code Camp Session "Realish Time Predictive Analytics with Spark Structured Streaming"

### About the Speaker
Find me on Twitter: [@newfront](https://twitter.com/newfront)
Find me on Medium [@newfrontcreative](https://medium.com/@newfrontcreative)
About Twilio: [Twilio](https://twilio.com)

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

### Zeppelin
Zeppelin Project Info: "https://zeppelin.apache.org/docs/latest/interpreter/spark.html"

### Running the Follow Along Environment
**IMPORTANT**: Notebooks use Spark 2.4.4

You must download spark 2.4.4 in order to run the examples
~~~
brew install wget && cd ~/Desktop && wget http://mirror.cc.columbia.edu/pub/software/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && tar -xvzf spark-2.4.4-bin-hadoop2.7.tgz && mv spark-2.4.4-bin-hadoop2.7 spark-2.4.4

curl -XGET http://mirror.cc.columbia.edu/pub/software/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz > ~/Desktop/spark-2.4.4.tgz && cd ~/Desktop && tar -xvzf spark-2.4.4.tgz && rm spark-2.4.4.tgz
~~~

1. Export SPARK_HOME to your bash/terminal session `export SPARK_HOME=~/Desktop/spark-2.4.4/`
2. Starting the Zeppelin Environment: `cd /path/to/svcc-2019-realish-spark/ && ./install.sh && ./run.sh deployCustom && ./run.sh start`
3. Stopping the environment: `cd /path/to/svcc-2019-realish-spark/ && ./run.sh stop`
4. Zeppelin should be running on `http://localhost:8080` - Click on the Notebooks `SVCC` and start with `1-SparkIntro`. Click the Play button on the top of the notebook (`Play All`) to load and run everything. Follow the links at the bottom of each notebook to go from `1-5`. Enjoy

### Updating Zeppelin Configurations
1. **Zeppelin Configuration** http://localhost:8080/#/configuration
2. **Zeppelin Interpreters**  http://localhost:8080/#/interpreter (configure spark here)
3. If you want to use `spark-redis` from Zeppelin (for Notebook #5). Update the Zeppelin Interpreter for Spark and under `Dependencies` add `com.redislabs:spark-redis:2.4.0` and restart the interpreter. If you have problems getting this to install. Try running `docker exec -it zeppelin 
4. Suggested Spark Configurations (double the docker cores, use 1g less than total docker memory allocation)
~~~bash
spark.cores.max: 4
spark.executor.memory: 12g
~~~

### Running Spark-Shell in the Docker Container
~~~
docker exec -it zeppelin /spark/bin/spark-shell
~~~

ZEPPELIN_INTERPRETER_LOCALREPO



#### Enhancing your Zeppelin Experience (Bring new Spark version)
1. Jump onto the docker process: `docker exec -it zeppelin bash`
2. VIEW env variables: `cat /conf/zeppelin-env.sh.template`
3. SEE `SPARK_HOME`. You can now point this to locally installed SPARK




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
