//
//  dataCollectionViewCell.swift
//  Movie_List_Humayun
//
//  Created by Humayun Kabir on 6/5/21.
//

import UIKit

class dataCollectionViewCell: UICollectionViewCell {
   
    //MARK: - Initializers
    
    let backGround_imageView : UIImageView = {

          let imageView = UIImageView()

          imageView.image = UIImage(named: "holder")

          imageView.contentMode = .scaleAspectFit

          imageView.layer.masksToBounds = true

          return imageView


      }()
    
    let movie_name : UILabel = {
        let label = UILabel()
        label.text = "Movie List"
        label.font = UIFont(name: "Kefa", size: 15)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    let overall_view : UILabel = {
        let label = UILabel()
        label.text = "Movie List"
        label.font = UIFont(name: "Kefa", size: 10)
        label.textAlignment = .left
        label.numberOfLines = 6
        return label
    }()
    

     override init(frame: CGRect) {

         super.init(frame: frame)

         setUpSubviews()

     }

     

     required init?(coder: NSCoder) {

         fatalError("init(coder:) has not been implemented")

     }

     

     //MARK: - Functions

     fileprivate func setUpSubviews(){
        addSubview(backGround_imageView)
        backGround_imageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 100, height: 300)
        
        addSubview(movie_name)
        movie_name.anchor(top: backGround_imageView.topAnchor, left: backGround_imageView.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addSubview(overall_view)
        overall_view.anchor(top: movie_name.bottomAnchor, left: backGround_imageView.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)

 }




    
}
