#include <string.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct { int label, profit, deadline, time_taken; } job;

void swap (job *jobs, int i, int j) 
{ job temp = jobs[i]; jobs[i] = jobs[j]; jobs[j] = temp; }

void sort_jobs (job *jobs, int start, int end, int *max_deadline) {
	// if there are only zero or one jobs
	// it is already sorted
	if (start >= end)
		return;

	// set middle element as the pivot element
	int pivot = (start + end) / 2;

	// save pivot at start
	swap (jobs, start, pivot);

	int last = start; // last position of pivot

	// find last position of pivot
	for(int i = start; i <= end; i++) { 
		if(jobs[i].profit > jobs[start].profit)
		{ swap(jobs, ++last, i); }

		if(jobs[i].deadline > *max_deadline)
			*max_deadline = jobs[i].deadline;
	}

	// restore pivot
	swap (jobs, last, start);

	sort_jobs (jobs, start, last, max_deadline);
	sort_jobs (jobs, last+1, end, max_deadline);
}

typedef struct { 
	job 	*jobs; 
	int 	njobs;
	
	int 	*list;
	int 	nslots;
	
	int 	profit;
} job_sequence;

job_sequence get_job_sequence (job *jobs, int size) {
	int max_deadline = 0, profit = 0, seq_size;
	sort_jobs (jobs, 0, size-1, &max_deadline);

	seq_size = max_deadline + 1; 
	int *list = malloc (sizeof(int) * seq_size);
	bzero (list, sizeof(int) * seq_size);

	for (int i = 0; i < size; i++) {
		job j = jobs[i];
		int t = j.deadline - j.time_taken + 1;

		while (t > 0) {
			// if this slot is empty
			if (!list[t]) {
				int slot = j.time_taken;
				
				// fill all slots occupied 
				// by this job during execution
				while(slot--) 
					list[t+slot] = j.label; 
				
				profit += j.profit;
				break;
			}

			// go to the previous time slot
			t -= j.time_taken;
		}
	}

	return (job_sequence) {.jobs = jobs, .njobs = size, 
		.list = list, .nslots = seq_size, .profit = profit }; 
}

void unregister (job_sequence seq) {
	free(seq.list); seq.list = NULL;
	free(seq.jobs); seq.jobs = NULL;
	seq.njobs = seq.nslots = seq.profit = 0;
}

void read_jobs (job *jobs, int njobs, FILE *infile) {
	for (int i = 0; i < njobs; i++) {
		job *j = jobs+i;
		
		fscanf(infile, "%d", &j->label);
		fscanf(infile, "%d", &j->profit);
		fscanf(infile, "%d", &j->deadline);
		fscanf(infile, "%d", &j->time_taken);
	}
}

void write_jobs (job *jobs, int njobs, FILE *outfile) {
	fprintf (outfile, "%-5s %-6s %-8s %-10s\n", 
			"label", "profit", "deadline", "time_taken");

	for (int i = 0; i < njobs; i++) {
		job j = jobs[i];
		fprintf (outfile, "%-5d %-6d %-8d %-10d\n", 
			j.label, j.profit, j.deadline, j.time_taken);

	}
}

void write_job_seq (job_sequence seq, FILE *outfile) {
	fprintf (outfile, "Jobs that were sequenced:\n"); 
	write_jobs (seq.jobs, seq.njobs, outfile);

	fprintf (outfile, "Computed job sequence:\n");
	for (int i = 1; i < seq.nslots; i++) 
		fprintf(outfile, "%d ", seq.list[i]);

	fprintf(outfile, "\nTotal profit: %d\n", seq.profit);
}

int main (int argc, char *args[]) {
	printf ("Enter number of jobs to be entered: ");
	int njobs; scanf("%d", &njobs);

	job *jobs = malloc (sizeof(job) * njobs);
	
	fprintf (stdout, "%-5s %-5s %-8s %-10s\n", 
			"label", "profit", "deadline", "time_taken");

	read_jobs (jobs, njobs, stdin);

	job_sequence seq = get_job_sequence(jobs, njobs);
	write_job_seq (seq, stdout);
	
	unregister (seq);
	return 0;
}
