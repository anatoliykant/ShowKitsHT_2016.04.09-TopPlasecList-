//
//  PhotoDetailedViewController.swift
//  ShowKits
//
//  Created by Nikolay Shubenkov on 08/02/16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class PhotoDetailedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var photoDetailes: UILabel!
    var photo:Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(photo != nil)
        
        setupViews()
    }
    
    func setupViews(){
        imageView.updateImageWith(photo)
        photoDetailes.text  = photo?.title
        scrollView.delegate = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let galleryVC = segue.destinationViewController as? GalleryViewController {
            galleryVC.userID = photo!.userID
        }
    }
    
    
}

extension PhotoDetailedViewController: UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
