//
//  DisplayModalTransitionAnimator.m
//  cabcenter
//
//  Created by Jose Molina Colmenero on 12/06/2017.
//  Copyright © 2017 Frank Lindner. All rights reserved.
//

#import "DisplayModalTransitionAnimator.h"


@implementation DisplayModalTransitionAnimator

- (NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return DEFAULT_ANIMATION_DURATION;
}

- (void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toViewController.view.frame = fromViewController.view.frame;
    UIColor *originalColor = toViewController.view.backgroundColor;
    toViewController.view.backgroundColor = [UIColor clearColor];
    
    [transitionContext.containerView addSubview:toViewController.view];
    UIView *firstView = toViewController.view.subviews[0];
    CGRect originalFrame = firstView.frame;
    
    firstView.frame = CGRectMake(firstView.frame.origin.x, fromViewController.view.frame.size.height, firstView.frame.size.width, firstView.frame.size.height);
    
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         firstView.frame = originalFrame;
                         toViewController.view.backgroundColor = originalColor;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
