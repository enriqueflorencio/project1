//
//  imageViewController.swift
//  hwsproject1
//
//  Created by Enrique Florencio on 5/28/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var image: String?
    var positionIndex: Int = 0
    var numOfElements: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "Picture \(positionIndex) of \(numOfElements)"
        
        //Load the image by unwrapping it
        if let imageToLoad = image {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    

}
