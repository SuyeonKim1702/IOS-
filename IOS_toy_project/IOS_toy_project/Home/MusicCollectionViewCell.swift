//
//  MusicCollectionViewCell.swift
//  IOS_toy_project
//
//  Created by 코드잉 on 2020/12/30.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var singer: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //곡 정보 넣어주기
    func updateUI(item: Track?) {
        guard let track = item else { return }
        thumbImage.image = track.artwork
        title.text = track.title
        singer.text = track.artist
    }

}
