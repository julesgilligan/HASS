# HASS
This is my Human Algorithm Sudoku Solver. I didn't want the routine search algorithm with backtracking so I made this one that searches the way I would. Just faster.

Run the main script with `perl solver.pl [verbose]`. The only recognized verbose keyword is `loud` with everyhting else defaulting to "quiet".

When the program pauses, it is waiting for input of an unsolved sudoku board with 0s or .s in the empty places in the form __400000938032094100095300240370609004529001673604703090957008300003900400240030709__