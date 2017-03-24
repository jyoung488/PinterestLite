//
//  BoardModel.swift
//  PinterestLite
//
//  Created by Jennifer Young on 3/23/17.
//  Copyright © 2017 Jennifer Young. All rights reserved.
//

import Foundation
import SwiftyJSON

class BoardModel {
    var description: String? = ""
    var name: String? = ""
    var id: String? = ""
    
    
    init(name: String) {
      self.name = name
    }
    
    convenience init?(json: JSON) {
        if let name = json["name"].string {
            self.init(name: name)
            self.description = json["description"].string
            self.name = json["name"].string
            self.id = json["id"].string
            
            return
        }
        return nil
    }
}
