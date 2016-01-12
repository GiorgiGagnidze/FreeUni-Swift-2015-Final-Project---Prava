//
//  ImageCell.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var questionImage: UIImageView!

    var imagePath: String? {
        didSet {
            questionImage.image = nil
            if let path = imagePath {
                let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
                dispatch_async(dispatch_get_global_queue(qos, 0)) {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        if path == self.imagePath {
                            self.questionImage.image = self.loadImageFromPath(path)
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
            
            print("Loading image from path: \(path)")
            
        }
        return image
        
    }

    
}
