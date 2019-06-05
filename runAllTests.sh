cd ~/Project/sparksoniq-dataframe-perf-v1
find . -name "*log.txt" -type f | xargs rm -rf 
find . -name "*output.txt" -type d | xargs rm -rf


for i in {1..5}
do
    echo "Iteration: $i "
    noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --driver-memory 6G ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/full-query1.jq --output-path ./query1/full-query1-output.txt --log-path ./query1/full-query1-log.txt --result-size 16000000
    noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --driver-memory 6G ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query1/full-query1.jq --output-path ./query1/full-df-query1-output.txt --log-path ./query1/full-df-query1-log.txt --result-size 16000000

    noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --driver-memory 6G ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query4/full-query4.jq --output-path ./query4/full-query4-output.txt --log-path ./query4/full-query4-log.txt --result-size 16000000
    noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --driver-memory 6G ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query4/full-query4.jq --output-path ./query4/full-df-query4-output.txt --log-path ./query4/full-df-query4-log.txt --result-size 16000000

    noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --driver-memory 6G ./bin/jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query5/full-query5.jq --output-path ./query5/full-query5-output.txt --log-path ./query5/full-query5-log.txt --result-size 16000000
    noglob spark-submit --class sparksoniq.Main --master local[*] --deploy-mode client --driver-memory 6G ./bin/df-jsoniq-spark-app-0.9.6-jar-with-dependencies.jar --query-path ./query5/full-query5.jq --output-path ./query5/full-df-query5-output.txt --log-path ./query5/full-df-query5-log.txt --result-size 16000000

    mv ./query1/full-query1-log.txt ./allResults/full-query1-log${i}.txt
    mv ./query1/full-df-query1-log.txt ./allResults/full-df-query1-log${i}.txt
    mv ./query4/full-query4-log.txt ./allResults/full-query4-log${i}.txt
    mv ./query4/full-df-query4-log.txt ./allResults/full-df-query4-log${i}.txt
    mv ./query5/full-query5-log.txt ./allResults/full-query5-log${i}.txt
    mv ./query5/full-df-query5-log.txt ./allResults/full-df-query5-log${i}.txt

    find . -name "*output.txt" -type d | xargs rm -rf
done