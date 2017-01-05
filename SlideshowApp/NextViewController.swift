//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Hiroki Watanabe on 2017/01/02.
//  Copyright © 2017年 Hiroki Watanabe. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imagebig: UIImageView!
    
    var nextcount = 0
    var arrray = [UIImage]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image1 = UIImage (named: "shinozaki1.jpg")
        let image2 = UIImage (named: "shinozaki2.jpg")
        let image3 = UIImage (named: "shinozaki3.jpg")
        
        arrray = [image1!,image2!,image3!]
        

           }
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        imagebig.image = arrray[nextcount]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

   
}
