//
//  BlockNode.swift
//  CatNap
//
//  Created by Sravan Karuturi on 22/10/16.
//  Copyright © 2016 Sravan Karuturi. All rights reserved.
//

import Foundation
import SpriteKit;

class BlockNode: SKSpriteNode, EventListenerNode, InteractiveMode{
    
    func didMoveToScene() {
        isUserInteractionEnabled = true;
    }
    
    func interact() {
        isUserInteractionEnabled = false;
        
        run(SKAction.sequence([
            SKAction.playSoundFileNamed("pop.mp3", waitForCompletion: false),
            SKAction.scale(by: 0.8, duration: 0.1),
            SKAction.removeFromParent()
            ]
        ));
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event);
        print("destroy block");
        interact();
    }
    
}
