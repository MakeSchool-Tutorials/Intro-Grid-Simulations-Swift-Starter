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
        // Student code here!
        // this contains your 2D grid! Update this value.
        var newGrid = grid
        var neighborCount: Int
        for x in 0..<grid.count {
            for y in 0..<grid[0].count {
                neighborCount = countNeighbors(grid, column: x, row: y)
                if newGrid[x][y] != nil {
                    if neighborCount < 2 || neighborCount > 3 {
                        newGrid[x][y] = nil
                    }
                }
                else {
                    if neighborCount == 3 {
                        newGrid[x][y] = liveChar
                    }
                }
            }
        }
        grid = newGrid
    }
    
    
    func getAlive(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        if x < 0 || x > grid.count - 1 || y < 0 || y > grid[0].count - 1 {
            return 0
        }
        else if grid[x][y] == nil {
            return 0
        }
        else {
            return 1
        }
    }
    
    func countNeighbors(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        let alive = getAlive(grid, column: x - 1, row: y) + getAlive(grid, column: x + 1, row: y) +
            getAlive(grid, column: x - 1, row: y - 1) +
            getAlive(grid, column: x - 1, row: y + 1) +
            getAlive(grid, column: x + 1, row: y + 1) +
            getAlive(grid, column: x + 1, row: y - 1) +
            getAlive(grid, column: x, row: y - 1) +
            getAlive(grid, column: x, row: y + 1)
        return alive
    }
    
}