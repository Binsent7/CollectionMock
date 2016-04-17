//
//  ACollectionViewCell.swift
//  CollectionMock
//
//  Created by hishinuma on 2016/04/14.
//  Copyright © 2016年 Plus. All rights reserved.
//

import Foundation
import UIKit

class ACollectionViewCell: UICollectionViewCell {
    
    var textLabel: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        let rect = CGRectMake(0, 0, frame.size.width, frame.size.height)
        textLabel = UILabel(frame: rect)
        textLabel?.text = "テスト"
        textLabel?.backgroundColor = UIColor.greenColor()
        textLabel?.textAlignment = .Center
        
        contentView.addSubview(textLabel!)
    }
}