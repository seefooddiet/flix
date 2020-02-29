//
//  DetailViewController.swift
//  flix
//
//  Created by deon labrador on 2/27/20.
//  Copyright © 2020 deon labrador. All rights reserved.
//

import UIKit
import AFNetworking

class DetailViewController: UIViewController {

    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var backdropPath: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()        // Initialization code
       
        if let title = movie["title"] as? String{
        titleLabel.text = title
            titleLabel.sizeToFit()
        }
        else{
            titleLabel.text = nil
        }
      
        if let overview = movie["overview"] as? String{
        overviewLabel.text = overview
            overviewLabel.sizeToFit()
        }
        else{
            overviewLabel.text = nil
        }
        
        if let posterPath = movie["poster_path"] as? String{
        let posterBaseUrl = "http://image.tmdb.org/t/p/w500"
        let posterUrl = URL(string: posterBaseUrl + posterPath)
            posterImageView.setImageWith(posterUrl!)}
        else{
            posterImageView.image = nil
        }
        
        
         if let backPath = movie["backdrop_path"] as? String{
               let backBaseUrl = "http://image.tmdb.org/t/p/w500"
               let backUrl = URL(string: backBaseUrl + backPath)
                   backdropPath.setImageWith(backUrl!)}
               else{
                   backdropPath.image = nil
               }
    }

   

}
