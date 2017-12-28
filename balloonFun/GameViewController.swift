//
//  GameViewController.swift
//  balloonFun
//
//  Created by Vallard Benincosa on 12/27/17.
//  Copyright © 2017 Vallard Benincosa. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
