//
//  SKButton.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 2/29/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class SKButton: SKNode {
    let buttonRect: CGRect
    let cornerRadius: CGFloat = 5.0
    let buttonColor = UIColor.greenColor()
    let buttonStrokeColor = UIColor.blackColor()
    let textColor = UIColor.whiteColor()

    public let text: SKLabelNode
    public let shape: SKShapeNode
    public var touchCallback: (() -> ())? = nil
    
    public var disabled = false {
        didSet {
            if disabled {
                self.alpha = 0.5
            } else {
                self.alpha = 1.0
            }
        }
    }

    public init(size: CGSize, textString: String) {
        buttonRect = CGRect(origin: CGPointZero, size: size)
        text = SKLabelNode(text: textString)
        shape = SKShapeNode(rect: buttonRect, cornerRadius: cornerRadius)
        shape.fillColor = buttonColor
        shape.strokeColor = buttonStrokeColor
        text.position = CGPoint(x: buttonRect.size.width / 2, y: buttonRect.size.height / 2)
        text.verticalAlignmentMode = .Center
        text.horizontalAlignmentMode = .Center
        text.fontName = "Helvetica Neue"
        text.fontSize = 22.0
        text.fontColor = textColor

        super.init()
        self.addChild(shape)
        self.addChild(text)
        self.userInteractionEnabled = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if disabled {
            return
        }
        if let touch = touches.first {
            let location = touch.locationInNode(self)
            if buttonRect.contains(location) {
                touchCallback?()
            }
        }
    }
}
