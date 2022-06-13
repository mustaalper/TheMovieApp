//
//  TvSeriesCollectionViewCell.swift
//  TheMovie
//
//  Created by MAA on 9.06.2022.
//

import UIKit

class TvSeriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var seriesImage: UIImageView!
    @IBOutlet var seriesName: UILabel!
    @IBOutlet var seriesRating: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 15
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 6.0
        //self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    
}
