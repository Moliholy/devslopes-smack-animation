//
//  DismissModalTransitionAnimator.m
//  cabcenter
//
//  Created by Jose Molina Colmenero on 12/06/2017.
//  Copyright © 2017 Frank Lindner. All rights reserved.
//

#import "DismissModalTransitionAnimator.h"

@implementation DismissModalTransitionAnimator

- (NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return DEFAULT_ANIMATION_DURATION;
}

- (void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [transitionContext.containerView addSubview:fromViewController.view];
    UIView *firstView = fromViewController.view.subviews[0];
    CGRect finalFrame = CGRectMake(firstView.frame.origin.x, fromViewController.view.frame.size.height, firstView.frame.size.width, firstView.frame.size.height);
    
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         fromViewController.view.backgroundColor = [UIColor clearColor];
                         firstView.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
