//
//  GameViewController.swift
//  PinPointer
//
//  Created by Otis Young on 3/15/25.
//

import UIKit
import SpriteKit








class GamesViewController: UIViewController {
    
    
    
    @IBAction func startinggame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondController = storyboard.instantiateViewController(withIdentifier: "second_controller")
        self.present(secondController, animated: true, completion: nil)
    }
    
    
    
//    @IBAction func DidStartGame(_ sender: Any) {
//    }
    
@IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    let backdropImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "backdrop"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
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
