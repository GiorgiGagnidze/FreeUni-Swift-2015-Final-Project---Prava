//
//  GameCell.swift
//  PravaProject
//
//  Created by Koko Tagauri on 1/11/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    
    var imagePath: String? {
        didSet {
            gameImage.image = nil
            if let path = imagePath {
                let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
                dispatch_async(dispatch_get_global_queue(qos, 0)) {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        if path == self.imagePath {
                            self.gameImage.image = self.loadImageFromPath(path)
                        }
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
    
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
    
            print("missing image at: \(path)")
        } else {
        
            //print("Loading image from path: \(path)")
            
        }
        return image
    
    }

}
