//
//  GameScene.swift
//  CatNap
//
//  Created by Sravan Karuturi on 22/10/16.
//  Copyright © 2016 Sravan Karuturi. All rights reserved.
//

import SpriteKit
import GameplayKit

protocol EventListenerNode{
    func didMoveToScene();
}

protocol InteractiveMode{
    func interact();
}

struct PhysicsCategory {
    static let None: UInt32 = 0;
    static let Cat: UInt32 = 1;
    static let Block: UInt32 = 2;
    static let Bed: UInt32 = 4;
}

class GameScene: SKScene {
    
    var bedNode: BedNode!;
    var catNode: CatNode!;
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        bedNode = childNode(withName: "bed") as! BedNode;
        catNode = childNode(withName: "//cat_body") as! CatNode;
        
//        bedNode.setScale(1.5);
//        catNode.setScale(1.5);
        
        // Calculate Playable margin
        let maxAspectRatio: CGFloat = 16.0/9.0;
        let maxAspectRatioheight = size.width / maxAspectRatio;
        let playableMargin: CGFloat = ( size.height - maxAspectRatioheight)/2;
        
        let playableRect = CGRect(x:0, y: playableMargin, width: size.width, height: size.height - playableMargin * 2);
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect);
        
        enumerateChildNodes(withName: "//*"){
            // Matches all nodes.
            node, _ in
            print(node.name);
            if let eventListenerNode = node as? EventListenerNode{
                // macthes only BedNode. ( Only that node conforms to the protocol.
                eventListenerNode.didMoveToScene();
            }
        }
        
//        SKTAudio.sharedInstance().playBackgroundMusic("backgroundMusic.mp3");
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
