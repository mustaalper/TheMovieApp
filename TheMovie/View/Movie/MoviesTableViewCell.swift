//
//  MoviesTableViewCell.swift
//  TheMovie
//
//  Created by MAA on 6.06.2022.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet var moviesImage: UIImageView!
    @IBOutlet var moviesName: UILabel!
    @IBOutlet var moviesCategory: UILabel!
    @IBOutlet var moviesDate: UILabel!
    @IBOutlet var moviesRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        moviesImage.layer.cornerRadius = 70
        moviesImage.layer.shadowColor = UIColor.gray.cgColor
        moviesImage.layer.shadowOpacity = 2
        moviesImage.layer.shadowRadius = 10
        
        layer.cornerRadius = 25
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 6.0
        //self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
