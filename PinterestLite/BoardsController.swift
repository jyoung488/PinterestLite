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

class boardsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var boardsCollection: UICollectionView!
    
    override func viewDidLoad() {
        self.boardsCollection.backgroundColor = UIColor.red
        
        PDKClient.sharedInstance().getAuthenticatedUserBoards(withFields: ["id", "image", "description", "name", "privacy"], success: {
            (result) in
            
            if let boards = result?.parsedJSONDictionary["data"] as? [[String: Any]] {
                for board in boards {
                    print(board)
                }
            
            }
        }, andFailure: nil
        )
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "boardsCell", for: indexPath)
        return cell
    }
    
    
}
