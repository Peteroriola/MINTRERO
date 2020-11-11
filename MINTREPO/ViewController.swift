//
//  ViewController.swift
//  MINTREPO
//
//  Created by UNION on 11/11/2020.
//  Copyright © 2020 Peter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var scrollView: UIScrollView = {
                  let view = UIScrollView()
                  
                  view.translatesAutoresizingMaskIntoConstraints = false
                  view.contentSize.height = 800
                  view.backgroundColor = .red
                  return view
              }()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationItem.titleView = navbarTitle(title: "Rails Repository Commits")
        colorNavigationBar(navigationController: self.navigationController)
        view.backgroundColor = .white
        
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
                
      // [leftSideBarLabel, middleLeftSideBarLabel].forEach{ scrollView.addSubview($0) }
    }


}

