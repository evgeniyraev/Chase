//
//  SceneManager.swift
//  Chase
//
//  Created by Evgeniy Raev on 4/2/16.
//
//

import SpriteKit

class SceneManager
{
	/**
	The games input via connected control input sources. Used to
	provide control to scenes after presentation.
	*/
	//let gameInput: GameInput
	
	/// The view used to choreograph scene transitions.
	let presentingView: SKView
	
	init(presentingView: SKView) {
		self.presentingView = presentingView
		
		let scene = BaseScene(fileNamed: "GameScene")
		
		scene?.scaleMode = .ResizeFill
		
		presentingView.presentScene(scene)
	}
}