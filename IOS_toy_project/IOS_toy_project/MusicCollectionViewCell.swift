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

}
