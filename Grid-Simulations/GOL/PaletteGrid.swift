//
//  PaletteGrid.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 3/4/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class PaletteGrid: TouchableGrid {
    
    var highlighted: Int? = nil
    
    public var tileHighlightedLineWidth: CGFloat = 2.0
    public var tileHighlightedLineColor = UIColor.whiteColor()
    
    public init(paletteArray: [Character?]) {
        let map = PaletteGrid.arrayToMap(paletteArray)
        super.init(charMap: map)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateAll(palette: [Character?]) {
        updateAll(PaletteGrid.arrayToMap(palette))
    }
    
    public func highlightCell(x: Int) {
        if x != highlighted {
            if let highlighted = highlighted {
                let cell = self.shapeMap[highlighted][0]
                cell.lineWidth = tileDefaultLineWidth
                cell.strokeColor = tileDefaultLineColor
                cell.zPosition = 0
            }
            let cell = self.shapeMap[x][0]
            cell.lineWidth = tileHighlightedLineWidth
            cell.strokeColor = tileHighlightedLineColor
            cell.zPosition = 0.5
            highlighted = x
        }
    }
    
    public static func arrayToMap(palette: [Character?]) -> [[Character?]] {
        var map: [[Character?]] = []
        for char in palette {
            map.append([char])
        }
        return map
    }
}
