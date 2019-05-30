//
//  ViewController.swift
//  hwsproject1
//
//  Created by Enrique Florencio on 5/28/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Storm Viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Get to the imageViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "image") as? imageViewController {
            vc.image = pictures[indexPath.row]
            vc.positionIndex = indexPath.row + 1
            vc.numOfElements = pictures.count
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    

}

