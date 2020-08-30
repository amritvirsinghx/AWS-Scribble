#import python libraries
import sys
from datetime import datetime

#import pyspark libraries
from pyspark.context import SparkContext
import pyspark.sql.functions as f

#import glue libraries
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from awsglue.dynamicframe import DynamicFrame
from awsglue.context import GlueContext
from awsglue.job import Job

#initialize session
sc = SparkContext.getOrCreate()
glue_context = GlueContext(sc)
spark = glue_context.spark_session
job = Job(glue_context)

#Parameters
glue_db = "movies-db"
glue_tbl = "awsglueinput"
s3_write_path ="s3://awsglueout"

#Extract Data

#log starting time
dt_start = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
print("Start time:", dt_start)

#read movie data to glue dynamic frame
dynamic_frame_read = glue_context.create_dynamic_frame.from_catalog(database = glue_db,table_name = glue_tbl)

#convert dynamic frame to data frame to use standard pyspark functions
data_frame = dynamic_frame_read.toDF()

#Transform and modify data

#creating decade column from year
decade_col = f.floor(data_frame["year"]/10)*10
data_frame = data_frame.withColumn("decade",decade_col)

#group by decade: Cound movies, get average rating
data_frame_aggregated = data_frame.groupby("decade").agg( 
    f.count(f.col("movie_title")).alias('movie_count'),
    f.mean(f.col("rating")).alias("rating_mean"),
    ) 

#sort by the number of movies per the decade
data_frame_aggregated = data_frame_aggregated.orderBy(f.desc("movie_count"))

#print result table

data_frame_aggregated.show(5)

#write data to S3

#creating 1 partititon as dataframe is small
data_frame_aggregated = data_frame_aggregated.repartition(1)

#convert back to pyspark frame
dynamic_frame_write = DynamicFrame.fromDF(data_frame_aggregated, glue_context, "dynamic_frame_write")

#writing to S3

glue_context.write_dynamic_frame.from_options(
    frame = dynamic_frame_write,
    connection_type ="s3",
    connection_options ={
        "path" : s3_write_path
    },
    format = "csv"
)

#log endtime
dt_end= datetime.now().strftime("%Y-%m-%d %H:%M:%S")
print("End time",dt_end)


    