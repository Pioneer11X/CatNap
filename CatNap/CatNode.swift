//
//  CatNode.swift
//  CatNap
//
//  Created by Sravan Karuturi on 22/10/16.
//  Copyright © 2016 Sravan Karuturi. All rights reserved.
//

import Foundation
import SpriteKit;

class CatNode: SKSpriteNode, EventListenerNode{
    
    func didMoveToScene() {
        let catBodyTexture = SKTexture(imageNamed: "cat_body_outline");
        parent!.physicsBody = SKPhysicsBody(texture: catBodyTexture, size: catBodyTexture.size());
        print("Cat added to the Scene");
        
        parent!.physicsBody!.categoryBitMask = PhysicsCategory.Cat;
        parent!.physicsBody!.collisionBitMask = PhysicsCategory.Block | PhysicsCategory.Edge;
        
        parent!.physicsBody!.contactTestBitMask = PhysicsCategory.Bed | PhysicsCategory.Edge;
        
    }
    
}
