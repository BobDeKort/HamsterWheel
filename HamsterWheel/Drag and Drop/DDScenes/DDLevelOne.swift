//
//  GameScene.swift
//  TestDragDrop
//
//  Created by Phyllis Wong on 1/21/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.


import SpriteKit
import AVFoundation

class DDLevelOne: SKScene {
 
    var audio: AVAudioPlayer?
    var soundEffect: AVAudioPlayer?
    var player: Player1!
    var match: Match1!
    
    var homeButton: SKButton!

    var isDragging = false
    

    override func didMove(to view: SKView) {
        
       
//        player = Player1(imageNamed: "circleRed")
        
        // match = Match1(imageNamed: "circleRedMatch")
        
        /* Set UI connections */
        homeButton = self.childNode(withName: "homeButton") as! SKButton
        
        /* Setup button selection handler for homescreen */
        homeButton.selectedHandler = { [unowned self] in
            if let view = self.view {
                
                // FIXME: Load the SKScene from 'MainMenuScene.sks'
                if let scene = SKScene(fileNamed: "MainMenuScene") {
                    
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view.presentScene(scene)
                }
                
                // Debug helpers
                view.showsFPS = true
                view.showsPhysics = true
                view.showsDrawCount = true
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // only perform these actions if the user touches on the shape
        if let touch = touches.first {
            if player.contains(touch.location(in: self)) {
                
                // increase the player size to que the user that they touches the piece
                player.size.width += 10
                player.size.height += 10
                isDragging = true
                
                // MARK: cartoon voice here!
                self.playCartoonVoice()
                
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isDragging {
            if let touch = touches.first {
                movePlayerTo(location: touch.location(in: self))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let spinAction = SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 0.5))
        let musicAction = SKAction.run { self.playSuccessMusic()}
        let zoomAction = SKAction.scale(by: 2, duration: 1)
        let transitionAction = SKAction.run {
            self.transitionToScene()
        }
        
        let wait = SKAction.wait(forDuration: 1)
        let zoomWithTransition = SKAction.sequence([wait, zoomAction, transitionAction])
        
        isDragging = false
        
        // reset the player size to the original size
        player.size.width -= 10
        player.size.height -= 10
        
        // Get the coordinates of the player when touch ends
        let xCoord = player.position.x
        let yCoord = player.position.y
        
        // Get the range around the matchShape
        let upperBoundx = match.position.x + 30
        let upperBoundy = match.position.y + 30
        let lowerBoundx = match.position.x - 30
        let lowerBoundy = match.position.y - 30

        // Check if the player is within the range of coordinates of the matchShape
        if lowerBoundx <= xCoord && xCoord <= upperBoundx {
            if lowerBoundy <= yCoord && yCoord <= upperBoundy {

                player.run(spinAction)
                player.run(musicAction)
                self.run(zoomWithTransition)
                
            }
        }
    }
    
    
    
    // MARK: call this func when the user touches the player
    func playCartoonVoice() {
        if let asset = NSDataAsset(name: "yahoo"), let pop = NSDataAsset(name: "pop") {
            do {
                // Use NSDataAssets's data property to access the audio file stored in cartoon voice says yahoo.
                soundEffect = try AVAudioPlayer(data: pop.data, fileTypeHint: ".mp3")
                audio = try AVAudioPlayer(data: asset.data, fileTypeHint: ".mp3")
                // Play the above sound file
                soundEffect?.play()
                audio?.play()
            } catch let error as NSError {
                // Should print...
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: call this function when the user successfully completes the challenges
    func playSuccessMusic() {
        // Fetch the sound data set.
        if let music = NSDataAsset(name: "clown_music") {
            do {
                // Use NSDataAssets's data property to access the audio file stored in cartoon voice says yahoo.
                
                audio = try AVAudioPlayer(data: music.data, fileTypeHint: ".mp3")
                // Play the above sound file
                
                audio?.play()
            } catch let error as NSError {
                // Should print...
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    func navigateToHomeScreen() {
        let home = MainMenuScene(fileNamed: "MainMenuScreen")
        home?.scaleMode = .aspectFill
        self.view?.presentScene(home!)
        print("did navigate to home")
    }
    
    
    func transitionToScene() {
        let levelTwo = DDLevelTwo(fileNamed: "DDLevelOne")
        levelTwo?.scaleMode = .aspectFill
        audio?.stop()
        self.view?.presentScene(levelTwo!)
        print("Success")
    }
  
    func movePlayerTo(location: CGPoint) {
        player.position = location
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}


