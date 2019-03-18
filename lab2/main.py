import benchmark as bk
import argparse
import matplotlib.pyplot as plt

parser = argparse.ArgumentParser(
        description='Perform benchmark for insertion sort')

parser.add_argument('-ssize',
        help='sample size')
parser.add_argument('-ncases',
        help='number of cases')
parser.add_argument('-ofile',
        help='output file for writing benchmarks')
args = parser.parse_args()

ssize = 10 if args.ssize is None else int(args.ssize)
ncases = 20 if args.ncases is None else int(args.ncases)
ofile = 'benchmark.csv' if args.ofile is None \
        else args.ofile

df = bk.get_benchmark(ssize, ncases)
df.to_csv(ofile)

bk.plot_dataframe(df)


