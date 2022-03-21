//
//  SideMenuCell.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/29/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var sideLabel: UILabel!
    
    func configureCell(object: SideMenuModel){
        
        self.iconImage.image = UIImage(named: object.image!)
        self.sideLabel.text = object.title
    }
}
