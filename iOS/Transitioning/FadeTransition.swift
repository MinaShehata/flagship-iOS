//
//  FadeTransition.swift
//  Medica-Egypt-iOS
//
//  Created by Mina Shehata on 2/9/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

final class FadeTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    let duration = 0.57
    
    // This is used for percent driven interactive transitions, as well as for
    // container controllers that have companion animations that might need to
    // synchronize with the main animation.
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        
        
        return duration
    }
    
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)
        
        fromView.addSubview(toView!)
        toView?.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            toView?.alpha = 1.0
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
    
}

