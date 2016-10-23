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
    
    func wakeUp(){
        for child in children{
            child.removeFromParent();
        }
        texture = nil;
        color = SKColor.clear;
        
        let catAwake = SKSpriteNode(fileNamed: "CatWakeUp")!.childNode(withName: "cat_awake");
        catAwake?.move(toParent: self)
        catAwake?.position = CGPoint(x: -30, y: 100);
    }
    
    func curlAlt(scenePoint: CGPoint){
        parent!.physicsBody = nil;
        for child in children{
            child.removeFromParent();
        }
        texture = nil;
        color = SKColor.clear;
        
        
        let catCurl = SKSpriteNode(fileNamed: "CatCurl")!.childNode(withName: "cat_curl")!;
        catCurl.move(toParent: self);
        catCurl.position = CGPoint(x: -30 , y: 100);
        
        var localPoint = parent!.convert(scenePoint, from: scene!);
        localPoint.y += frame.size.height/3;
        
        run(SKAction.group(
            [
            SKAction.move(to: localPoint, duration: 0.66),
            SKAction.rotate(toAngle: -parent!.zRotation, duration: 0.5)
            ]
        ));
    }
    
}
