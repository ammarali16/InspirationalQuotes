//
//  QuoteModel.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/27/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import Foundation

struct QuotesModel: Codable {
    var id: Int?
    var quote: String?
    var author: String?
    var isFavorite: Int?
   
}
