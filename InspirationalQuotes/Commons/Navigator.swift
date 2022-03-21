//
//  Navigator.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/29/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import Foundation

class Navigator{
    
    public static func gotoHomeScreen(navigationController: UINavigationController,animation: Bool = true){
        let vc = UIStoryboard.init(name: AppRouter.storyboarName, bundle: nil).instantiateViewController(withIdentifier: AppRouter.QuotesViewController) as! QuotesViewController
        navigationController.pushViewController(vc, animated: animation)
    }
    
    public static func gotoFavriteScreen(navigationController: UINavigationController,animation: Bool = true){
        let vc = UIStoryboard.init(name: AppRouter.storyboarName, bundle: nil).instantiateViewController(withIdentifier: AppRouter.FavoriteViewController) as! FavoriteViewController
        navigationController.pushViewController(vc, animated: animation)
    }
    
    public static func gotoPrivacyScreen(navigationController: UINavigationController,animation: Bool = true){
        let vc = UIStoryboard.init(name: AppRouter.storyboarName, bundle: nil).instantiateViewController(withIdentifier: AppRouter.PrivacyViewController) as! PrivacyViewController
        navigationController.pushViewController(vc, animated: animation)
    }
}
