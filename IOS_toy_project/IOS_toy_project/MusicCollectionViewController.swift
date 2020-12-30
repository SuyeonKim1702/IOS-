//
//  MusicCollectionViewController.swift
//  IOS_toy_project
//
//  Created by 코드잉 on 2020/12/30.
//

import UIKit

private let reuseIdentifier = "MusicCollectionViewCell"

class MusicCollectionViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.register(UINib(nibName: "MusicCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MusicCollectionViewCell")
     
        
    }
}

extension MusicCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    //한개의 셀에 데이터를 몇개 표시할 것인가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //셀을 어떻게 보여줄까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //TODO 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as? MusicCollectionViewCell
        
        //nil일 경우에
        else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    //헤더뷰 어떻게 표시할까?
   /* func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        return 1
      
    }
    
    
    // 아이템 클릭시에 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
 */
    
    
}

   



