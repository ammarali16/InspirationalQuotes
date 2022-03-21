//
//  FavoriteViewController.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/30/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var favoriteArray = [QuotesModel]()
    var viewModel = QuotesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    func fetchData(){
        favoriteArray = viewModel.fetchFavoritesQuoteFromCoreData()
        tableView.reloadData()
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        
        let btn =  sender as! UIButton
        
        if let cell = btn.superview?.superview as? UITableViewCell{
            if let indexPath = self.tableView.indexPath(for: cell){
                let quote = favoriteArray[indexPath.row]
                
                let favorite = quote.isFavorite
                
                if favorite == 0 {
                    _ = viewModel.updateFavorite(id: favoriteArray[indexPath.row].id!, isFavorite: 1)
                }else{
                    _ = viewModel.updateFavorite(id: favoriteArray[indexPath.row].id!, isFavorite: 0)
                }
                
                fetchData()
            }
        }
    }
    
}
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return favoriteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritecell", for: indexPath) as! FavoriteCell
        let object = favoriteArray[indexPath.row]
        cell.configureCell(object: object)
        return cell
        
    }
}
