#include <errno.h>
#include <stdlib.h>
#include <stdio.h>

#include "lcs.h"

lcs_matrix_t allocate (int rows, int cols) {
	lcs_matrix_cell_t **m = malloc(rows * sizeof(lcs_matrix_cell_t *));

	if(!m) { errno = ENOMEM; m = NULL; }

	int i; 

	for (i = 0; m && i < rows; i++) {
		m[i] = malloc(cols * sizeof(lcs_matrix_cell_t));
		
		if (!m[i]) { errno = ENOMEM; break; }
		
		for (int j = 0; j < cols; j++) 
			m[i][j] = (lcs_matrix_cell_t){0, 0};
		
	}

	if (errno == ENOMEM) {
		while(i) 
			free(m[i--]);
		
		m = NULL;
		rows = cols = 0;
	}

	return (lcs_matrix_t) {.m = m, .rows = rows, .cols = cols};
}

void deallocate (lcs_matrix_t m) {
	while(m.rows) 
		free(m.m[--m.rows]); 
	
	free(m.m); m.cols = 0;
}

void write_lcs_matrix(lcs_matrix_t m, write_cell_fn fn, write_line_sep_fn sep_fn) {
	for (int i = 0; i < m.rows; i++) {
		for (int j = 0; j < m.cols; j++) {
			fn(m.m[i][j]);
		}

		sep_fn();
	}
}

void std_write_cell_fn (lcs_matrix_cell_t cell) {
	char dir[] = {'^', '<', '`'};
	
	printf("%3d%c", cell.val, dir[cell.dir]);
} 

void std_write_line_sep_fn () { printf("\n"); }

lcs_matrix_t generate_lcs_matrix (string_t X, string_t Y) {
	lcs_matrix_t M = allocate (X.length+1, Y.length+1);

	for (int i = 1; i <= X.length; i++) {
		for(int j = 1; j <= Y.length; j++) {
			
			if (X.string[i-1] == Y.string[j-1]) 
				M.m[i][j] = (lcs_matrix_cell_t) {
					.val = M.m[i-1][j-1].val+1, .dir = TOP_LEFT };
			
			else if (M.m[i-1][j].val >= M.m[i][j-1].val) 
				M.m[i][j] = (lcs_matrix_cell_t) {
					.val = M.m[i-1][j].val, .dir = TOP };

			else 
				M.m[i][j] = (lcs_matrix_cell_t) {
					.val = M.m[i][j-1].val, .dir = LEFT };

		}
	
	}

	return M;
}

string_t get_lcs_string (lcs_matrix_t M, string_t X, int i, int j) {
	if (!i || !j) 
		return (string_t) {.string = NULL, .length = 0};

	char *string = malloc( M.m[i][j].val + 1);
	
	string_t str = (string_t) {
		.string = string, .length = M.m[i][j].val };
	
	str.string[str.length] = 0; // '\0'

	int p = str.length - 1;

	while (i != 0 && j != 0 && p >= 0) {
		int di = 0, dj = 0;

		switch(M.m[i][j].dir) {
			case TOP:
				di = -1;
				break;
			case LEFT:
				dj = -1;
				break;
			case TOP_LEFT:
				di = dj = -1;
				str.string[p--] = X.string[i-1];
		}

		i += di; j += dj;
	}

	return str;
} 
