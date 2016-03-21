//
//  PlayPauseButton.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 2/29/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class PlayPauseButton: SKButton {
    
    var buttonPlay = false
    public var playPauseCallback: ((Bool) -> ())? = nil
    
    public init(size: CGSize) {
        super.init(size: size, textString: "Play")
        touchCallback = buttonCallback
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonCallback() {
        buttonPlay = !buttonPlay
        if buttonPlay {
            text.text = "Pause"
        } else {
            text.text = "Play"
        }
        playPauseCallback?(buttonPlay)
    }
}
