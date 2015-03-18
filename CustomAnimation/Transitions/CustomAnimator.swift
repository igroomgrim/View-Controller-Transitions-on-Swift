//
//  CustomAnimator.swift
//  CustomAnimation
//
//  Created by Anak Mirasing on 3/18/2558 BE.
//  Copyright (c) 2558 iGROOMGRiM. All rights reserved.
//

import UIKit

class CustomAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var fromViewVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as UIViewController!
        var toViewVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as UIViewController!
        
        containerView.addSubview(toViewVC!.view)
        toViewVC?.view.alpha = 0
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            //            fromViewVC?.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
            fromViewVC?.view.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 1.5)
            toViewVC?.view.alpha = 1
            
            }, completion: { finished in
                fromViewVC?.view.transform = CGAffineTransformIdentity
                
                var transitionCancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!transitionCancelled)
        })
    }
}
