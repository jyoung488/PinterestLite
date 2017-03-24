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
    
    var index = 0
    
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
//        let detailVC = pinsController()
//        detailVC.boardId = self.boardArray[indexPath.row].id
//        detailVC.boardName = self.boardArray[indexPath.row].name
//        self.present(detailVC, animated: true, completion: nil)
        
        index = indexPath.row
        
        self.performSegue(withIdentifier: "pinsSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let board = boardArray[index]
        
        if (segue.identifier == "pinsSegue") {
            if let nextVC = segue.destination as? pinsController {
                nextVC.boardId = board.id
                nextVC.boardName = board.name
            }
        }
    }
    
}
