//
//  Actions.swift
//  HamsterWheel
//
//  Created by Phyllis Wong on 3/1/18.
//  Copyright © 2018 Bob De Kort. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

class DDLevelSelector: SKScene {
    
    var currentLevel: Int?    
    var homeButton: SKButton!
    var backButton: SKButton!
    
    override func didMove(to view: SKView) {
        // Check to see what level is next
        if let level = currentLevel {
            switch level {
            case 1: loadLevel1()
            case 2: loadLevel2()
            case 3: loadLevel3()
            case 4: loadLevel4()
            case 5: loadLevel5()
            case 6: loadLevel6()
            case 7: loadLevel7()
            case 8: loadLevel8()
                
            default: loadLevel1()
            }
        } else {
            currentLevel = 1
            loadLevel1()
        }
    }
    
    func loadLevel1() {
        if let view = view {
            if let scene = DDLevel(fileNamed: "DDLevelScene") {
                
                scene.levelSelector = self
                currentLevel = 1
                scene.has2Shapes = false
                
                // Level 1 variables
                scene.shape1Texture = "squareRed"
                scene.match1Texture = "squareRedMatch"
                scene.shape1Position = CGPoint(x: 1125, y: 525)
                scene.match1Position = CGPoint(x: 235, y: 207)
                
                scene.scaleMode = .aspectFit
                
                
                view.presentScene(scene)
            }
        }
    }
    
    func loadLevel2() {
        if let view = view {
            if let scene = DDLevel(fileNamed: "DDLevelScene") {
                
                scene.levelSelector = self
                currentLevel = 2
                scene.has2Shapes = false
                
                // Level 2 variables
                scene.shape1Texture = "circleBlu"
                scene.match1Texture = "circleBluMatch"
                scene.shape1Position = CGPoint(x: 260, y: 550)
                scene.match1Position = CGPoint(x: 1150, y: 160)
                
                // Sets scale mode
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    
    func loadLevel3() {
        if let view = view {
            if let scene = DDLevel(fileNamed: "DDLevelScene") {
                
                scene.levelSelector = self
                currentLevel = 3
                scene.has2Shapes = false
                
                // Level 3 variables
                scene.shape1Texture = "triangleYel"
                scene.match1Texture = "triangleYelMatch"
                scene.shape1Position = CGPoint(x: 1210, y: 375)
                scene.match1Position = CGPoint(x: 321, y: 142)
                
                // Sets scale mode
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    
    func loadLevel4() {
        if let view = view {
            if let scene = DDLevel(fileNamed: "DDLevelScene") {
                scene.levelSelector = self
                currentLevel = 4
                scene.has2Shapes = false
            
                // Level 4 variables
                scene.shape1Texture = "squareRed"
                scene.match1Texture = "squareRedMatch"
                scene.match2Texture = "triangleBluMatch"
                scene.shape1Position = CGPoint(x: 223, y: 115)
                scene.match1Position = CGPoint(x: 1084, y: 570)
                scene.match2Position = CGPoint(x: 462, y: 502)
                
                // Sets scale mode
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    
    func loadLevel5() {
        if let view = view {
            if let scene = DDLevel(fileNamed: "DDLevelScene") {
                scene.levelSelector = self
                currentLevel = 5
                scene.has2Shapes = true
                
                // Level 5 variables
                scene.shape1Texture = "circleYel"
                scene.shape2Texture = "squareBlu"
                scene.match1Texture = "circleYelMatch"
                scene.match2Texture = "squareBluMatch"
                scene.shape1Position = CGPoint(x: 960, y: 170)
                scene.shape2Position = CGPoint(x: 1115, y: 475)
                scene.match1Position = CGPoint(x: 475, y: 590)
                scene.match2Position = CGPoint(x: 224, y: 200)
                
                // Sets scale mode
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    func loadLevel6() {
        if let view = view {
            if let scene = DDLevel(fileNamed: "DDLevelScene") {
                scene.levelSelector = self
                currentLevel = 6
                scene.has2Shapes = true
                
                // Level 6 variables
                scene.shape1Texture = "triangleRed"
                scene.shape2Texture = "squareYel"
                scene.match1Texture = "triangleRedMatch"
                scene.match2Texture = "squareYelMatch"
                scene.shape1Position = CGPoint(x: 100, y: 452)
                scene.shape2Position = CGPoint(x: 1208, y: 636)
                scene.match1Position = CGPoint(x: 1056, y: 498)
                scene.match2Position = CGPoint(x: 260, y: 253)
                
                // Sets scale mode
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    func loadLevel7() {
        if let view = view {
            if let scene = DDLevel(fileNamed: "DDLevelScene") {
                scene.levelSelector = self
                currentLevel = 7
                scene.has2Shapes = false
                
                // Level 7 variables
                scene.shape1Texture = "squareBlu"
                scene.match1Texture = "squareBluMatch"
                scene.wallTexture = "wall"
                scene.shape1Position = CGPoint(x: -458, y: 162)
                scene.match1Position = CGPoint(x: 384, y: -186)
                scene.wallPosition = CGPoint(x: 0, y: 0)
                
                // Sets scale mode
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    func loadLevel8() {
        if let view = view {
            if let scene = DDLevel(fileNamed: "DDLevelScene") {
                scene.levelSelector = self
                currentLevel = 8
                scene.has2Shapes = true
                
                // Level 7 variables
                scene.shape1Texture = "triangleRed"
                scene.shape2Texture = "circleBlu"
                scene.match1Texture = "triangleRedMatch"
                scene.match2Texture = "circleBluMatch"
                scene.wallTexture = "wall"
                scene.shape1Position = CGPoint(x: -458, y: 162)
                scene.shape2Position = CGPoint(x: -370, y: -60)
                scene.match1Position = CGPoint(x: -184, y: -186)
                scene.match2Position = CGPoint(x: 498, y: 153)
                scene.wallPosition = CGPoint(x: 0, y: 0)
                
                // Sets scale mode
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
}