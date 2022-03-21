//
//  SplashViewController.swift
//  InspirationalQuotes
//
//  Created by Ammar Ali on 3/9/22.
//  Copyright © 2022 Mujadidia Inc. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        print("viewWillAppear")
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        print("viewDidAppear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupUI(){
        UIView.transition(with: self.view, duration: 1, options: [.curveEaseIn], animations: {
            
        }, completion: { success in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                self.performSegue(withIdentifier: "toDashboard", sender: nil)
            }
        })
        
    }
}
