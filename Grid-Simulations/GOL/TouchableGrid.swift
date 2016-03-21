//
//  TouchableGrid.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 3/4/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class TouchableGrid: SKNode {
    
    var map: [[SKLabelNode?]]
    var shapeMap: [[SKShapeNode]]
    var overlayTextMap: [[SKLabelNode?]]
    var width: Int {
        return map.count
    }
    var height: Int {
        return (map.count != 0) ? map[0].count : 0
    }
    let tileSize: CGFloat = 30
    public var touchCallback: ((Int, Int) -> Void)? = nil
    
    public var textDefaultColor = UIColor.whiteColor()
    public var tileDefaultColor = UIColor.clearColor()
    public var textIncorrectColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 1.0)
    public var tileIncorrectColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 1.0)
    public var tileDefaultLineWidth: CGFloat = 1.0
    public var tileDefaultLineColor = UIColor.blackColor()
    
    public init(charMap: [[Character?]]) {
        if (charMap.count != 0) {
            map = [[SKLabelNode?]].init(count: charMap.count,
                repeatedValue: [SKLabelNode?].init(count: charMap[0].count, repeatedValue: nil))
            overlayTextMap = [[SKLabelNode?]].init(count: charMap.count,
                repeatedValue: [SKLabelNode?].init(count: charMap[0].count, repeatedValue: nil))
        } else {
            map = []
            overlayTextMap = []
        }
        shapeMap = []
        
        super.init()
        self.userInteractionEnabled = true

        for x in 0..<width {
            var col: [SKShapeNode] = []
            for y in 0..<height {
                let shape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: tileSize, height: tileSize))
                shape.strokeColor = tileDefaultLineColor
                shape.lineWidth = tileDefaultLineWidth
                shape.fillColor = tileDefaultColor
                shape.position = CGPoint(x: CGFloat(x)*tileSize, y: CGFloat(y)*tileSize)
                shape.zPosition = 0
                col.append(shape)
                self.addChild(shape)
            }
            shapeMap.append(col)
        }
        updateAll(charMap)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let touchPosition = touch.locationInNode(self)
            let x = Int(touchPosition.x / tileSize)
            let y = Int(touchPosition.y / tileSize)
            if 0 <= x && x < width &&
               0 <= y && y < height {
                if let touchCallback = touchCallback {
                    touchCallback(x, y)
                }
            }
        }
    }

    public func updateAll(map: [[Character?]]) {
        for i in 0..<map.count {
            for j in 0..<map[i].count {
                setCell(i, y: j, char: map[i][j])
            }
        }
    }
    
    public func setCell(x: Int, y: Int, char: Character?) {
        let label = map[x][y]
        if let label = label {
            if char == nil {
                label.removeFromParent()
                map[x][y] = nil
            } else if label.text != String(char!) {
                label.text = String(char!)
            }
        } else {
            if let char = char {
                let newLabel = SKLabelNode(text: String(char))
                newLabel.verticalAlignmentMode = .Center
                newLabel.horizontalAlignmentMode = .Center
                newLabel.fontSize = 28.0
                newLabel.fontName = "Helvetica Neue"
                newLabel.position = CGPoint(x: (CGFloat(x)+0.5) * tileSize, y: (CGFloat(y)+0.5) * tileSize)
                newLabel.zPosition = 1
                self.addChild(newLabel)
                map[x][y] = newLabel
            }
        }
    }
    
    public func setOverlayText(x: Int, _ y: Int, text: String?, color: UIColor) {
        let label = overlayTextMap[x][y]
        if let label = label {
            if let text = text {
                label.text = text
                label.fontColor = color
            } else {
                label.removeFromParent()
                overlayTextMap[x][y] = nil
            }
        } else {
            if let text = text {
                let newLabel = SKLabelNode(text: text)
                newLabel.verticalAlignmentMode = .Center
                newLabel.horizontalAlignmentMode = .Center
                newLabel.fontSize = 28.0
                newLabel.fontName = "Helvetica Neue"
                newLabel.position = CGPoint(x: (CGFloat(x)+0.5) * tileSize, y: (CGFloat(y)+0.5) * tileSize)
                newLabel.zPosition = 2
                newLabel.fontColor = color
                self.addChild(newLabel)
                overlayTextMap[x][y] = newLabel
            }
        }
    }
    
    public enum TileState {
        case Default
        case Incorrect
    }
    
    public func setTileState(x: Int, _ y: Int, state: TileState) {
        let shape = shapeMap[x][y]
        let label = map[x][y]
        switch state {
        case .Default:
            if let label = label {
                label.fontColor = textDefaultColor
            }
            shape.fillColor = tileDefaultColor
        case .Incorrect:
            if let label = label {
                label.fontColor = textIncorrectColor
            } else {
                shape.fillColor = tileIncorrectColor
            }
        }
    }
}
