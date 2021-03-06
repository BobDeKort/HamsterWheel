//
//  SpellingLevel.swift
//  HamsterWheel
//
//  Created by Bob De Kort on 3/22/18.
//  Copyright © 2018 HamsterWheel. All rights reserved.
//

import Foundation

import UIKit
import SpriteKit
import AVFoundation

class SpellingLevel: SKScene {
    // Stores the data for each button
    let animalData = [SpellButtonData(word: "Cow",
                                      defaultImage: #imageLiteral(resourceName: "cowButton"),
                                      pressedImage: #imageLiteral(resourceName: "cowButtonPressed"),
                                      audioFileName: "cowMoo",
                                      audioFileExtension: ".mp3",
                                      imageScale: 1),
                      SpellButtonData(word: "Dog",
                                      defaultImage: #imageLiteral(resourceName: "dogButton"),
                                      pressedImage: #imageLiteral(resourceName: "dogButtonPressed"),
                                      audioFileName: "dogBark",
                                      audioFileExtension: ".wav",
                                      imageScale: 1),
                      SpellButtonData(word: "Cat",
                                      defaultImage: #imageLiteral(resourceName: "catButton"),
                                      pressedImage: #imageLiteral(resourceName: "catButtonPressed"),
                                      audioFileName: "catMeow",
                                      audioFileExtension: ".wav",
                                      imageScale: 0.85)]
    
    // Navigation
    var levelSelector: AudioGameLevelSelector?
    
        // Navigation buttons
    var menuButton: SKButton!
    var nextButton: SKButton!
    var backButton: SKButton!
    
    // Audio
    var audio: AVAudioPlayer?
    
    // Spelling
    var spellLabel: SKLabelNode?
    var isSpelling: Bool = false
    
    override func didMove(to view: SKView) {
        // Setup Animal Buttons
        setupAnimalButtons()
        
        // Setup Navigation Buttons
        setupHomeButton()
        setupBackButton()
        
        // Setup Label
        setupSpellLabel()
        
        // Avoids letter boxing on iPad
        sceneDidLayoutSubviews()
        // Avoids letter boxing on iPhoneX
        iPhoneXLetterBoxing()
    }
    
    /*
     Adds animal buttons to the scene
     Will add all buttons in "animalData" and distribute them over the width of the screen
     */
    func setupAnimalButtons() {
        if let view = view {
            let ratio = 1.0 / Double(animalData.count + 1)
            for (i, data) in animalData.enumerated() {
                addButtonAtPosition(x: view.bounds.width * CGFloat(ratio * Double(i + 1)),
                                    y: view.bounds.height * 0.50,
                                    data: data)
            }
        }
    }
}

extension SpellingLevel {
    
    func addButtonAtPosition(x: CGFloat, y: CGFloat, data: SpellButtonData) {
        // Creates button to play audio
        let audioButton = SKButton2(defaultButtonImage: data.defaultImage, activeButtonImage: data.pressedImage, buttonAction: { [unowned self] in
            if !self.isSpelling {
                self.audioButtonPressed(data: data)
            }
        })
        
        // Image scale
        audioButton.setScale(CGFloat(data.scale))
        
        // Position
        audioButton.position = convertPoint(fromView: CGPoint(x: x, y: y))
        
        // Add button to view
        addChild(audioButton)
    }
    
    func audioButtonPressed(data: SpellButtonData) {
        // Update the state to prevent spamming
        self.isSpelling = true
        
        // show the spelling of the animal
        spellWord(word: data.word)
    }
    
    // Audio
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
}
