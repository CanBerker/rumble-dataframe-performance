import os
    
path = '/home/can/Project/sparksoniq-dataframe-perf-v1/allResults/'
listing = os.listdir(path)

q1_results = []
df_q1_results = []

q4_results = []
df_q4_results = []

q5_results = []
df_q5_results = []

def Average(lst): 
    return sum(lst) / len(lst) 

with open('aggregate_results.txt', 'w') as output:
    for infile in listing:
        print("current file is: " + infile)
        with open(path + infile, 'r') as input:
            if infile.startswith("full-df-query1-log"):
                df_q1_results.append(int(input.readline()[10:-1]))
            elif infile.startswith("full-query1-log"):
                q1_results.append(int(input.readline()[10:-1]))
            elif infile.startswith("full-df-query4-log"):
                df_q4_results.append(int(input.readline()[10:-1]))
            elif infile.startswith("full-query4-log"):
                q4_results.append(int(input.readline()[10:-1]))
            elif infile.startswith("full-df-query5-log"):
                df_q5_results.append(int(input.readline()[10:-1]))
            elif infile.startswith("full-query5-log"):
                q5_results.append(int(input.readline()[10:-1]))

    df_q1_avg = Average(df_q1_results)
    q1_avg = Average(q1_results)
    df_q4_avg = Average(df_q4_results)
    q4_avg = Average(q4_results)
    df_q5_avg = Average(df_q5_results)
    q5_avg = Average(q5_results)

    output.writelines([
        "DF-Q1: " + str(df_q1_avg) + "\n",
        "Q1: " + str(q1_avg) + "\n",
        "DF-Q4: " + str(df_q4_avg) + "\n",
        "Q4: " + str(q4_avg) + "\n",
        "DF-Q5: " + str(df_q5_avg) + "\n",
        "Q5: " + str(q5_avg) + "\n",
    ])
