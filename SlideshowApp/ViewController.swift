//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Hiroki Watanabe on 2017/01/02.
//  Copyright © 2017年 Hiroki Watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //ストップが効かない

    var  count = 0
    var arrray = [UIImage]()
    var timer  = Timer()
    
    @IBOutlet weak var startUI: UIButton!
    
    @IBOutlet weak var stopUI: UIButton!
    
    @IBOutlet weak var nextUI: UIButton!
    
    @IBOutlet weak var backUI: UIButton!
    
    
    @IBOutlet weak var UIimage: UIImageView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image1 = UIImage (named: "shinozaki1.jpg")
        let image2 = UIImage (named: "shinozaki2.jpg")
        let image3 = UIImage (named: "shinozaki3.jpg")

        arrray = [image1!,image2!,image3!]
    
        //ストップボタンを無効化して隠す
        stopUI.isHidden = true
        stopUI.isEnabled = false

        
    }

    
    //進むボタン
    @IBAction func next(_ sender: Any) {
        
        nextcount()
        
        UIimage.image = arrray[count]
        
    }
    
    
    //戻るボタン
    @IBAction func back(_ sender: Any) {
        
        backcount()
        
         UIimage.image = arrray[count]
        
    }
    
    
    
    //スタートボタン
    @IBAction func start(_ sender: Any) {
    
     if timer.isValid == false {    timer = Timer.scheduledTimer(timeInterval: 2, target:self, selector:#selector(timercount), userInfo: nil, repeats: true)
        
    }
    }
    
    
    //ストップボタン
    @IBAction func stop(_ sender: Any) {
        
        timer.invalidate()
        
        //戻るボタンと進むボタンを無効化解除
        nextUI.isEnabled = true
        backUI.isEnabled = true
        
        //スタートボタンを無効化解除し、表示
        startUI.isEnabled = true
        startUI.isHidden = false

        //ストップボタンを隠して、無効化
        stopUI.isEnabled = false
        stopUI.isHidden = true

        
    }
    
    
    
    
    
    //タイマーがスタートして、2秒ごとに呼ばれる関数
    
    func timercount(){
       
        UIimage.image = arrray[count]
        
        nextcount()
        
        //戻るボタンと進むボタンを無効化
        nextUI.isEnabled = false
        backUI.isEnabled = false
        
        //スタートボタンを無効化、非表示
        startUI.isEnabled = false
        startUI.isHidden = true

        //ストップボタンを無効化解除、表示
        stopUI.isEnabled = true
        stopUI.isHidden = false

        
    }
    
    
    
    // ２より大きい時はゼロに戻す
    func nextcount() {
        
        if count > 1 {
            count = 0
            
        } else

        {
            count = count + 1
        }
    }
    
    
    
    //　０より小さい時は２プラスする
    func backcount() {
        
        if count <= 0 {count = 2
            
        } else
            
        {
            count = count - 1
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        // segueから遷移先のNextViewControllerを取得する
        let NextViewController:NextViewController = segue.destination as! NextViewController
        
        // 遷移先のNextViewControllerで宣言しているnextcoungに値を代入して渡す
        NextViewController.nextcount = count
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
}
