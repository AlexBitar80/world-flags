//
//  DetailViewController.swift
//  ViewFlags
//
//  Created by João Alexandre on 25/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        
        if let imageToload = selectedImage {
            imageView.image = UIImage(named: imageToload)
            
            title = "\(imageToload.uppercased())"
        }
        
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    

    @objc func shareFlag() {
        guard let flaImage = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("Image no found!")
            return
        }
        
        let activityController = UIActivityViewController(activityItems: [flaImage, selectedImage!.uppercased()], applicationActivities: [])
        activityController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityController, animated: true)
    }
}
