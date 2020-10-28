# Computerphile's Sudoku algorithm in Python and Julia: time comparison


### Thank you to the computerphile/numberphile youtube channel, I decided to play with this problem after watching a related video of theirs, and my algorithm is very similar to theirs. It's a variant of the N-Queens backtracking algorithm with a helper function checking if theres a valid placeemnt and then instead of simply a valid placement and backtracking, it iterates through valid placements. It's faster than than brute force but there are some pretty fancy strategy based sudoku algorithms which are fascinating

Given a sudoku board as a 9x9 matrix, theres a straightforward algorithm of solving it  

![img text](pyjl_speeds.png "Title")
