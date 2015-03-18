//
//  NavigationControllerDelegate.swift
//  CustomAnimation
//
//  Created by Anak Mirasing on 3/18/2558 BE.
//  Copyright (c) 2558 iGROOMGRiM. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject,UINavigationControllerDelegate {
    @IBOutlet var navigationController: UINavigationController!
    var interactionController:UIPercentDrivenInteractiveTransition?
    var animator = CustomAnimator()
    
    override func awakeFromNib() {
        var panRecognizer = UIPanGestureRecognizer(target: self, action: "panGestureAction:")
        self.navigationController.view.addGestureRecognizer(panRecognizer)
        
    }
    
    func panGestureAction(recognizer:UIPanGestureRecognizer){
        var view = self.navigationController.view
        if (recognizer.state == UIGestureRecognizerState.Began){
            var location = recognizer.locationInView(view)
            if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1){
                self.interactionController = UIPercentDrivenInteractiveTransition()
                self.navigationController.popViewControllerAnimated(true)
            }
        }else if (recognizer.state == UIGestureRecognizerState.Changed){
            var translation = recognizer.translationInView(view)
            var d = fabs(translation.x / CGRectGetWidth(view.bounds))
            self.interactionController?.updateInteractiveTransition(d)
        }else if (recognizer.state == UIGestureRecognizerState.Ended){
            if (recognizer.velocityInView(view).x > 0){
                self.interactionController?.finishInteractiveTransition()
            }else{
                self.interactionController?.cancelInteractiveTransition()
            }
            self.interactionController = nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //        if operation == UINavigationControllerOperation.Pop {
        //            return animator
        //        }
        return animator
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactionController
    }
}
