//
//  BoardsController.swift
//  PinterestLite
//
//  Created by Jennifer Young on 3/23/17.
//  Copyright © 2017 Jennifer Young. All rights reserved.
//

import Foundation
import PinterestSDK
import SwiftyJSON

class boardsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var boardsCollection: UITableView!
    var boardArray = [BoardModel](){
        didSet {
            boardsCollection.reloadData()
        }
    }
    
    override func viewDidLoad() {
        self.boardsCollection.backgroundColor = UIColor.black
        
        boardsCollection.delegate = self
        boardsCollection.dataSource = self
        
        PDKClient.sharedInstance().getAuthenticatedUserBoards(withFields: ["id", "image", "description", "name"], success: {
            (result) in
            
            if let boards = result?.parsedJSONDictionary["data"] as? [[String: Any]] {
                self.boardArray.removeAll()
                for board in boards {
                    if let board = BoardModel(json: JSON(board)) {
                        self.boardArray.append(board)
                    }
                }
                
                print("ARR NAME: \(self.boardArray[0].name)")
            
            }
        }, andFailure: nil
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !boardArray.isEmpty {
            return boardArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boardsCell")
        cell?.textLabel?.text = boardArray[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "pinsSegue", sender: indexPath)
    }
    
}
