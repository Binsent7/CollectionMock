//
//  PopOverViewController.swift
//  CollectionMock
//
//  Created by hishinuma on 2016/04/17.
//  Copyright © 2016年 Plus. All rights reserved.
//

import Foundation
import UIKit

protocol PopOverViewControllerDelegate {
    func closed() -> Void
}

class PopOverViewController: UIViewController {
    
    var delegate: PopOverViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapRotationButton(sender: AnyObject) {
        dismissViewControllerAnimated(true) { _ in
            self.delegate?.closed()
        }
    }
}