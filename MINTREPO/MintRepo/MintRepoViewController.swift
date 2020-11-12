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
        var shaCommitObject = ""
    
        var commitModel = [CommitModel]()
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

    //MARK: ------ Get Rails Object from Github
    func getRailsRepositoryCommits() {
        let urlString = GET_RAILS_OBJECT
        let url  = URL.init(string: urlString)
        Alamofire.request(url!, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            if response.result.isSuccess {

                let gitHubData : JSON = JSON(response.result.value!)
               self.updateRailsRepositoryCommits(json : gitHubData)
                print(gitHubData, "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG")


                
            }else {
               
//            let alert = UIAlertController.alert(title: "Product Unavailable", message: "")
//                self.present(alert, animated: true)
//                return
            }
        }
        
    }
    
    func  updateRailsRepositoryCommits(json : JSON) {
    
    if let shaObject = json["object"]["sha"].string {
   
        shaCommitObject = shaObject
        print(shaObject, "------->--------------->" )
    }
        
        getRailsRepositoryCommitsObject()
    }
    
    
        //MARK: ------ Get Rails Commit  Object from Github
        func getRailsRepositoryCommitsObject() {
            let urlString = GET_COMMIT_OBJECT+shaCommitObject
            let url  = URL.init(string: urlString)
            Alamofire.request(url!, method: .get, encoding: JSONEncoding.default).responseJSON { response in
                if response.result.isSuccess {

                    let gitHubCommitData : JSON = JSON(response.result.value!)
                   self.UpdateRailsRepositoryCommitsObject(json : gitHubCommitData)
                    print(gitHubCommitData, "Commit--------------->---------->")


                    
                }else {
                    let alert = UIAlertController(title: "No Response", message: "Please check your network connection", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction!) in}))
                }
            }
            
        }
        
        func  UpdateRailsRepositoryCommitsObject(json : JSON) {
        
            let message = json["message"].stringValue
            
            //for (_, object) in json["author"] {
                
                let name = json["author"]["name"].stringValue
                let date = json["author"]["date"].stringValue
                let email = json["author"]["email"].stringValue
                //let message = object["message"].stringValue
                
                let data = CommitModel(date: date, name: name, email: email, message: message)
                commitModel.append(data)
                
                print(data, "data-----------------------------------?")
                
            //}
            gitRepoUITableView.reloadData()
            
        }
    
    //MARK: ------ TableView to list Rails Commits
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
            return commitModel.count
        }


        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: gitRepoUITableViewiIdentifier, for: indexPath) as? MintRepoTableViewCell else {fatalError("Unable to deque cell1")}
            
            cell.nameLabel.text = commitModel[indexPath.section].name
            cell.dateLabel.text = getHumanReadableDayFormat(nonReadableFormat: "\(commitModel[indexPath.section].name ?? "")")
            cell.emailLabel.text = commitModel[indexPath.section].email
            cell.authorImage.image = UIImage(named: "egghead")
            
            
            return cell 

        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
    }
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
         
     }
        func setupLayout() {
                  let width = view.frame.width

        leftSideBarLabel.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, height: 30, width: width - 40)
          
          
        gitRepoUITableView.anchor(top: leftSideBarLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 600, width: width - 60)
          gitRepoUITableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            
            
    }

}

