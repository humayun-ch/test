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

          imageView.image = UIImage(named: "default")

          imageView.contentMode = .scaleAspectFill

          imageView.layer.masksToBounds = true

          return imageView


      }()
    
    let movie_name : UILabel = {
        let label = UILabel()
        label.text = "Movie List"
        label.font = UIFont(name: "Kefa", size: 17)
        label.textAlignment = .left
        return label
    }()
    
    let overall_view : UILabel = {
        let label = UILabel()
        label.text = "Movie List"
        label.font = UIFont(name: "Kefa", size: 17)
        label.textAlignment = .left
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
        backGround_imageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 50, height: 200)
        
        addSubview(movie_name)
        movie_name.anchor(top: backGround_imageView.topAnchor, left: backGround_imageView.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addSubview(overall_view)
        overall_view.anchor(top: movie_name.bottomAnchor, left: movie_name.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)

 }




    
}
