//
//  ViewController.swift
//  Training
//
//  Created by Никита Завадский on 21.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/macbook-pro-13-og-202011?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1604347427000"
        
        guard let url = URL(string: string) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("Done!")
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
        
        task.resume()
    }


}

