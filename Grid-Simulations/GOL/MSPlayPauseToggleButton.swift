//
//  MSPlayPauseToggleButtonNode.swift
//  Grid-Simulations
//
//  Created by Dion Larson on 6/5/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

class MSPlayPauseToggleButtonNode: MSButtonNode {
    
    internal var toggled: Bool = false {
        didSet {
            if toggled {
                label.text = onText
            } else {
                label.text = offText
            }
        }
    }
    let offText = "Play"
    let onText = "Pause"
    let label = SKLabelNode()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        label.text = offText
        label.position = CGPoint(x: 0, y: 4)
        label.fontName = "Menlo Bold"
        label.fontSize = 32
        label.fontColor = SKColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        label.verticalAlignmentMode = .Center
        label.horizontalAlignmentMode = .Center
        self.addChild(label)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        toggled = !toggled
        super.touchesEnded(touches, withEvent: event)
    }
    
}