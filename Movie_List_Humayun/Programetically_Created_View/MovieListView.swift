//
//  MovieListView.swift
//  Movie_List_Humayun
//
//  Created by Humayun Kabir on 6/5/21.
//

import UIKit

class MovieListView: UIView {
    
    //MARK: - Properties
    let title : UILabel = {
        let label = UILabel()
        label.text = "Movie List"
        label.font = UIFont(name: "Kefa", size: 17)
        label.textAlignment = .left
        return label
    }()

    

    let pdf_collection_view : UICollectionView = {

        let layout = UICollectionViewFlowLayout()

        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        layout.itemSize = CGSize(width: view_width-Utility.convertWidthMultiplier(constant: 50.1), height: Utility.convertHeightMultiplier(constant: 77))

        layout.minimumLineSpacing = Utility.convertHeightMultiplier(constant: 12)

        layout.scrollDirection = .vertical

        

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.showsHorizontalScrollIndicator = false

        collectionView.showsVerticalScrollIndicator = false

        collectionView.isScrollEnabled = true

        collectionView.backgroundColor = UIColor.white

        return collectionView

    }()

    

    //MARK: - Initializers

    

    override init(frame: CGRect) {

        super.init(frame: frame)

        setupSubviews()

    }

    

    required init?(coder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }

    

    //MARK: - Functions

    fileprivate func setupSubviews(){

        self.backgroundColor = .white
        
        addSubview(title)
        title.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 200, height: 35)

        addSubview(pdf_collection_view)

        pdf_collection_view.anchor(top: title.bottomAnchor,

                                   left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor,

                                  paddingTop: Utility.convertHeightMultiplier(constant: 0),

                                  paddingLeft: 20, paddingBottom: Utility.convertHeightMultiplier(constant: 0), paddingRight: 20,

                                  width: 0,

                                  height: 0)

        pdf_collection_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

    }

    

    //MARK: - Button Actions

    

}
