//
//  CollectionViewCell.swift
//  hr_Scrolling_images
//
//  Created by Prince's Mac on 09/08/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var isLiked = false
    let filledHeartImage = UIImage(systemName: "heart.fill")
    let unfilledHeartImage = UIImage(systemName: "heart")
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var heartBTN: UIButton!
    @IBOutlet weak var percentView: UIView!
    @IBOutlet weak var descriptionLBL: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var collectedValueLBL: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var endsLBL: UILabel!
    
    @IBAction func pledgeBTN(_ sender: Any) {
        
    }
    
    @IBAction func heartBTN_like(_ sender: Any) {
        heartButtonTapped()
    }
    
    //MARK: FUNCTION FOR LIKE BUTTON IMAGE CANGING.
    func heartButtonTapped() {
        isLiked.toggle()
        if isLiked == true {
            heartBTN.setImage(filledHeartImage, for: .normal)
            
        } else  {
            heartBTN.setImage(unfilledHeartImage, for: .normal)
        }
    }
}
