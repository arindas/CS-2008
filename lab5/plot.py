import pandas as pd 
import matplotlib.pyplot as plt 
import sys

if len(sys.argv) >= 2:
    filename = sys.argv[1]
    df = pd.read_csv(filename); print(df); ax = plt.gca(); 
    df.plot(kind='line', x='size', y='sorted', ax=ax)
    df.plot(kind='line', x='size', y='unsorted', ax=ax)
    plt.show()
    
