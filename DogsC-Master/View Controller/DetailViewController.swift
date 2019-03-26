//
//  DetailViewController.swift
//  DogsC-Master
//
//  Created by Cody on 3/25/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //IBOutlets
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogNameLabel: UILabel!
    
    //ImageURL landing pad
    @objc var dogImageURL: NSURL?{
        didSet{
            loadViewIfNeeded()
            CRABreedNetworkClient.sharedController()?.fetchImageData(dogImageURL! as URL, completion: { (data, error) in
                guard let data = data else {return}
                DispatchQueue.main.async {
                    self.dogImageView.image = UIImage(data: data)
                }
            })
        }
    }
    
    //breed landing pad
    @objc var breed: CRABreed?{
        didSet{
            loadViewIfNeeded()
            dogNameLabel.text = breed?.name.capitalized
        }
    }
    //subBreed landing pad
    @objc var subBreed: CRASubBreed?{
        didSet{
            loadViewIfNeeded()
            guard let subBreedName = subBreed?.name,
                let breedName = breed?.name else {return}
            dogNameLabel.text = "\(subBreedName) \(breedName)".capitalized
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
