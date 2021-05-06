//
//  ViewController.swift
//  Movie_List_Humayun
//
//  Created by Humayun Kabir on 6/5/21.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    var movie_data: Model? = nil
    
    var titleArray = [String]()
    
    var descriptionArray = [String]()
    
    var imageArray = [String]()
    
    var custom_view = MovieListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parsedData() { (success) in
            if success == 200{
               print("data parsed successfully")
                print(self.titleArray)
                print(self.descriptionArray)
                self.custom_view.data_collection_view.reloadData()
            }
        }
        
        view.addSubview(custom_view)
        custom_view.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        custom_view.data_collection_view.delegate = self
        custom_view.data_collection_view.dataSource = self
        
        custom_view.data_collection_view.register(dataCollectionViewCell.self, forCellWithReuseIdentifier: movie_cell_identifier)
        

        
    }
    
    func parsedData(success: @escaping(_ status: Int)-> Void){
        
        let url = "https://api.themoviedb.org/3/search/movie"
        
        let params =  ["api_key" : "38e61227f85671163c275f9bd95a8803",
                       "query" : "marvel"]
        
        AF.request(url , method: .get, parameters: params).responseJSON { [self] response in
            switch response.result{
            case.success(_):
                do {
                    let JSON = response.data
                    let movieInfo = try JSONDecoder().decode(Model.self, from: JSON!)
                    self.movie_data = movieInfo
                    print(movieInfo.results.count)
                    for i in 0..<movieInfo.results.count{
                        titleArray.append(movieInfo.results[i].title)
                        descriptionArray.append(movieInfo.results[i].overview)
                        imageArray.append(movieInfo.results[i].posterPath ?? "default")
                    }
                    
                    
                    success(200)
                } catch {
                    print("The file could not be loaded")
                    let alert = UIAlertController(title: "Alert", message: "Something Went Wrong", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            case.failure(let error):
                print("error: \(error)")
                success(404)
            }
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count

    }

    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movie_cell_identifier, for: indexPath) as! dataCollectionViewCell
        if imageArray[indexPath.row] == "default"{
            cell.backGround_imageView.image = UIImage(named: "default")
        }else{
            cell.backGround_imageView.kf.setImage(with: URL(string: poste_base_url + imageArray[indexPath.row]))
        }

        
        cell.movie_name.text = titleArray[indexPath.row]
        cell.overall_view.text = descriptionArray[indexPath.row]
        return cell

    }

    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(indexPath.row)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: 350)
    }

}

