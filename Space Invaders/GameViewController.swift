//
//  GameViewController.swift
//  Space Invaders
//
//  Created by Matheus Pedrosa on 03/07/17.
//  Copyright © 2017 Matheus Pedrosa. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {

    var backingAudio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let filePaph = Bundle.main.path(forResource: "backingAudio", ofType: "mp3")
        
        let audioNSURL = NSURL(fileURLWithPath: filePaph!)
        
        do { backingAudio = try AVAudioPlayer(contentsOf: audioNSURL as URL) }
        catch { return print("deu pau no audio") }
        
        backingAudio.numberOfLoops = -1
        backingAudio.play()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
//        let scene = GameScene(size: CGSize(width: 1536, height: 2048))
//        let skView = self.view as! SKView?
//        skView?.showsFPS = true
//        //skView?.showsNodeCount = true
//        
//        skView?.ignoresSiblingOrder = true
//        
//        scene.scaleMode = .aspectFill
//        
//        skView?.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
