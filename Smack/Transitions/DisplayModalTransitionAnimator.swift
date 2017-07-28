//
//  DisplayModalTransitionAnimator.swift
//  Smack
//
//  Created by Jose Molina Colmenero on 28/07/2017.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import Foundation

class DisplayModalTransitionAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        let firstView = toViewController.view.subviews[0]
        let secondView = toViewController.view.subviews[1]
        let originalColor = firstView.backgroundColor
        let originalFrame = secondView.frame

        
        toViewController.view.frame = fromViewController.view.frame
        firstView.backgroundColor = UIColor.clear
        transitionContext.containerView.addSubview(toViewController.view)
        secondView.frame = CGRect(x: firstView.frame.origin.x,
                                 y: fromViewController.view.frame.size.height,
                                 width: firstView.frame.size.width,
                                 height: firstView.frame.size.height)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                        firstView.backgroundColor = originalColor
                        secondView.frame = originalFrame
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }
    
}
