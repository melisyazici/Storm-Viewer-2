//
//  DetailViewController.swift
//  Storm Viewer 2
//
//  Created by Melis Yazıcı on 03.11.22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImageNumber = 0
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "This image is \(selectedImageNumber + 1) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No images found")
            return
        }
        
        let imageName = "\(selectedImage ?? "")"
        
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        present(vc, animated: true)
    }
    


}
