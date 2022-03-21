//
//  GlobalSharedResources.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/29/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import Foundation


class GlobalSharedResources {
    
    //MARK: - Check screen
    public static var isIphone: Bool {
        get {
            return UIDevice.current.userInterfaceIdiom == .phone ? true : false
        }
    }
    
    
    public static func configureMFSideMenu(appdelegate: AppDelegate) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mfSideMenuController = storyBoard.instantiateViewController(withIdentifier: "MFSideMenuContainerViewController") as? MFSideMenuContainerViewController
        
        appdelegate.window?.rootViewController = nil
        appdelegate.window?.rootViewController = mfSideMenuController
        
        let navigationController = storyBoard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        let sideMenuViewController = storyBoard.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        
        
        mfSideMenuController?.centerViewController = navigationController
        mfSideMenuController?.leftMenuViewController = sideMenuViewController
        
        mfSideMenuController?.leftMenuWidth = 240
        
    }
    
}
