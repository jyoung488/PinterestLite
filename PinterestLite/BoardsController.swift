//
//  BoardsController.swift
//  PinterestLite
//
//  Created by Jennifer Young on 3/23/17.
//  Copyright © 2017 Jennifer Young. All rights reserved.
//

import Foundation
import PinterestSDK

class boardsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var boardsCollection: UICollectionView!
    
    override func viewDidLoad() {
        self.boardsCollection.backgroundColor = UIColor.red
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "boardsCell", for: indexPath)
        return collectionView
    }
}
