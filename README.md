# sparksoniq-dataframe-perf-v1

Confusion data obtained from:
http://lars.yencken.org/datasets/languagegame/

2 smaller sample sets created locally with:  
```
head -n 500000 confusion-2014-03-02.json > confusion500k.json  
head -n 5000000 confusion-2014-03-02.json > confusion5m.json  
```

Compilation and running details are listed in **test-setup.sh** 

Files containing **\*-df-\***  are related to the dataframe implementation.

**\*-log.txt** files contain execution times.






