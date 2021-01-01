//
//  PlayerViewController.swift
//  IOS_toy_project
//
//  Created by 코드잉 on 2021/01/01.
//

import UIKit
import Foundation
import AVFoundation

class PlayerViewController: UIViewController {
    

    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var totalDurationTimeLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    let simplePlayer = SimplePlayer.shared
    var timeObserver: Any?
    var isSeeking: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = simplePlayer.currentItem?.convertToTrack()
        singerLabel.text = item?.artist
        titleLabel.text = item?.title
        thumbnailImageView.image = item?.artwork
        
        updateTime(time: CMTime.zero)
        timeObserver = simplePlayer.addPeriodicTimeObserver(forInterval:  CMTime(seconds: 1, preferredTimescale: 10), queue: DispatchQueue.main, using: {time in self.updateTime(time: time)})
        
    }
    

    @IBAction func beginDrag(_ sender: Any) {
        isSeeking = true
    }
    
    
    @IBAction func endDrag(_ sender: Any) {
        isSeeking = false
       
    }
    
    
    @IBAction func seekBar(_ sender: UISlider) {
        
        guard let currentItem = simplePlayer.currentItem else { return }
        let position = Double(sender.value)
        let seconds = currentItem.duration.seconds * position
        let time = CMTime(seconds: seconds, preferredTimescale: 100)
        simplePlayer.seek(to: time)
        
        
    }
    
    @IBAction func toggleButton(_ sender: Any) {
        if(simplePlayer.isPlaying){
            simplePlayer.pause()
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
            playButton.setImage(image, for: .normal)
        }else{
            simplePlayer.play()
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
            playButton.setImage(image, for: .normal)
        }



    }
    
    func secondsToString(sec: Double) -> String {
        guard sec.isNaN == false else { return "00:00" }
        let totalSeconds = Int(sec)
        let min = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", min, seconds)
    }
    
    func updateTime(time: CMTime) {
        // print(time.seconds)
        // currentTime label, totalduration label, slider
        currentTimeLabel.text = secondsToString(sec: simplePlayer.currentTime)   // 3.1234 >> 00:03
        totalDurationTimeLabel.text = secondsToString(sec: simplePlayer.totalDurationTime)  // 39.2045  >> 00:39
        
        if isSeeking == false {
            // 노래 들으면서 시킹하면, 자꾸 슬라이더가 업데이트 됨, 따라서 시킹아닐때마다 슬라이더 업데이트하자
            timeSlider.value = Float(simplePlayer.currentTime/simplePlayer.totalDurationTime)
        }
    }
    
}
