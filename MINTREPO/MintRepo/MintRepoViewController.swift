//
//  ViewController.swift
//  MINTREPO
//
//  Created by UNION on 11/11/2020.
//  Copyright © 2020 Peter. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MintRepoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var gitRepoUITableView = UITableView()
    let gitRepoUITableViewiIdentifier = "cell"
    
    lazy var scrollView: UIScrollView = {
                  let view = UIScrollView()
                  
                  view.translatesAutoresizingMaskIntoConstraints = false
                  view.contentSize.height = 800
                  view.backgroundColor = .white
                  return view
              }()
    
        var leftSideBarLabel : UILabel = {
        let label = UILabel()
        label.text = "List of Rails Repository Commits"
        label.backgroundColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationItem.titleView = navbarTitle(title: "Rails Repository Commits")
        colorNavigationBar(navigationController: self.navigationController)
        view.backgroundColor = .white
        
        gitRepoUITableView.delegate = self
        gitRepoUITableView.dataSource = self
        gitRepoUITableView.isScrollEnabled = true
        gitRepoUITableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
        
        gitRepoUITableView.register(MintRepoTableViewCell.self, forCellReuseIdentifier: gitRepoUITableViewiIdentifier )
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
                
      [leftSideBarLabel, gitRepoUITableView].forEach{ scrollView.addSubview($0) }
        setupLayout()
        
        getRailsRepositoryCommits()
    }

    
    func getRailsRepositoryCommits() {
        let urlString = GET_RAILS_OBJECT
        let url  = URL.init(string: urlString)
        Alamofire.request(url!, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            if response.result.isSuccess {

                let transfertData : JSON = JSON(response.result.value!)
               // self.transferToBankData(json : transfertData)
                print(transfertData, "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG")


                
            }else {
               
//            let alert = UIAlertController.alert(title: "Product Unavailable", message: "")
//                self.present(alert, animated: true)
//                return
            }
        }
        
    }
    
    
    
    
        let cellSpacingHeight: CGFloat = 10

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
        }


        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
        }

        func numberOfSections(in tableView: UITableView) -> Int {
        return 10
        }


        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: gitRepoUITableViewiIdentifier, for: indexPath) as? MintRepoTableViewCell else {fatalError("Unable to deque cell1")}
            
            return cell 

        }

        func setupLayout() {
                  let width = view.frame.width

        leftSideBarLabel.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, height: 30, width: width - 40)
          
          
        gitRepoUITableView.anchor(top: leftSideBarLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 45, width: width - 60)
          gitRepoUITableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            
            
    }

}

