//
//  ViewController.swift
//  BoobaBoard
//
//  Created by Nicolas Besnard on 21/09/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    var audioPlayer: AVPlayer!
    
    var titles: [String] = []

    @IBAction func didClickOnBooba(sender: AnyObject)
    {
        let button = sender as? BoobaButton
        
        if let boobaButton = button
        {
            let sound = AVPlayerItem(URL: boobaButton.getSoundUrl())
            
            self.audioPlayer.replaceCurrentItemWithPlayerItem(sound)
            self.audioPlayer.play()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        audioPlayer = AVPlayer()
        
        loadJson()
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    
    func loadJson()
    {
        let filePath = NSBundle.mainBundle().pathForResource("booba", ofType: "json")
        
        var titles: String = NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding, error: nil)
        self.titles = titles.componentsSeparatedByString(";")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 75
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCellId", forIndexPath: indexPath) as CollectionViewCell
        
        cell.button.idImage = NSString(format: "%02d", indexPath.row + 1)
        if indexPath.row > 0
        {
            cell.button.idSound = NSString(format: "%02d", indexPath.row)
        }
        cell.titleLabel.text = self.titles[indexPath.row]
        return cell
    }
        
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

