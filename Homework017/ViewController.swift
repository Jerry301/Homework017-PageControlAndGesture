//
//  ViewController.swift
//  Homework017
//
//  Created by Chun-Yi Lin on 2021/12/10.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var photoControlView: UIScrollView!
    @IBOutlet weak var imageView01: UIImageView!
    @IBOutlet weak var photoPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for photoImage in scrollView.subviews {
            if photoImage.isKind(of: UIView.self){
                return photoImage
            }
        }
        return nil
    }
    
    @IBAction func photoPageChange(_ sender: UIPageControl) {
        let point = CGPoint(x: photoControlView.bounds.width*CGFloat(sender.currentPage), y: 0)
        photoControlView.setContentOffset(point, animated: true)
    }
}
extension ViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        photoPageControl.currentPage = Int(page)
    }
}

