//
//  FavoriteCell.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/30/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    func configureCell(object: QuotesModel){
        
        self.quoteLabel.text = object.quote
        self.authorLabel.text = object.author
        self.imageLabel.image = UIImage(named: "small_quote_icon")
        
    }
}
