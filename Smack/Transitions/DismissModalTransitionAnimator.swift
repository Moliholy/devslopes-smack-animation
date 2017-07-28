//
//  DismissModalTransitionAnimator.swift
//  Smack
//
//  Created by Jose Molina Colmenero on 28/07/2017.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

class DismissModalTransitionAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)!
        transitionContext.containerView.addSubview(fromViewController.view)
        let firstView = fromViewController.view.subviews[0]
        let secondView = fromViewController.view.subviews[1]
        let finalFrame = CGRect(x: secondView.frame.origin.x,
                                y: fromViewController.view.frame.size.height,
                                width: secondView.frame.size.width,
                                height: secondView.frame.size.height)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: {
                        firstView.backgroundColor = UIColor.clear
                        secondView.frame = finalFrame
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }

    
}
