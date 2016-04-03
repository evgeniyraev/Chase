//
//  ViewController.swift
//  Chase (tvOS)
//
//  Created by Evgeniy Raev on 4/2/16.
//
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let scene = self.view as? SKView
		{
			let _ = SceneManager(presentingView: scene)
		}
		else
		{
			print(":)")
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

