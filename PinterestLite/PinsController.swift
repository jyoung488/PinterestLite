//
//  PinsController.swift
//  PinterestLite
//
//  Created by Jennifer Young on 3/23/17.
//  Copyright © 2017 Jennifer Young. All rights reserved.
//

import Foundation
import PinterestSDK
import SwiftyJSON

class pinsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var boardId: String? = ""
    var boardName: String? = ""
    
    var pinArray = [PinModel]() {
        didSet {
            pinsCollection.reloadData()
        }
    }
    
    @IBOutlet var pinsCollection: UITableView!
    @IBOutlet var pinsLabel: UILabel!

    override func viewDidLoad() {
        pinsLabel.text = "Pins for \(boardName!)"
        self.pinsCollection.backgroundColor = UIColor.darkGray
        
        pinsCollection.delegate = self
        pinsCollection.dataSource = self
        
        PDKClient.sharedInstance().getBoardPins(boardId, fields: ["note", "image"], withSuccess: { (result) in
            if let pins = result?.parsedJSONDictionary["data"] as? [[String: Any]] {
                self.pinArray.removeAll()
                for pin in pins {
                    if let pin = PinModel(json: JSON(pin)) {
                        self.pinArray.append(pin)
                    }
                    print(pins)
                }
            }
        }, andFailure: nil
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !pinArray.isEmpty {
            return pinArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pinsCollection.dequeueReusableCell(withIdentifier: "pinsCell")
        
        cell?.textLabel?.text = pinArray[indexPath.row].note
        return cell!
    }
    
    
}
