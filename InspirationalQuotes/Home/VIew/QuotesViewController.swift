//
//  QuotesViewController.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/27/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import UIKit
import SwiftyJSON

class QuotesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var quotesArray = [QuotesModel]()
    var viewModel = QuotesViewModel()
    
    var currentVisibleRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJsonData()
        fetchData()
//        let font = UIFont(name: "Poppins", size: 22)!
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: font]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.menuContainerViewController.menuOpenEnabled = true
        self.menuContainerViewController.panMode = MFSideMenuPanModeDefault
        fetchData()
    }
    
    func fetchData(){
        
        self.quotesArray = viewModel.fetchAllQuotesFromCoreData()
        collectionView.reloadData()
    }
    
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(
            x : contentOffset ,
            y : self.collectionView.contentOffset.y ,
            width : self.collectionView.frame.width,
            height : self.collectionView.frame.height)
        
        self.collectionView.scrollRectToVisible(frame, animated: false)
    }
    
    
    
    @IBAction func leftSwipeButton(_ sender: Any) {
        
        collectionView.isPagingEnabled = false
        guard self.currentVisibleRow < (self.quotesArray.count - 1) else {
            return
        }
        self.currentVisibleRow += 1
        print(currentVisibleRow)
        self.collectionView.scrollToItem(at: IndexPath(row: self.currentVisibleRow, section: 0), at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true
    }
    
    
    @IBAction func rightSwipeButton(_ sender: Any) {
        
        collectionView.isPagingEnabled = false
        guard self.currentVisibleRow > 0 else {
            return
        }
        self.currentVisibleRow -= 1
        print(currentVisibleRow)
        self.collectionView.scrollToItem(at: IndexPath(row: self.currentVisibleRow, section: 0), at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true
    }
    
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        
        let btn = sender as! UIButton
        
        if let cell = btn.superview?.superview?.superview as? UICollectionViewCell {
            if let indexPath = self.collectionView.indexPath(for: cell) {
                
                var quote = self.quotesArray[indexPath.row]
                
                if let favorite = quote.isFavorite {
                    print(favorite)
                    if favorite == 1 {
                        _ = viewModel.updateFavorite(id: quotesArray[indexPath.row].id!, isFavorite: 0)
                        quote.isFavorite = 0
                    }else{
                        _ = viewModel.updateFavorite(id: quotesArray[indexPath.row].id!, isFavorite: 1)
                        quote.isFavorite = 1
                    }
                }
                
                //                self.quotesArray.remove(at: indexPath.row)
                //                self.quotesArray.insert(quote, at: indexPath.row)
                //                self.collectionView.reloadData()
                fetchData()
                
            }
        }
        
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        let shareText = "Game Vault. \nDownload and Share this app."
        
        let url = URL.init(string: "https://itunes.apple.com/us/app/buck-it-your-saving-companion/id1431627600?ls=1&mt=8")
        
        
        let vc = UIActivityViewController(activityItems: [shareText, url!], applicationActivities: [])
        self.present(vc, animated: true)
    }
    
    
    @IBAction func slideDrawerButton(_ sender: Any) {
        
        self.menuContainerViewController.toggleLeftSideMenuCompletion {
            print("Menu Opened")
        }
    }
    
    
    func getJsonData(){
        
        if !AppDefaults.isAppStartingFirstTime{
            
            let fileName = "quotes"
            
            if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
                
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResponse = JSON(data)
                    let decoder = JSONDecoder()
                    
                    do{
                        let quotes = try jsonResponse.rawData()
                        let quote = try decoder.decode([QuotesModel].self, from: quotes)
                        quotesArray = quote
                        
                        for i in 0 ..< quotesArray.count {
                            
                            let id = i+1
                            let quote = quotesArray[i]
                            let newQoute = QuotesModel(id: id, quote: quote.quote, author: quote.author, isFavorite: 0)
                            
                            _ = self.viewModel.saveQuestion(item: newQoute)
                            
                        }
                        
                        //Set notifications
                        for i in 1 ... 365 {
                            
                            var randomNum:UInt32 = arc4random_uniform(UInt32(quotesArray.count - 1))
                            
                            if randomNum == 0 { randomNum = 1 }
                            
                            if let quote = self.viewModel.fetchQuoteFromCoreData(id: Int(randomNum)) {
                                
                                guard let date = Calendar.current.date(byAdding: .minute, value: i, to: Date()) else {
                                    return
                                }
                                
                                //                                let newDateString = "\(date.getDateString(format: "yyyy-MM-dd")) 09:00:00"
                                //
                                //                                guard let newDate = newDateString.date(withFormat: "yyyy-MM-dd HH:mm:ss") else {
                                //                                    return
                                //                                }
                                
                                let identifier = "quote\(i)"
                                
                                guard let title = quote.author, let body = quote.quote else { return }
                                
//                                NotificationHandler.createNotification(identifier: identifier, title: title, body: body, date: date, userInfo: ["id": quote.id!])
                                
                            }
                        }
                        AppDefaults.isAppStartingFirstTime = true
                    }
                }
                catch(let error){
                    print("error: \(error.localizedDescription)")
                }
            }
        }
        else {
            self.quotesArray = self.viewModel.fetchAllQuotesFromCoreData()
        }
    }
}


extension QuotesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quotesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quotecell", for: indexPath) as! QuoteCell
        let quoteObject = self.quotesArray[indexPath.row]
        cell.configureCell(object: quoteObject)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize.init(width: (width), height: height)
    }
    
}


