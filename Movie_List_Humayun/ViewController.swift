//
//  ViewController.swift
//  Movie_List_Humayun
//
//  Created by Humayun Kabir on 6/5/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var movie_data: Model? = nil
    
    var titleArray = [String]()
    
    var descriptionArray = [String]()
    
    var imageArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parsedData() { (success) in
            if success == 200{
               print("data parsed successfully")
                print(self.titleArray)
                print(self.descriptionArray)
            }
        }
        
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

