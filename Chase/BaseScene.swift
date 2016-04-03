//
//  BaseScene.swift
//  Chase
//
//  Created by Evgeniy Raev on 4/2/16.
//
//

import SpriteKit

class BaseScene: SKScene {
	
	var player:SKNode?
	
	override func didMoveToView(view: SKView) {
		player = childNodeWithName("player")
		
		let tapRec = UITapGestureRecognizer(
			target: self,
			action:#selector(BaseScene.handleTap(_:)))
		
		self.scene?.view?.addGestureRecognizer(tapRec)
	}
	
	/*
	override func didChangeSize(oldSize: CGSize) {
		
	}
	*/
	
	func handleTap(tap:UITapGestureRecognizer){
		
		let location = self.convertPoint(
			self.convertPointFromView(
				tap.locationInView(tap.view)),
			toNode: self)
		
		if(location.x < self.size.width/2)
		{
			player?.physicsBody?.velocity = CGVector.zero
			player?.physicsBody?.applyImpulse(CGVectorMake(-10, 0))
		}
		else
		{
			player?.physicsBody?.velocity = CGVector.zero
			player?.physicsBody?.applyImpulse(CGVectorMake(10, 0))
		}
	}
	
}
