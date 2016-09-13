//
//  GameOfLifeSimulation.swift
//  Grid-Simulations
//
//  Created by Yujin Ariza on 3/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class GameOfLifeSimulation: Simulation {

    public var liveChar: Character = "👾"
    
    public override func update() {
        var newGrid = grid
        for x in 0..<grid.count {
            for y in 0..<grid[0].count {
                let cell = grid[x][y]
                let neighborAliveCount = countNeighbors(grid: grid, column: x, row: y)
                if cell == nil {
                    // cell is dead
                    if neighborAliveCount == 3 {
                        // a new cell is born!
                        newGrid[x][y] = liveChar
                    }
                    // don't need an else since we copied the entire grid
                    // over to newGrid
                } else {
                    // cell is alive
                    if neighborAliveCount < 2 || neighborAliveCount > 3 {
                        // dies of over/under population
                        newGrid[x][y] = nil
                    }
                    // don't need an else since we copied the entire grid
                    // over to newGrid
                }
            }
        }
        grid = newGrid
    }

    func getAlive(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        if x < 0 || x >= grid.count || y < 0 || y >= grid[0].count {
            return 0
        } else if grid[x][y] == nil {
            return 0
        } else {
            return 1
        }
    }
    
    func countNeighbors(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        var aliveCount = 0
        aliveCount += getAlive(grid: grid, column: x - 1, row: y - 1)
        aliveCount += getAlive(grid: grid, column: x - 1, row: y)
        aliveCount += getAlive(grid: grid, column: x - 1, row: y + 1)
        aliveCount += getAlive(grid: grid, column: x, row: y - 1)
        aliveCount += getAlive(grid: grid, column: x, row: y + 1)
        aliveCount += getAlive(grid: grid, column: x + 1, row: y - 1)
        aliveCount += getAlive(grid: grid, column: x + 1, row: y)
        aliveCount += getAlive(grid: grid, column: x + 1, row: y + 1)
        return aliveCount
    }
}
