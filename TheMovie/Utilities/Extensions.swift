//
//  Extensions.swift
//  TheMovie
//
//  Created by MAA on 7.06.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension String {
    func getDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        
        if let date1 = dateFormatter.date(from: date) {
            //print(dateFormatterPrint.string(from: date1))
            return dateFormatterPrint.string(from: date1)
        } else {
           print("There was an error decoding the string")
        }
        
        return "n/a"
    }
}
