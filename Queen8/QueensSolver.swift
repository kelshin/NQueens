//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var queens = 0
var steps = 0
var possibleNQueens = 0

func solveFirstQueens(board: inout Board) {
  var listOfQueens = [[Int]]()
  solveFirstQueensHelper(&board, listOfQueens: &listOfQueens)
}

func solveFirstQueensHelper(_ board: inout Board,_ row: Int = 0 ,_ col: Int = 0, listOfQueens: inout [[Int]] ){
  count += 1
  if listOfQueens.count == board.size {
    print(board.description)
    possibleNQueens += 1
  }
  for i in col...board.size - 1{
    if possibleNQueens == 1 {
      return
    }
    if !listOfQueens.isEmpty && listOfQueens.count - 1 == row{
      let lastQueen = listOfQueens.removeLast()
          board.remove(row: lastQueen[0], col: lastQueen[1])
    }
    if board.isSafe(row: row, col: i) == true {
      board.place(row: row, col: i)
      listOfQueens.insert([row,i], at: listOfQueens.count)
      if i == board.size - 1 {
        solveFirstQueensHelper(&board, row + 1,listOfQueens: &listOfQueens)
      } else {
        solveFirstQueensHelper(&board, row + 1,listOfQueens: &listOfQueens)
      }
    }
    if i == board.size - 1{
      let lastQueen = listOfQueens.removeLast()
      board.remove(row: lastQueen[0], col: lastQueen[1])
      return
    }
  }
 }

func solveQueens(board: inout Board) {
  var listOfQueens = [[Int]]()
  solveQueensHelper(&board, listOfQueens: &listOfQueens)
}

func solveQueensHelper(_ board: inout Board,_ row: Int = 0 ,_ col: Int = 0, listOfQueens: inout [[Int]] ){
  count += 1
  if listOfQueens.count == board.size {
    print(board.description)
    possibleNQueens += 1
    print(possibleNQueens)
  }
  for i in col...board.size - 1{
    if possibleNQueens == 92 {
      return
    }
    if !listOfQueens.isEmpty && listOfQueens.count - 1 == row{
      let lastQueen = listOfQueens.removeLast()
          board.remove(row: lastQueen[0], col: lastQueen[1])
    }
    if board.isSafe(row: row, col: i) == true {
      board.place(row: row, col: i)
      listOfQueens.insert([row,i], at: listOfQueens.count)
      if i == board.size - 1 {
        solveQueensHelper(&board, row + 1,listOfQueens: &listOfQueens)
      } else {
        solveQueensHelper(&board, row + 1,listOfQueens: &listOfQueens)
      }
    }
    if i == board.size - 1{
      let lastQueen = listOfQueens.removeLast()
      board.remove(row: lastQueen[0], col: lastQueen[1])

      return
    }
  }
 }




