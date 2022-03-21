//
//  QuoteCell.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import UIKit

class QuoteCell: UICollectionViewCell {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    func configureCell(object: QuotesModel){
        
        self.quoteLabel.text = object.quote
        self.authorLabel.text = object.author
        
        if object.isFavorite == 1 {
            favoriteButton.setImage(#imageLiteral(resourceName: "favorite_icon"), for: .normal)
        }else {
            favoriteButton.setImage(#imageLiteral(resourceName: "un_favorite_icon"), for: .normal)
        }
    }
    
    
}
