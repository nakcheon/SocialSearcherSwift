//
//  NCVideoListViewController.swift
//  SocialSearcherSwift
//
//  Created by NakCheon Jung on 26/11/2017.
//  Copyright © 2017 ncjung. All rights reserved.
//

import UIKit

class NCVideoListViewController: UIViewController {

    var userInfo: Dictionary<String, Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("self.userInfo = \(String(describing: self.userInfo))")
        self.title = self.userInfo?["title"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "UnwindToMainGuidedChannel" {
            print("segue.identifier = \(String(describing: segue.identifier)), sender = \(String(describing: sender))")
        }
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super .willMove(toParentViewController: parent)
        if (parent == nil) {
            print("willMove toParentViewController")
        }
    }
    
    // MARK: - Actions
    
    @IBAction func actionBackButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "UnwindToMainGuidedChannel", sender: ["unwindDta" : "listData"])
    }

}
