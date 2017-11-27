//
//  NCMainGuidedChannelListViewController.swift
//  SocialSearcherSwift
//
//  Created by NakCheon Jung on 12/11/2017.
//  Copyright © 2017 ncjung. All rights reserved.
//

import UIKit

class NCMainGuidedChannelListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, NCChannelItemCellDelegate  {
    
    @IBOutlet weak var collectionChannelList: UICollectionView!
    @IBOutlet weak var collectionChannelListLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _initializeSetting()
        _initializeUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MoveToList" {
            print("segue.identifier = \(String(describing: segue.identifier)), sender = \(String(describing: sender))")
            let videoListViewController:NCVideoListViewController = segue.destination as! NCVideoListViewController
            videoListViewController.userInfo = sender as? Dictionary<String, Any>
        }
    }
    
    override func canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, withSender sender: Any) -> Bool {
        print("canPerformUnwindSegueAction")
        
        if super.canPerformAction(action, withSender: sender) == false {
            return false
        }
        
        if fromViewController .isEqual(self) {
            return false
        }
        
        return true
    }
    
    @IBAction func prepareForUnwindToMainGuidedChannelView(_ segue: UIStoryboardSegue) {
        print("prepareForUnwindToMainGuidedChannelView")
    }
    
    // MARK: - Private
    
    func _initializeSetting() {
        
    }
    
    func _initializeUI() {
        
        self.title = "Recommanded Channels"
        
        print("self.navigationController = \(String(describing: self.navigationController))")
        
        _createCollectionview()
        
    }
    
    func _createCollectionview() {
        collectionChannelListLayout.scrollDirection = .vertical;
        
        let width = (UIScreen.main.bounds.size.width - 10.0 - 5.0) / 2.0 
        collectionChannelListLayout.itemSize = CGSize(width: width, height: width)
        
    }
    
    // MARK: NCChannelItemCellDelegate
    
    func actionCellCoveringButtonClicked() {
        print("NCMainGuidedChannelListViewController::actionCellCoveringButtonClicked")
        self.performSegue(withIdentifier: "MoveToList", sender: ["title" : "list title"])
    }


    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NCChannelItemCell = collectionView .dequeueReusableCell(withReuseIdentifier:"NCChannelItemCell", for: indexPath) as! NCChannelItemCell
        cell.delegate = self as NCChannelItemCellDelegate;
        cell.configure()
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView::didSelectItemAt::indexPath = \(indexPath.row)")
    }
    
}
