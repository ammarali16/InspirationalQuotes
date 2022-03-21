//
//  SideMenuViewModel.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/29/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import Foundation

class SideMenuViewModel {
    
    func gettingSideMenu() -> [SideMenuModel]{
        
        var dataArray = [SideMenuModel]()
        
        
        let item1 = SideMenuModel(image: "home_icon_blue", title: "Home")
        let item2 = SideMenuModel(image: "favorites_icon_blue", title: "Favorites")
        let item3 = SideMenuModel(image: "about_icon_blue", title: "About Us")
        let item4 = SideMenuModel(image: "", title: "")
        let item5 = SideMenuModel(image: "", title: "")
        let item6 = SideMenuModel(image: "", title: "")
        
            
            
        dataArray.append(item1)
        dataArray.append(item2)
        dataArray.append(item3)
        dataArray.append(item4)
        dataArray.append(item5)
        dataArray.append(item6)
        
        
        
        return dataArray
    }
    
}
