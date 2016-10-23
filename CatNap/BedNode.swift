//
//  BedNode.swift
//  CatNap
//
//  Created by Sravan Karuturi on 22/10/16.
//  Copyright © 2016 Sravan Karuturi. All rights reserved.
//

import Foundation
import SpriteKit;

class BedNode: SKSpriteNode, EventListenerNode{
    
    func didMoveToScene() {
        
        let bedBodySize = CGSize(width: 40.0, height: 30.0);
        //    override var physicsBody = SKPhysicsBody(rectableOf: bedBodySize);
        physicsBody = SKPhysicsBody(rectangleOf: bedBodySize);
        physicsBody!.isDynamic = false;
        print("Bed Added to the Scene");
        
        physicsBody!.categoryBitMask = PhysicsCategory.Bed;
        physicsBody!.collisionBitMask = PhysicsCategory.None;
        
    }
    
}
