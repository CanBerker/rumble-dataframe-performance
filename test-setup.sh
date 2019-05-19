
export SPARK_SUBMIT_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005;
cd ~/Project/sparksoniq
git co master
build
cp target/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar ~/Project/sparksoniq-dataframe-perf-v1/bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar

cd ~/Project/sparksoniq
git co develop-dataframes
build
cp target/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar ~/Project/sparksoniq-dataframe-perf-v1/bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar


cd ~/Project/sparksoniq-dataframe-perf-v1
find . -name "*log.txt" -type f | xargs rm -rf 
find . -name "*output.txt" -type d | xargs rm -rf

# Run tests on full data
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/full-query1.jq --output-path ./query1/full-query1-output.txt --log-path ./query1/full-query1-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/full-query1.jq --output-path ./query1/full-df-query1-output.txt --log-path ./query1/full-df-query1-log.txt --result-size 16000000

noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query4/full-query4.jq --output-path ./query4/full-query4-output.txt --log-path ./query4/full-query4-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query4/full-query4.jq --output-path ./query4/full-df-query4-output.txt --log-path ./query4/full-df-query4-log.txt --result-size 16000000

noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query5/full-query5.jq --output-path ./query5/full-query5-output.txt --log-path ./query5/full-query5-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query5/full-query5.jq --output-path ./query5/full-df-query5-output.txt --log-path ./query5/full-df-query5-log.txt --result-size 16000000



# Run q1 all test sizes
# 500k - short
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/short500k-query1.jq --output-path ./query1/short500k-query1-output.txt --log-path ./query1/short500k-query1-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/short500k-query1.jq --output-path ./query1/short500k-df-query1-output.txt --log-path ./query1/short500k-df-query1-log.txt --result-size 16000000

# 5m - medium
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/medium5m-query1.jq --output-path ./query1/medium5m-query1-output.txt --log-path ./query1/medium5m-query1-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/medium5m-query1.jq --output-path ./query1/medium5m-df-query1-output.txt --log-path ./query1/medium5m-df-query1-log.txt --result-size 16000000

# 16m - full
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/full-query1.jq --output-path ./query1/full-query1-output.txt --log-path ./query1/full-query1-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/full-query1.jq --output-path ./query1/full-df-query1-output.txt --log-path ./query1/full-df-query1-log.txt --result-size 16000000

