//
//  HelpFunctions.swift
//  MINTREPO
//
//  Created by UNION on 11/11/2020.
//  Copyright © 2020 Peter. All rights reserved.
//

import UIKit




    

    func colorNavigationBar(navigationController: UINavigationController?){
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.backgroundColor = UIColor.black
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
     

}

func navbarTitle(title: String) -> UILabel {
    let label = UILabel()
    label.text = title
    label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
    label.textColor = UIColor.white //appColor()
    label.sizeToFit()
    return label
}
