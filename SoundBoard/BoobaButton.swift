//
//  BoobaButton.swift
//  BoobaBoard
//
//  Created by Nicolas Besnard on 21/09/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit
import AVFoundation

class BoobaButton: UIButton
{
    var idImage: String = "" {
        didSet {
            self.setImage(UIImage(named: self.idImage), forState: UIControlState.Normal)
            self.setImage(UIImage(named: self.idImage + "a"), forState: UIControlState.Highlighted)
        }
    }
    
    var idSound: String = ""
    
    func getSoundUrl() -> NSURL!
    {
        let path = NSBundle.mainBundle().URLForResource("booba\(self.idSound)", withExtension: "mp3")
        
        if let url = path
        {            
            return url
        }
        
        return nil
    }
}