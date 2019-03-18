#include <stdio.h>

#include "lcs.h"

int main(int argc, char *args[]) {

	char x[] = "ABCBDAB", y[] = "BDCABA";

	string_t X = (string_t) {.string = x, .length = 7};
	string_t Y = (string_t) {.string = y, .length = 6};

	lcs_matrix_t M = generate_lcs_matrix(X, Y);

	printf("X = %s, Y = %s\nLCS matrix:\n", x, y);
	write_lcs_matrix ( M, std_write_cell_fn, std_write_line_sep_fn);

	string_t s = get_lcs_string (M, X, M.rows-1, M.cols-1);

	printf("LCS: %s\n", s.string);
}
