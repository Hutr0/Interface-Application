//
//  OpenController.swift
//  Interface Application
//
//  Created by Леонид Лукашевич on 21.09.2020.
//  Copyright © 2020 Hutr0. All rights reserved.
//

import UIKit

class OpenController: UIViewController {

    var image: UIImage?
    @IBOutlet weak var dogImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dogImage.image = image
    }
    
    @IBAction func TapToShare(_ sender: UIButton) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
//        shareController.completionWithItemsHandler = { _, bool, _, _ in
//            if bool {
//                print("Успешно")
//            }
//        }
        
        present(shareController, animated: true, completion: nil)
    }
}
