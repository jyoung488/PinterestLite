//
//  PinModel.swift
//  PinterestLite
//
//  Created by Jennifer Young on 3/24/17.
//  Copyright © 2017 Jennifer Young. All rights reserved.
//

import Foundation
import SwiftyJSON

class PinModel {
    var note: String? = ""
    var image: String? = ""
    
    init(note: String) {
        self.note = note
    }
    
    convenience init?(json: JSON) {
        if let note = json["note"].string {
            self.init(note: note)
            self.image = json["image"].string
            return
        }
        return nil
    }
}
