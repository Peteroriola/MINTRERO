//
//  TableViewCell.swift
//  MINTREPO
//
//  Created by UNION on 11/11/2020.
//  Copyright © 2020 Peter. All rights reserved.
//

import UIKit

class MintRepoTableViewCell: UITableViewCell {

                var blueUIView : UIView = {
                     let uv = UIView()
               uv.backgroundColor = .clear
                 
                  
                     return uv
                 }()
              
              var backgroundUIView : UIView = {
                     let uv = UIView()
                     uv.backgroundColor = UIColor.clear
                 
                  
                     return uv
                 }()
              
              var authorImage : UIImageView = {
                  var imageView = UIImageView()
                  imageView.contentMode = .scaleAspectFit
                  return imageView
                  
              }()

              
              var nameLabel : UILabel = {
                  let label = UILabel()
                  //label.numberOfLines = 0
                label.adjustsFontSizeToFitWidth = true
                  label.textAlignment = .left
                  return label
              }()
              
            var emailLabel : UILabel = {
                let label = UILabel()
               // label.numberOfLines = 0
                label.adjustsFontSizeToFitWidth = true
                label.textAlignment = .left
                return label
            }()
              
              var dateLabel : UILabel = {
                  let label = UILabel()
                  //label.numberOfLines = 0
                  label.adjustsFontSizeToFitWidth = true
                  label.textAlignment = .right
                  return label
              }()
              
              override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                  super.init(style: style, reuseIdentifier: reuseIdentifier)
                  
                  [blueUIView, authorImage, nameLabel, dateLabel,emailLabel, backgroundUIView].forEach{ addSubview($0) }
                  setupAnchor()
            
                  backgroundUIView.addSubview(blueUIView)
                  backgroundUIView.layer.borderColor = UIColor.lightGray.cgColor
                  backgroundUIView.layer.borderWidth = 0.3
                  backgroundUIView.layer.cornerRadius = 5
                  backgroundUIView.clipsToBounds = true
                  backgroundUIView.layer.masksToBounds = true

              }
              
              fileprivate func setupAnchor() {
                  let width = frame.width
           
                  
                  blueUIView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 10)
                  
                  authorImage.anchor(top: safeAreaLayoutGuide.topAnchor, left: blueUIView.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, height: 40, width: 40)
              
                  nameLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: authorImage.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 20, width: 100)
            
                emailLabel.anchor(top: nameLabel.bottomAnchor, left: authorImage.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 20, width: 100)
                        
               
                  dateLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 100)
                  
                  
              backgroundUIView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
                  
              }
              

              
              required init?(coder: NSCoder) {
                  fatalError("init(coder:) has not been implemented")
              }
              
              
              
              
              
              
}
