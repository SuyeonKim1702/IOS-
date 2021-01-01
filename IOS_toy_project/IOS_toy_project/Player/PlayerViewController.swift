//
//  PlayerViewController.swift
//  IOS_toy_project
//
//  Created by 코드잉 on 2021/01/01.
//

import UIKit

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
        
        
        

    }
    

    @IBAction func beginDrag(_ sender: Any) {
    }
    
    
    @IBAction func endDrag(_ sender: Any) {
    }
    
    
    @IBAction func seekBar(_ sender: Any) {
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
    
}
