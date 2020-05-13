//
//  PlaySoundViewController.swift
//  pitchPerfect
//
//  Created by Mihaf on 18/09/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    @IBOutlet weak var echo: UIButton!
    @IBOutlet weak var reverb: UIButton!
    @IBOutlet weak var lowerPitch: UIButton!
    @IBOutlet weak var higherPitch: UIButton!
    @IBOutlet weak var fast: UIButton!
    @IBOutlet weak var slow: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var recordedAudioURL: URL!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

        @IBAction func playSoundForButton(_ sender: UIButton) {
            stopButton.isEnabled = true
            print("Play Sound Button Pressed")
             switch(ButtonType(rawValue: sender.tag)!) {
                   case .slow:
                       playSound(rate: 0.5)
                   case .fast:
                       playSound(rate: 1.5)
                   case .chipmunk:
                       playSound(pitch: 1000)
                   case .vader:
                       playSound(pitch: -1000)
                   case .echo:
                       playSound(echo: true)
                   case .reverb:
                       playSound(reverb: true)
                   }

                   configureUI(.playing)
           
       
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
          stopAudio()
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false
        setupAudio()

        // Do any additional setup after loading the view.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
