//
//  HomeViewController.swift
//  PerfectNews
//
//  Created by Alumno-DG on 21/09/17.
//  Copyright © 2017 Alumno-DG. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKCoreKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblNomUser: UILabel!
    @IBOutlet weak var articuloTableView: UITableView!
    
    var articles: [ArticuloBE] = []
    
    @IBAction func btnLogout(_ sender: Any) {
    
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            FBSDKAccessToken.setCurrent(nil)
            
            let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "Main")
            self.present(viewController, animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = Auth.auth().currentUser
        if let user = user {

            /*let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL*/
            
            let nom = user.displayName
            
            let firstWord:String = nom!.components(separatedBy: " ").first!
            self.lblNomUser.text = "Hi, \(firstWord)"
            
            self.articuloTableView.estimatedRowHeight = 200
            self.articuloTableView.rowHeight = UITableViewAutomaticDimension
            
            fetchArticles()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "articuloTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ArticuloTableViewCell
        
            cell.objArt = articles[indexPath.row]
            cell.actualizarData()

        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
    
    
  
    
    
    
    
    
    func fetchArticles(){
        
    
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=493594c4b4ac4280bcea75382090410c")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [ArticuloBE]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let article = ArticuloBE()
                        if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
                            
                        

                        }
                        self.articles.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.articuloTableView.reloadData()
                }
                
            } catch let error {
                print(error)
            }
            
            
        }
        
        task.resume()
        
    }

}
