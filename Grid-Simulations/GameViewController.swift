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
        
        
        ///////////////////////////////////////
        // GameOfLifeSimulation setup start (ゲームオブライフシミュレーションの設定はここから） //
        /////////////////////////////////////
        
        let filePath = Bundle.main.path(forResource: "map01", ofType: "txt")!
        let sim = GameOfLifeSimulation(file: filePath)!
        let palette: [Character?] = ["👾", "😸", nil, nil, nil, nil, nil, nil]
        
        /////////////////////////////////////
        // GameOfLifeSimulation setup end　（ゲームオブライフシミュレーションの設定はここまで）//
        ///////////////////////////////////
        
        ///////////////////////////////////////
        // ForestFireSimulation setup start（ForestFireSimulationの設定はここから） //
        /////////////////////////////////////
        
//        let sim = ForestFireSimulation()
//        let palette: [Character?] = ["🔥", "🌲", nil, nil, nil, nil, nil, nil]
        
        /////////////////////////////////////
        // ForestFireSimulation setup end （ForestFireSimulationの設定はここまで）//
        ///////////////////////////////////
        
        ////////////////////////////////////
        // Custom Simulation setup start （カスタムシミュレーションの設定はここから）//
        //////////////////////////////////
        
//        let sim = YourSimulationClass()
//        let palette: [Character?] = [nil, nil, nil, nil, nil, nil, nil, nil]
        
        //////////////////////////////////
        // Custom Simulation setup end （カスタムシミュレーションの設定はここまで）//
        ////////////////////////////////
        
        let scene = SimulationScene(fileNamed: "SimulationScene")!
        scene.setup(simulation: sim, palette: palette)
        
        let skView = self.view as! SKView
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }

    override var shouldAutorotate : Bool {
        return false
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
