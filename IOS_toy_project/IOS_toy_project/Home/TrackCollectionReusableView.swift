//
//  TrackCollectionReusableView.swift
//  IOS_toy_project
//
//  Created by 코드잉 on 2021/01/01.
//

import UIKit
import AVFoundation


class TrackCollectionReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    
    
    @IBAction func cardTapped(_ sender: Any) {
        //TODO 카드 탭했을 때 처리
    }
    
    //곡 정보 넣어주기
    func update(item: AVPlayerItem?) {
        guard let track = item?.convertToTrack() else {return}
        self.thumbImage.image = track.artwork
        self.desc.text = "Today's pick is \(track.artist)'s album - \(track.artist) Let's listen."
     
    }
    
    
}
