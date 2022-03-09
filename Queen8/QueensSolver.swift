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

//var count = 0
//var queens = 0
//func solveQueens(board: inout Board) {
//  print(board.size)
//  var listOfQueens = [[Int]]()
//  solveQueensHelper(&board, board.size - 1, col: board.size - 1, listOfQueens: &listOfQueens)
//	print(count )
//}
//
//func solveQueensHelper(_ board: inout Board,_ row: Int , col: Int, listOfQueens: inout [[Int]] ){
//  var isQueenPlaced = false
//  if listOfQueens.count == board.size {
//    print("CONGRATSSSSSSSSSSSS")
//    print(board.description)
//    count += 1
//    print(count )
//  }
//  if row < 0 {
//    print("row is less than 0 and must end")
//    print(row, " and ", col)
////    var lastQueen = listOfQueens.removeLast()
////    board.remove(row: lastQueen[0], col: lastQueen[1])
////    if lastQueen[1] == 0 {
////      lastQueen = listOfQueens.removeLast()
////      board.remove(row: lastQueen[0], col: lastQueen[1])
////    }
////    solveQueensHelper(&board, lastQueen[0] , col: lastQueen[1] - 1, listOfQueens: &listOfQueens)
//    return
//  }
//  if board.isSafe(row: row, col: col){
//    listOfQueens.insert([row,col], at: listOfQueens.count)
//    board.place(row: row,col: col)
//    isQueenPlaced = true
//    solveQueensHelper(&board, row - 1 , col: board.size - 1, listOfQueens: &listOfQueens)
//  }
//  if col < 0 {
//    print("negative")
//  }
//  if col == 0 && isQueenPlaced == false{
//    print(" col is zero")
//    var lastQueen = listOfQueens.removeLast()
//    board.remove(row: lastQueen[0], col: lastQueen[1])
//    if lastQueen[1] == 0 {
//      lastQueen = listOfQueens.removeLast()
//      board.remove(row: lastQueen[0], col: lastQueen[1])
//    }
//    solveQueensHelper(&board, lastQueen[0] , col: lastQueen[1] - 1, listOfQueens: &listOfQueens)
//  } else if col == 0 {
//    solveQueensHelper(&board, row - 1 , col: board.size - 1, listOfQueens: &listOfQueens)
//  } else {
//    solveQueensHelper(&board, row , col: col - 1, listOfQueens: &listOfQueens)
//  }
//
//
//}
//

var count = 0
var queens = 0
var steps = 0
var possibleNQueens = 0

//func solveQueens(board: inout Board) {
//  print(board.size)
//  var listOfQueens = [[Int]]()
//  solveQueensHelper(&board, board.size - 1, col: board.size - 1, listOfQueens: &listOfQueens)
//  print(count )
//}
//
//func solveQueensHelper(_ board: inout Board,_ row: Int , col: Int, listOfQueens: inout [[Int]] ){
//  steps += 1
//  //print(row, " and ", col)
//  var isQueenPlaced = false
//  if listOfQueens.count == board.size {
//    print("CONGRATSSSSSSSSSSSS")
//    print(board.description)
//    count += 1
//    print(count )
//    print(steps)
//  }
//  if row < 0 && col == 0{
//    print("row is less than 0 and must end")
//
//    var lastQueen = listOfQueens.removeLast()
//    board.remove(row: lastQueen[0], col: lastQueen[1])
//    if lastQueen[1] == 0 {
//      lastQueen = listOfQueens.removeLast()
//      board.remove(row: lastQueen[0], col: lastQueen[1])
//    }
//    //solveQueensHelper(&board, lastQueen[0] , col: lastQueen[1] - 1, listOfQueens: &listOfQueens)
//    return
//  } else if row < 0 {
//    //print("row is less than 0 and must end")
//    print(row, " and ", col)
//    var lastQueen = listOfQueens.removeLast()
//    board.remove(row: lastQueen[0], col: lastQueen[1])
//    if lastQueen[1] == 0 {
//      lastQueen = listOfQueens.removeLast()
//      board.remove(row: lastQueen[0], col: lastQueen[1])
//    }
//    //solveQueensHelper(&board, lastQueen[0] , col: lastQueen[1] - 1, listOfQueens: &listOfQueens)
//    return
//  }
//  if board.isSafe(row: row, col: col){
//    listOfQueens.insert([row,col], at: listOfQueens.count)
//    board.place(row: row,col: col)
//    isQueenPlaced = true
//    solveQueensHelper(&board, row - 1 , col: board.size - 1, listOfQueens: &listOfQueens)
//  } else if col == 0 && isQueenPlaced == false{
//    //print(" col is zero")
//    var lastQueen = listOfQueens.removeLast()
//    board.remove(row: lastQueen[0], col: lastQueen[1])
//    if lastQueen[1] == 0 {
//      lastQueen = listOfQueens.removeLast()
//      board.remove(row: lastQueen[0], col: lastQueen[1])
//    }
//    solveQueensHelper(&board, lastQueen[0] , col: lastQueen[1] - 1, listOfQueens: &listOfQueens)
//  } else if col == 0 {
//    solveQueensHelper(&board, row - 1 , col: board.size - 1, listOfQueens: &listOfQueens)
//  } else {
//    solveQueensHelper(&board, row , col: col - 1, listOfQueens: &listOfQueens)
//  }
//}

func solveQueens(board: inout Board) {
  var listOfQueens = [[Int]]()
  solveQueensHelper(&board, listOfQueens: &listOfQueens)
}

func solveQueensHelper(_ board: inout Board,_ row: Int = 0 ,_ col: Int = 0, listOfQueens: inout [[Int]] ){
  count += 1
  if possibleNQueens == 92 {
    return
  }
  if listOfQueens.count == board.size {
    print(board.description)
    possibleNQueens += 1
    return
  } else {
  for i in col...board.size - 1{
    if board.isSafe(row: row, col: i) == true {
      board.place(row: row, col: i)
      listOfQueens.insert([row,i], at: listOfQueens.count)
      solveQueensHelper(&board, row + 1,listOfQueens: &listOfQueens)
    } else if i == board.size - 1{
      let lastQueen = listOfQueens.removeLast()
      board.remove(row: lastQueen[0], col: lastQueen[1])
      if lastQueen[1] == 7{
        guard !listOfQueens.isEmpty else { return }
        let removeAnotherQueen = listOfQueens.removeLast()
        board.remove(row: removeAnotherQueen[0], col: removeAnotherQueen[1])
        solveQueensHelper(&board, removeAnotherQueen[0], removeAnotherQueen[1] + 1,listOfQueens: &listOfQueens)
      } else {
      solveQueensHelper(&board, lastQueen[0], lastQueen[1] + 1,listOfQueens: &listOfQueens)
      }
    }
  }
  }
}

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
  if possibleNQueens == 1 {
    return
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




