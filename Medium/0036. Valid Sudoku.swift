//Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
//Each row must contain the digits 1-9 without repetition.
//Each column must contain the digits 1-9 without repetition.
//Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
//Note:
//A Sudoku board (partially filled) could be valid but is not necessarily solvable.
//Only the filled cells need to be validated according to the mentioned rules.

import Foundation

class Solution {
    func submatrix(matrix: [[Character]], startRow: Int, endRow: Int, startColumn: Int, endColumn: Int) -> [[Character]]? {
        let submatrix = matrix[startRow..<endRow].map { $0[startColumn..<endColumn].map { $0 } }
        return Array(submatrix)
    }

    func isLineRow(_ column: [Character]) -> Bool {
        var dict: [Int: Int] = [:]
        column.forEach {
            if let number = Int(String($0)) {
                dict[number, default: 0] += 1
            }
        }
        return !dict.contains(where: { $0.value > 1 })
    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in 0..<9 {
            if !isLineRow(board[i]) { return false }
            for j in 0..<9 {
                if !isLineRow(board.map{$0[j]}) { return false }
            }
        }

        let submatrixSize = 3

        for startRow in stride(from: 0, to: 9, by: submatrixSize) {
            for startColumn in stride(from: 0, to: 9, by: submatrixSize) {
                let endRow = startRow + submatrixSize
                let endColumn = startColumn + submatrixSize
                let submatrix = submatrix(matrix: board, startRow: startRow, endRow: endRow, startColumn: startColumn, endColumn: endColumn)!
                if !isLineRow(submatrix.flatMap { $0 }) { return false }
            }
        }
        return true
    }
}
