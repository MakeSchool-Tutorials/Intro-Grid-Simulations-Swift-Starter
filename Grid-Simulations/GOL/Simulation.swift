//
//  Simulation.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 3/6/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class Simulation {
    public var map: [[Character?]]
    
    public init() {
        map = []
    }
    
    public init(other: Simulation) {
        map = other.map
    }
    
    public init?(file: String) {
        map = []
        if let temp = readFromFile(file) {
            map = temp
        } else {
            return nil
        }
    }
    
    private func readFromFile(file: String) -> [[Character?]]? {
        let nullChar: Character = "0"
        let reader = StreamReader(path: file)
        if let reader = reader {
            var map: [[Character?]] = []
            var rowLength = 0
            while let line = reader.nextLine() {
                if map.count == 0 {
                    rowLength = line.characters.count
                    map = [[Character?]].init(count: rowLength, repeatedValue: [])
                }
                if line.characters.count != rowLength {
                    // something is wrong
                    print("expected line length of \(rowLength), got length of \(line.characters.count)")
                    return nil
                }
                for i in 0..<rowLength {
                    let char = line[line.startIndex.advancedBy(i)]
                    if char == nullChar {
                        map[i].append(nil)
                    } else {
                        map[i].append(char)
                    }
                }
            }
            return map
        } else {
            return nil
        }
    }

    public func setup() {
    }
    
    public func update() {
    }
}