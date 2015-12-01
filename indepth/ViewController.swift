//
//  ViewController.swift
//  indepth
//
//  Created by Aleph Retamal on 11/30/15.
//  Copyright © 2015 Aleph Retamal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bottomConstraint.constant = view.frame.size.height
        
        let redPGR = UIPanGestureRecognizer(target: self, action: "panFunc:")
        let greenPGR = UIPanGestureRecognizer(target: self, action: "panFunc:")
        redView.addGestureRecognizer(redPGR)
        greenView.addGestureRecognizer(greenPGR)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func panFunc(gesture:UIPanGestureRecognizer) {
        let translationInView = gesture.translationInView(gesture.view!)
        bottomConstraint.constant = gesture.view == self.greenView ? -translationInView.y : view.frame.size.height - translationInView.y
        
        if gesture.state == .Began {
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                self.redView.transform = CGAffineTransformMakeScale(0.95, 0.95)
            })
        }
        
        if gesture.state == UIGestureRecognizerState.Ended {
            if bottomConstraint.constant > view.frame.size.height / 2 {
                bottomConstraint.constant = view.frame.size.height
                UIView.animateWithDuration(1, animations: { () -> Void in
                    self.redView.transform = CGAffineTransformMakeScale(1, 1)
                })
            } else {
                bottomConstraint.constant = 0
            }
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }



}

