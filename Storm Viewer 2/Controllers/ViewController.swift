//
//  ViewController.swift
//  Storm Viewer 2
//
//  Created by Melis Yazıcı on 02.11.22.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // change large title text attributes title color to white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        
        loadPictures()
        
        
    }
    
    
    func loadPictures() {
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        var items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        
        
        
    }
    
    
    
    
    // --- Collection View --- //
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Image", for: indexPath) as? ImageCell else {
            fatalError("Unable to dequeue ImageCell")
        }
        
        cell.imageView.image = UIImage(named: pictures[indexPath.item]) // to show the images in cells
        cell.imageLabel.text = "Picture \(indexPath.item + 1)"
        
        
        
        
        return cell
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.totalPictures = pictures.count
            vc.selectedImageNumber = indexPath.item
            vc.selectedImage = pictures[vc.selectedImageNumber]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

