//
//  main.swift
//  Queen8
//
//  Created by Kelbin David on 2022-03-07.
//

import Foundation

var newBoard = Board(size: 8)

solveQueens(board: &newBoard)
print(count)

solveFirstQueens(board: &newBoard)
print(count)
