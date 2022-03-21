//
//  AppRouter.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/29/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import Foundation


class AppRouter{
    
    public static var storyboarName: String {
        get{
            if GlobalSharedResources.isIphone {
                return "Main"
            }else{
                return "Main_iPad"
            }
        }
    }
    
    //MARK: - Segues
    
    
    //MARK: - View Controller Identifiers
    public static let MFSideMenuContainerViewControllerIdentifier = "MFSideMenuContainerViewController"
    public static let SideMenuViewControllerIdentifier = "SideMenuViewController"
    public static let navigationControllerIdentifier = "NavigationControllers"
    
    
    public static let QuotesViewController = "toQuotesViewController"
    public static let FavoriteViewController = "toFavoriteViewController"
    public static let PrivacyViewController = "toPrivacyViewController"
    
}
