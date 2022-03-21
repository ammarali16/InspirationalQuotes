//
//  SideMenuViewController.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    var sideMenuArray = [SideMenuModel]()
    var viewModel = SideMenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData(){
        
        self.sideMenuArray = viewModel.gettingSideMenu()
    }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return sideMenuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sidemenucell", for: indexPath) as! SideMenuCell
        let object = sideMenuArray[indexPath.row]
        cell.configureCell(object: object)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            self.gotoQuoteScreen()}
        else if indexPath.row == 1 {
            self.gotoFavortieScreen()
        }
        else if indexPath.row == 2 {
            self.gotoPrivacyScreen()
        }
    }
}

extension SideMenuViewController {
    
    private func gotoQuoteScreen(){
        self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
            if let navController = self.menuContainerViewController.centerViewController as? UINavigationController {
                Navigator.gotoHomeScreen(navigationController: navController)
            }
        })
    }
    
    private func gotoFavortieScreen(){
        self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
            if let navController = self.menuContainerViewController.centerViewController as? UINavigationController {
                Navigator.gotoFavriteScreen(navigationController: navController)
            }
        })
    }
    
    private func gotoPrivacyScreen(){
        self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: {
            if let navController = self.menuContainerViewController.centerViewController as? UINavigationController {
                Navigator.gotoPrivacyScreen(navigationController: navController)
            }
        })
    }
    
}
