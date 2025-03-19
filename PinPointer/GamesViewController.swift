//
//  GameViewController.swift
//  PinPointer
//
//  Created by Otis Young on 3/15/25.
//

import UIKit
import SpriteKit

class GamesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as? SKView {
            // Load the SKScene from GameScene.sks
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .resizeFill
            
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    //  override shouldAutorotate
    override var shouldAutorotate: Bool {
        return true
    }

    //  override supportedInterfaceOrientations
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
