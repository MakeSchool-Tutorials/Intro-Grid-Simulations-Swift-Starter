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
        
        // Put random seed code here!
        let time = UInt32(NSDate().timeIntervalSinceReferenceDate)
        srandom(time) // this "seeds" subsequent random() calls
        
        ///////////////////////////////////////
        // GameOfLifeSimulation setup start //
        /////////////////////////////////////
        
        //        let filePath = NSBundle.mainBundle().pathForResource("map01", ofType: "txt")!
        //        let sim = GameOfLifeSimulation(file: filePath)!
        //        let palette: [Character?] = ["👾", "😸", nil, nil, nil, nil, nil, nil]
        
        /////////////////////////////////////
        // GameOfLifeSimulation setup end //
        ///////////////////////////////////
        
        ///////////////////////////////////////
        // ForestFireSimulation setup start //
        /////////////////////////////////////
        
        let sim = ForestFireSimulation()
        let palette: [Character?] = ["🌳", "🌱", "🔥", "✄", nil, nil, nil, nil]
        
        /////////////////////////////////////
        // ForestFireSimulation setup end //
        ///////////////////////////////////
        
        ////////////////////////////////////
        // Custom Simulation setup start //
        //////////////////////////////////
        
        //        let sim = YourSimulationClass()
        //        let palette: [Character?] = [nil, nil, nil, nil, nil, nil, nil, nil]
        
        //////////////////////////////////
        // Custom Simulation setup end //
        ////////////////////////////////
        
        let scene = SimulationScene(fileNamed: "SimulationScene")!
        scene.setup(simulation: sim, palette: palette)
        
        let skView = self.view as! SKView
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
