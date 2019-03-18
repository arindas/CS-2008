from insertion_sort import sort

import numpy as np
import pandas as pd
from time import process_time
import matplotlib.pyplot as plt

def get_time(A, compF):
    t_0 = process_time()
    sort(A, 0, len(A)-1, compF)
    t_1 = process_time()
    return t_1 - t_0

def get_benchmark(sample_size, ncases):
    columns=['size', 'best_case', 'worst_case', 'average_case']
    df = pd.DataFrame(columns=columns)
                       
    print('{0:<6s} {1:<15s} {2:<15s} {3:<15s}'.format(*columns))
    for i in range(1, ncases):
        size = sample_size * i
        
        as_c = lambda x, y: 1 if x > y \
                else -1 if x < y \
                else 0
        ds_c = lambda x, y: -as_c(x, y)

        # Average case time
        A = np.random.random_sample(size)
        t_average = get_time(A, as_c)

        # Best case time
        t_best = get_time(A, as_c)

        # Worst case time
        t_worst = get_time(A, ds_c)
        
        # print logs
        print('{0:<6d} {1:<15f} {2:<15f} {3:<15f}'
                .format(i, t_best, t_worst, t_average))

        # insert data into the dataframe
        df.loc[i] = [i, t_best, t_worst, t_average]

    return df

def plot_dataframe(df):
    x_axis = df.columns[0]
    for column in df.columns[1:]:
        ax = plt.gca()
        df.plot(kind='line',x=x_axis,
                y=column, ax = ax)
    plt.show()


