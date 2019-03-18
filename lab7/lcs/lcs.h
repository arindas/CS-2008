#ifndef lcs_h 
#define lcs_h

#define TOP  		0
#define LEFT 		1
#define TOP_LEFT 	2 


typedef struct {
	unsigned int dir: 2; 	 
	unsigned int val: 32;	
} lcs_matrix_cell_t;

void std_write_cell_fn (lcs_matrix_cell_t);

typedef struct {
	unsigned int length;
	char 		*string;
} string_t;

typedef struct {
	lcs_matrix_cell_t 	**m;
	unsigned int 		rows, cols;
} lcs_matrix_t;

lcs_matrix_t allocate (int rows, int cols);

void deallocate (lcs_matrix_t);

typedef void (*write_cell_fn) (lcs_matrix_cell_t);

typedef void (*write_line_sep_fn) ();

void std_write_line_sep_fn ();

void write_lcs_matrix (lcs_matrix_t, write_cell_fn, write_line_sep_fn);

lcs_matrix_t generate_lcs_matrix(string_t X, string_t Y);

string_t get_lcs_string(lcs_matrix_t M, string_t X, int i, int j);

#endif
