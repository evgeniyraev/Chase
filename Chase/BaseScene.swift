//
//  BaseScene.swift
//  Chase
//
//  Created by Evgeniy Raev on 4/2/16.
//
//

import SpriteKit

enum Action
{
	case Left, Right, Jump
	case None
	
	var vect:CGVector{
		get{
			switch self {
			case .Left:
				return CGVectorMake(-10, 0)
			case .Right:
				return CGVectorMake(10, 0)
			case .Jump:
				return CGVectorMake(0, 10)
			case .None:
				return CGVector.zero
			}
		}
	}
}

class BaseScene: SKScene {
	
	var player:SKNode?
	
	var action:Action = .None
	
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
		
		let newAction:Action
		switch location.x < self.size.width/2
		{
		case true:
			newAction = action + .Left
		case false:
			newAction = action + .Right
		}
		
		if newAction == .Left || newAction == .Right
		{
			player?.physicsBody?.velocity = CGVector.zero
		}
		
		player?.physicsBody?.applyImpulse(newAction.vect)
		
		if(newAction != .Jump)
		{
			action = newAction
		}
	}
}

func + (a:Action, b:Action) -> Action
{
	if a == b
	{
		if a != .Jump
		{
			return .Jump
		}
	}
	else
	{
		if(a != .Jump)
		{
			return b
		}
	}
	return .None
}
