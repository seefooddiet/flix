//
//  SuperheroViewController.swift
//  flix
//
//  Created by deon labrador on 2/27/20.
//  Copyright © 2020 deon labrador. All rights reserved.
//

import UIKit
import AFNetworking

class SuperheroViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

  
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
          let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
          let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
          
          let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                print(error.localizedDescription)
             } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
              print("respose: \(dataDictionary)")
           
              self.movies = dataDictionary["results"] as! [[String: Any]]
                
                self.collectionView.reloadData()
                
               print("movie")
              
             }
          }
          task.resume()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "superheroGridCell", for: indexPath) as! superheroGridCell
        
    let movie = movies[indexPath.item]
        

        let posterPath = movie["poster_path"] as? String
        let posterBaseUrl = "http://image.tmdb.org/t/p/w185"
        let posterUrl = URL(string: posterBaseUrl + posterPath!)
        cell.posterView.setImageWith(posterUrl!)
      

              
        return cell
    }

}
