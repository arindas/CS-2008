import pandas as pd 
import matplotlib.pyplot as plt 
import sys

if len(sys.argv) >= 2:
    filename = sys.argv[1]
    df = pd.read_csv(filename)
    ax = plt.gca()
    df.plot(kind='line', x='size', y='worst_case', ax=ax)
    df.plot(kind='line', x='size', y='average_case', ax=ax)
    df.plot(kind='line', x='size', y='best_case', ax=ax)
    plt.show()
    