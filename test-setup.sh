
export SPARK_SUBMIT_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005;
git co master
build
cp target/jsoniq-spark-app-0.9.5-jar-with-dependencies.jar ../performance-sparksoniq/jsoniq-spark-app-0.9.5-jar-with-dependencies.jar


git co develop-dataframes
build
cp target/jsoniq-spark-app-0.9.5-jar-with-dependencies.jar ../performance-sparksoniq/df-jsoniq-spark-app-0.9.5-jar-with-dependencies.jar



noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./jsoniq-spark-app-0.9.5-jar-with-dependencies.jar --query-path ./query1.jq --output-path ./query1-output.txt --log-path ./query1-log.txt --result-size 16000000

noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --conf spark.executor.extraClassPath="lib/" --conf spark.driver.extraClassPath="lib/" ./df-jsoniq-spark-app-0.9.5-jar-with-dependencies.jar --query-path ./query1.jq --output-path ./df-query1-output.txt --log-path ./df-query1-log.txt --result-size 16000000

