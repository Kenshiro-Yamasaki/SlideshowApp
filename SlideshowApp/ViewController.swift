//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山崎 絢史郎 on 2016/05/21.
//  Copyright © 2016年 kenshiro.yamasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startstop: UIButton!
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var iv: UIImageView!
    
    // 絵を3枚を変数で宣言
    static var img1:UIImage = UIImage(named:"udon1.png")!
    static var img2:UIImage = UIImage(named:"udon2.png")!
    static var img3:UIImage = UIImage(named:"udon3.png")!
    
    @IBAction func tapIv(sender: AnyObject) {
    
        // ZoomViewControllerへ遷移するためにSegueを呼び出す
        performSegueWithIdentifier("toViewController2",sender: nil)
        
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

        // segueから遷移先のZoomViewControllerを取得する
        let zoomViewController = segue.destinationViewController as! ZoomViewController
        
        // 遷移先のZoomViewControllerで宣言しているzoomimgに現在表示されている画像を代入して渡す
        zoomViewController.zoomimg = iv.image!

    }
    
    var timer: NSTimer?

    func startTimer() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func update(timer: NSTimer) {
            
        if iv.image == ViewController.img1 {
            iv.image = ViewController.img2
        } else if iv.image == ViewController.img2 {
            iv.image = ViewController.img3
        } else if iv.image == ViewController.img3 {
            iv.image = ViewController.img1
        } else {
            iv.image = ViewController.img2
        }
    }
    
    @IBAction func startstop(sender: AnyObject) {
        if timer != nil{
        
            // アニメが動いていたら止める
            startstop.setTitle("再生", forState: .Normal)
            go.enabled = true
            back.enabled = true
            stopTimer()
            
        } else {
            
            // アニメが止まっていたら動かす
            startstop.setTitle("停止", forState: .Normal)
            go.enabled = false
            back.enabled = false
            startTimer()
        }
    }

    @IBAction func go(sender: AnyObject) {
        
        if iv.image == ViewController.img1 {
            iv.image = ViewController.img2
        } else if iv.image == ViewController.img2 {
            iv.image = ViewController.img3
        } else if iv.image == ViewController.img3 {
            iv.image = ViewController.img1
        } else {
            iv.image = ViewController.img2
        }
    }
    
    
    @IBAction func back(sender: AnyObject) {
        
        if iv.image == ViewController.img1 {
            iv.image = ViewController.img3
        } else if iv.image == ViewController.img2 {
            iv.image = ViewController.img1
        } else if iv.image == ViewController.img3 {
            iv.image = ViewController.img2
        } else {
            iv.image = ViewController.img3
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.iv.userInteractionEnabled = true
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender; AnyObject?){
        
        // segueから遷移先のZoomViewControllerを取得する
        let zoomViewController = segue.destinationViewController as! ZoomViewController
        
        // 遷移先のZoomViewControllerで宣言しているzoomimgに現在表示されている画像を代入して渡す
        zoomViewController.zoomimg = iv.image!
    } */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}