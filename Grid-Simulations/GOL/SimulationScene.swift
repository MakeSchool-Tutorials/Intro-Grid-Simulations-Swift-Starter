//
//  GameOfLifeScene.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 2/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class SimulationScene: SKScene {
    
    let gridPosition = CGPoint(x: 10.0, y: 100.0)
    let palettePosition = CGPoint(x: 10.0, y: 500.0)
    let playButtonPosition = CGPoint(x: 160.0, y: 10.0)
    let stepButtonPosition = CGPoint(x: 10.0, y: 10.0)
    
    public let sim: Simulation
    public let palette: [Character?]

    let grid: TouchableGrid
    let paletteGrid: PaletteGrid
    let playButton: PlayPauseButton
    let stepButton: SKButton
    
    var timer: NSTimer? = nil
    
    var liveChar: Character?
    
    public init(sim: Simulation, palette: [Character?], size: CGSize) {
        self.sim = sim
        sim.setup()
        
        grid = TouchableGrid(charMap: sim.map)
        grid.position = gridPosition
        
        self.palette = palette
        
        paletteGrid = PaletteGrid(paletteArray: palette)
        paletteGrid.position = palettePosition
        
        playButton = PlayPauseButton(size: CGSize(width: 70, height: 40))
        playButton.position = playButtonPosition
        
        stepButton = SKButton(size: CGSize(width: 70, height: 40), textString: "Step")
        stepButton.position = stepButtonPosition
        
        if palette.count != 0 {
            liveChar = palette[0]
            paletteGrid.highlightCell(0)
        } else {
            liveChar = "■"
        }
        
        super.init(size: size)

        grid.touchCallback = gridCellTouched
        self.addChild(grid)
        
        paletteGrid.touchCallback = paletteCellTouched
        self.addChild(paletteGrid)

        playButton.playPauseCallback = playPausePressed
        self.addChild(playButton)
        
        stepButton.touchCallback = stepButtonPressed
        self.addChild(stepButton)
        
        self.backgroundColor = UIColor.grayColor()
    }
    
    public override func didMoveToView(view: SKView) {
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func gridCellTouched(x: Int, y: Int) {
        if sim.map[x][y] != liveChar {
            sim.map[x][y] = liveChar
        } else {
            sim.map[x][y] = nil
        }
        update()
    }
    
    func paletteCellTouched(x: Int, _: Int) {
        paletteGrid.highlightCell(x)
        liveChar = palette[x]
    }
    
    func timerUpdate() {
        sim.update()
        update()
    }
    
    func playPausePressed(playing: Bool) {
        if (playing) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerUpdate", userInfo: nil, repeats: true)
            timer?.fire()
            stepButton.disabled = true
        } else {
            timer?.invalidate()
            stepButton.disabled = false
        }
    }
    
    func stepButtonPressed() {
        timerUpdate()
    }
    
    func update() {
        grid.updateAll(sim.map)
    }
}