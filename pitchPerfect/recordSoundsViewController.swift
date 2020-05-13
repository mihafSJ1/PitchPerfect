//
//recordSoundsViewController.swift
//  pitchPerfect
//
//  Created by Mihaf on 10/09/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.
//

import UIKit
import AVFoundation

class recordSoundsViewController: UIViewController ,AVAudioRecorderDelegate{
//
    var audioRecorder: AVAudioRecorder!


    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingbutton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingbutton.isEnabled = false
    }
    

    @IBAction func recordAudio(_ sender: Any) {
        recordingButton.isEnabled = false
        recordingLabel.text="recording in progress "
        stopRecordingbutton.isEnabled = true
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
         
   

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
   
    @IBAction func stopRecord(_ sender: Any) {
           recordingButton.isEnabled = true
           stopRecordingbutton.isEnabled = false
           recordingLabel.text="Tap to Record! "
           audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
         try! audioSession.setActive(false)
    }
     func audioRecorderDidFinishRecording(_: AVAudioRecorder, successfully flag: Bool){
        if flag {
         
            performSegue(withIdentifier : "StopRecording", sender: audioRecorder.url)}
        else{
            print(" record was not sucssfull")
        }
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StopRecording" {
            let playsoundVS = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! URL
            playsoundVS.recordedAudioURL = recordedAudioURL
            
        }
        
    }
    
   
    
    
    
    
  
}

