//
//  MVDDetailViewController.swift
//  Dogs-CwSwift
//
//  Created by Michael Di Cesare on 10/9/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit

class MVDDetailViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogNameLabel: UILabel!
    // landing pad
    @objc var dogImageUrl: NSURL?{
        didSet{
            loadViewIfNeeded()
            MVDNetworkController.fetchImageData(dogImageUrl! as URL, completion: { (data, error) in
                guard let data = data else {return}
                DispatchQueue.main.async {
                    self.dogImageView.image = UIImage(data: data)
                    }
                })
            }
        }
         //breed landing pad
     @objc var breed: MVDBreed?{
         didSet{
             loadViewIfNeeded()
             dogNameLabel.text = breed?.name.capitalized
         }
     }
     //subBreed landing pad
     @objc var subBreed: MVDSubBreed?{
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
