//
//  ViewController.swift
//  PinterestLite
//
//  Created by Jennifer Young on 3/23/17.
//  Copyright © 2017 Jennifer Young. All rights reserved.
//

import UIKit
import PinterestSDK

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var pinterestLoginSuccess = false
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 2
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        loginButton.isHidden = true;
        
        PDKClient.sharedInstance().authenticate(withPermissions:
            [PDKClientReadPublicPermissions,
             PDKClientWritePublicPermissions,
             PDKClientReadRelationshipsPermissions,
             PDKClientWriteRelationshipsPermissions], from: self, withSuccess: { (response) in
                //
                self.pinterestLoginSuccess = true;
                self.performSegue(withIdentifier: "boardsSegue", sender: sender)

        }) { (error) in
            //
        }
    }

}
