import Base

# sudoku problems from python

computerphile_base = [
        [5, 3, 0, 0, 7, 0, 0, 0, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 0, 0]]
# PYTHON: 2 solutions, --- 0.13976192474365234 seconds ---
# JULIA: 2 solutions,  --- 0.035505 seconds ---

medium_1 = [
        [0, 0, 0, 0, 7, 0, 4, 0, 0],
        [6, 7, 3, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 3, 9, 0, 5, 0, 0],
        [3, 0, 2, 0, 0, 0, 0, 0, 8],
        [0, 0, 7, 0, 1, 0, 0, 0, 9],
        [0, 0, 0, 5, 0, 2, 0, 0, 0],
        [0, 0, 0, 2, 5, 8, 0, 3, 0],
        [0, 0, 0, 0, 0, 7, 0, 4, 0],
        [5, 6, 0, 0, 0, 0, 0, 0, 0]]
# PYTHON: 11 solutions, --- 0.25779104232788086 seconds ---
# JULIA: 11 solutions,  --- 0.056143 seconds ---

hard_1 = [
        [3, 7, 0, 0, 0, 9, 0, 0, 6],
        [8, 0, 0, 1, 0, 3, 0, 7, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 8],
        [0, 2, 0, 0, 8, 0, 0, 0, 5],
        [1, 8, 7, 0, 0, 0, 6, 4, 2],
        [5, 0, 0, 0, 2, 0, 0, 1, 0],
        [7, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 5, 0, 6, 0, 2, 0, 0, 7],
        [2, 0, 0, 3, 0, 0, 0, 6, 1]]
# PYTHON: 1 solution, --- 0.2648599147796631 seconds ---
# JULIA: 1 solution,  --- 0.058430 seconds ---

hard_2 = [
        [0, 0, 3, 0, 0, 0, 0, 0, 0],
        [8, 0, 9, 4, 6, 0, 7, 0, 2],
        [2, 0, 0, 0, 1, 8, 6, 0, 0],
        [0, 0, 0, 0, 0, 6, 0, 7, 0],
        [0, 0, 8, 0, 0, 0, 4, 0, 0],
        [0, 7, 0, 8, 0, 0, 0, 0, 0],
        [0, 0, 2, 9, 4, 0, 0, 0, 5],
        [4, 0, 6, 0, 3, 2, 8, 0, 7],
        [0, 0, 0, 0, 0, 0, 2, 0, 0]]
# PYTHON: 1 solution, --- 0.9040899276733398 seconds ---
# JULIA: 1 solution,  --- 0.116727 seconds ---

ultra_hard_1 = [
        [0, 0, 5, 3, 0, 0, 0, 0, 0],
        [8, 0, 0, 0, 0, 0, 0, 2, 0],
        [0, 7, 0, 0, 1, 0, 5, 0, 0],
        [4, 0, 0, 0, 0, 5, 3, 0, 0],
        [0, 1, 0, 0, 7, 0, 0, 0, 6],
        [0, 0, 3, 2, 0, 0, 0, 8, 0],
        [0, 6, 0, 5, 0, 0, 0, 0, 9],
        [0, 0, 4, 0, 0, 0, 0, 3, 0],
        [0, 0, 0, 0, 0, 9, 7, 0, 0]]
# this one is apparently the hardest for humans to do, written by finnish mathematician Arto Inkala
# PYTHON: 1 solution, --- 1.2927770614624023 seconds ---
# JULIA: 1 solution,  --- 0.178240 seconds seconds ---

function possible(grid, x, y, n)
    range9 = Array{Int64,1}[1:9]
    range3 = Array{Int64,1}[1:3]
    
    for i in range9[1]
        if grid[i][y] == n
            return false
        end
    end
    
    for i in range9[1]
        if grid[x][i] == n
            return false
        end
    end
        
    x0 = (ceil(Int64, x / 3 ) - 1) * 3
    y0 = (ceil(Int64, y / 3 ) - 1) * 3
    # if this seems like an unholy abomination, thats because it is. I with Julia arrays started at 0
#     println(typeof(1))
    for i in range3[1]
        for j in range3[1]
            if (grid[x0 + i][y0 + j] == n)
                return false
            end
        end
    end
    return true
end

function solve(grid)
    range9 = Array{Int64,1}[1:9]
    for i in range9[1]
        for j in range9[1]
            if grid[i][j] == 0
                for x in range9[1]
                    if possible(grid, i, j, x)
                        grid[i][j] = x
                        solve(grid)
                        grid[i][j] = 0
                    end
                end
                return
            end
        end
    end
    Base.print_matrix(stdout, grid)
    println("\n")
end

@time solve(ultra_hard_1)

