//
//  AGlevel3.swift
//  HamsterWheel
//
//  Created by Bob De Kort on 1/30/18.
//  Copyright © 2018 Bob De Kort. All rights reserved.
//

import SpriteKit
import AVFoundation

class AGlevel3: SKScene {
    
    var playingSound: Bool = false
    var audioButton: SKButton2!
    var nextButton: SKButton2!
    var titleLabel: SKLabelNode!
    
    var audio: AVAudioPlayer?
    
    override func didMove(to view: SKView) {
        // Creating and adding audio button to view
        setupAudioButton()
        // Creating and adding title label
        setupTitleLabel()
        // Creating and adding next level button
        setupNextLevelButton()
    }
    
    // UI Setup
    
    func setupTitleLabel() {
        // Create title label
        titleLabel = SKLabelNode(text: "The cow 🐮🐄 says ...")
        // Position on screen
        // TODO: do position based on view size
        titleLabel.position = CGPoint(x: 0, y: 170)
        titleLabel.fontSize = 48
        titleLabel.fontName = "Arial-BoldMT"
        // Adding title label to view
        addChild(titleLabel)
    }
    
    func setupAudioButton() {
        // Creates button to play audio
        audioButton = SKButton2(defaultButtonImage: "redButton", activeButtonImage: "redButtonPressed", buttonAction: { [unowned self] in
            self.playAudio(soundName: "cowMoo", soundExtention: ".mp3")
            self.nextButton.isHidden = false
        })
        // Position in center of the screen
        audioButton.position = CGPoint(x: 0, y: 0)
        // Add button to view
        addChild(audioButton)
    }
    
    func setupNextLevelButton() {
        nextButton = SKButton2(defaultButtonImage: "nextButton", activeButtonImage: "nextButton", buttonAction: transitionToNextScene)
        nextButton.position = CGPoint(x: 200, y: 0)
        // Setting is hidden to true to hide it until the audio button has been pressed once
        nextButton.isHidden = true
        addChild(nextButton)
    }
    
    // Functionality
    
    func playAudio(soundName: String, soundExtention: String) {
        // Fetch the sound data set.
        if let asset = NSDataAsset(name: soundName) {
            do {
                // Use NSDataAssets's data property to access the audio file stored in cartoon voice says yahoo.
                audio = try AVAudioPlayer(data: asset.data, fileTypeHint: soundExtention)
                // Play the above sound file
                audio?.play()
            } catch let error as NSError {
                // Should print...
                print(error.localizedDescription)
            }
        }
    }
    
    func transitionToNextScene() {
        let level4 = AGlevel4(fileNamed: "AGlevel4")
        self.view?.presentScene(level4)
    }
}
