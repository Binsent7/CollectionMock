//
//  ViewController.swift
//  CollectionMock
//
//  Created by hishinuma on 2016/04/14.
//  Copyright © 2016年 Plus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var rotationView: UIView!
    
    @IBOutlet weak var rotationFrameView: UIView!
    @IBOutlet weak var rotationPanView: UIView!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        rotationView.hidden = true
        let tapRotationViewGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTapRotationView(_:)))
        rotationView.addGestureRecognizer(tapRotationViewGesture)
        
        rotationFrameView.layer.borderColor = UIColor.blackColor().CGColor
        rotationFrameView.layer.borderWidth = 2.0
        rotationFrameView.backgroundColor = UIColor.clearColor()
        rotationFrameView.hidden = true
        
        let rotationPanGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.didPanRotationView(_:)))
        rotationPanView.addGestureRecognizer(rotationPanGesture)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTapFirstView(_:)))
        let panGesutre = UIPanGestureRecognizer(target: self, action: #selector(ViewController.didPanFirstView(_:)))
        firstView.addGestureRecognizer(gesture)
        firstView.addGestureRecognizer(panGesutre)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didTapRotationView(sender: UITapGestureRecognizer) {
        hideRotationView()
    }
    
    @IBAction func didTapFirstView(sender: AnyObject) {
        print("didTapFirstView")
        let storyboard = UIStoryboard.init(name: "PopOverViewController", bundle: nil)
        if let viewController = storyboard.instantiateViewControllerWithIdentifier("tapView") as? PopOverViewController {
            viewController.modalPresentationStyle = .Popover
            viewController.preferredContentSize = CGSizeMake(262, 50)
            viewController.delegate = self
            presentViewController(viewController, animated: true, completion: nil)
            
            let height = firstView.frame.size.height
            let width = firstView.frame.size.width
            
            let popController = viewController.popoverPresentationController
            popController?.permittedArrowDirections = .Any
            popController?.sourceView = firstView
            popController?.sourceRect = CGRectMake(0, 0, width, height)
            popController?.backgroundColor = UIColor.whiteColor()
        }
    }
    
    func didPanFirstView(sender: UIPanGestureRecognizer) {
        print("didPanFirstView")
        let translation = sender.translationInView(view)
        firstView.center = CGPointMake(firstView.center.x + translation.x, firstView.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: view)
    }
    
    func didPanRotationView(sender: UIPanGestureRecognizer) {
        print("didPanRotationView")
    }
    
    func showRotationView() {
        firstView.removeFromSuperview()
        rotationView.addSubview(firstView)
        firstView.userInteractionEnabled = true
        rotationFrameView.frame = firstView.frame
        rotationFrameView.hidden = false
        rotationView.hidden = false
    }
    
    func hideRotationView() {
        scrollView.addSubview(firstView)
        firstView.userInteractionEnabled = true
        rotationFrameView.hidden = true
        rotationView.hidden = true
    }
}

extension ViewController: PopOverViewControllerDelegate {
    func closed() {
        showRotationView()
    }
}
