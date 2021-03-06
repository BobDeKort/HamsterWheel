//
//  SpellingLevelNavigationExtesion.swift
//  HamsterWheel
//
//  Created by Bob De Kort on 3/22/18.
//  Copyright © 2018 HamsterWheel. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

extension SpellingLevel {
    
    // MARK: Navigation buttons setup
    
    // FIXME: make this func consitent between games
    func setupHomeButton() {
        /* Set UI connections */
        menuButton = self.childNode(withName: "menuButton") as! SKButton
        menuButton.position = positionFromTop(CGPoint(x: 75.0, y: 75.0))
        
        /* Setup button selection handler for homescreen */
        menuButton.selectedHandler = { [unowned self] in
            if let view = self.view {
                if let scene = SKScene(fileNamed: "MainMenuScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFit
                    // Present the scene
                    view.presentScene(scene)
                }
                
                // Debug helpers
                // view.showsPhysics = true
                
                
            }
        }
    }
    
    func setupBackButton() {
        /* Set UI connections */
        backButton = self.childNode(withName: "backButton") as! SKButton
        backButton.position = positionFromTop(CGPoint(x: 75.0, y: 175.0))
        
        if let selector = levelSelector {
            if let current = selector.currentLevel {
                if current < 2 {
                    backButton.isHidden = true
                }
            }
        }
        
        /* Setup button selection handler for homescreen */
        backButton.selectedHandler = { [unowned self] in
            if let view = self.view {
                if let selector = self.levelSelector {
                    if selector.currentLevel != nil {
                        selector.currentLevel! -= 1
                    } else {
                        selector.currentLevel = 1
                    }
                    
                    view.presentScene(selector)
                }
            }
        }
    }
}
