//
//  GameViewController.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 2/21/16.
//  Copyright (c) 2016 Make School. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Switch out code here!
        let filePath = NSBundle.mainBundle().pathForResource("map01", ofType: "txt")!
        let sim = GameOfLifeSimulation(file: filePath)!
        //
        
        let palette: [Character?] = ["♡", "■", nil, nil, nil, nil, nil, nil, nil, nil]
        let size = CGSize(width: 320, height: 576)
        
        let scene = SimulationScene(sim: sim, palette: palette, size: size)

        let skView = self.view as! SKView
        
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
