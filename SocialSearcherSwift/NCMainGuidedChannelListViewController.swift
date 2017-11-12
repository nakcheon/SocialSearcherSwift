//
//  NCMainGuidedChannelListViewController.swift
//  SocialSearcherSwift
//
//  Created by NakCheon Jung on 12/11/2017.
//  Copyright © 2017 ncjung. All rights reserved.
//

import UIKit

class NCMainGuidedChannelListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet weak var collectionChannelList: UICollectionView!
    @IBOutlet weak var collectionChannelListLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        privateInitializeSetting()
        privateInitializeUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Private
    
    func privateInitializeSetting() {
        
    }
    
    func privateInitializeUI() {
        privateCreateCollectionview()
        
    }
    
    func privateCreateCollectionview() {
        collectionChannelListLayout.scrollDirection = .vertical;
        
        let width = (UIScreen.main.bounds.size.width / 2.0) - 0.0
        collectionChannelListLayout.itemSize = CGSize(width: width, height: width)
        
    }
    


    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier:"NCChannelItemCell", for: indexPath)
        return cell;
    }
    
    
}
