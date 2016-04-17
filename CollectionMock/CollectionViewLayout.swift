//
//  CollectionViewLayout.swift
//  CollectionMock
//
//  Created by hishinuma on 2016/04/14.
//  Copyright © 2016年 Plus. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewLayout: UICollectionViewLayout {
    
    var itemHeight: Int
    var itemWidth: Int
    var space: Int
    
    init(itemHeight:Int, itemWidth: Int, space: Int) {
        
        self.itemHeight = itemHeight
        self.itemWidth = itemWidth
        self.space = space
        
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareLayout() {
        // レイアウト情報を計算
    }
    
    override func collectionViewContentSize() -> CGSize {
        // 先に計算した結果に基づき、コンテンツ全体を収容する領域の大きさを返す
        return CGSizeZero
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // 指定された短形内にあるセルやビューの属性を返す
        return []
    }
}

class CollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    init(forCellWithIndexPath indexPath: NSIndexPath) {
        
    }
    init(forSupplementaryViewOfKind elementKind: String, withIndexPath indexPath: NSIndexPath) {
        
    }
    init(forDecorationViewOfKind decorationViewKind: String, withIndexPath indexPath: NSIndexPath) {
        
    }
}