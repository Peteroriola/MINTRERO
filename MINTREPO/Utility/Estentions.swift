//
//  Estentions.swift
//  MINTREPO
//
//  Created by UNION on 11/11/2020.
//  Copyright © 2020 Peter. All rights reserved.
//

import UIKit



    extension UIView {
        
        func anchorSize(to view: UIView) {
            widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        }
        
        func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop : CGFloat, paddingLeft : CGFloat, paddingBottom : CGFloat, paddingRight: CGFloat, height : CGFloat, width : CGFloat) {
            
            //self.translatesAutoresizingMaskIntoConstraints = false
            //self is optional
            translatesAutoresizingMaskIntoConstraints = false
            
            if let top = top {
                topAnchor.constraint(equalTo: top, constant : paddingTop).isActive = true
            }
            
            if let left = left {
                leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
            }
            
            if let bottom = bottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
            
            if let right = right {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
            
            
            if height != 0 {
                heightAnchor.constraint(equalToConstant: height).isActive = true
            }
            
            if width != 0 {
                widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            
            
        }
        
        
    }

extension UINavigationController {
    
    static func pushToNewNavigation(controller: UIViewController, navController: UINavigationController) {
        navController.pushViewController(controller, animated: true)
    }
    
    
    static func pushToNewNavigationWithCallBack(controller: UIViewController, navController: UINavigationController, completion: @escaping () -> () ) {
        completion()
        navController.pushViewController(controller, animated: true)
    }
    
    static func presentNewNavigationController(controller: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: controller)
        return navController
    }
    
    static func presentNewNavigationControllerWithCallBack(controller: UIViewController, completion: @escaping () -> ()) -> UINavigationController {
        let navController = UINavigationController(rootViewController: controller)
        completion()
        return navController
    }
    
}

extension UINavigationBar {
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = false
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
