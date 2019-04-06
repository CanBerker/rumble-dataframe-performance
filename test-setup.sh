
export SPARK_SUBMIT_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005;
git co master
build
cp target/jsoniq-spark-app-0.9.5-jar-with-dependencies.jar ../performance-sparksoniq/jsoniq-spark-app-0.9.5-jar-with-dependencies.jar


git co develop-dataframes
build
cp target/jsoniq-spark-app-0.9.5-jar-with-dependencies.jar ../performance-sparksoniq/df-jsoniq-spark-app-0.9.5-jar-with-dependencies.jar

rm -f *log.txt
rm -f *output.txt

# 500k - short
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./jsoniq-spark-app-0.9.5-jar-with-dependencies.jar --query-path ./short500k-query1.jq --output-path ./short500k-query1-output.txt --log-path ./short500k-query1-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./df-jsoniq-spark-app-0.9.5-jar-with-dependencies.jar --query-path ./short500k-query1.jq --output-path ./short500k-df-query1-output.txt --log-path ./short500k-df-query1-log.txt --result-size 16000000

# 5m - medium
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./jsoniq-spark-app-0.9.5-jar-with-dependencies.jar --query-path ./medium5m-query1.jq --output-path ./medium5m-query1-output.txt --log-path ./medium5m-query1-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./df-jsoniq-spark-app-0.9.5-jar-with-dependencies.jar --query-path ./medium5m-query1.jq --output-path ./medium5m-df-query1-output.txt --log-path ./medium5m-df-query1-log.txt --result-size 16000000

# 16m - full
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./jsoniq-spark-app-0.9.5-jar-with-dependencies.jar --query-path ./full-query1.jq --output-path ./full-query1-output.txt --log-path ./full-query1-log.txt --result-size 16000000
noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./df-jsoniq-spark-app-0.9.5-jar-with-dependencies.jar --query-path ./full-query1.jq --output-path ./full-df-query1-output.txt --log-path ./full-df-query1-log.txt --result-size 16000000


