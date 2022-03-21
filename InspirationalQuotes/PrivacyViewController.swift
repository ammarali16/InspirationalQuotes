//
//  PrivacyViewController.swift
//  InspirationalQuotes
//
//  Created by Ammar Ali on 7/3/21.
//  Copyright © 2021 Mujadidia Inc. All rights reserved.
//

import Foundation

class PrivacyViewController: UIViewController {
    
    @IBOutlet weak var aboutUSLabel: UILabel!
    
    var aboutText = "Here is an Inpirational Quotes App for you!\nInspirational Quotes can make your day brighter, craft a smile on your face, or even lift you up a little.\n\n  These inspring quotes will help you to find the motivation you need every morning.\n\nKey Features:-\n\n* More than 100 Quotes\n\n* Share the Quotes\n\n* You can save your favorite quotes by just a tap of favorite button."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.aboutUSLabel.text = aboutText
    }
    
    
}

