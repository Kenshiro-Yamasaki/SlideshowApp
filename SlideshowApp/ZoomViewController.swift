//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 山崎 絢史郎 on 2016/05/21.
//  Copyright © 2016年 kenshiro.yamasaki. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomvc: UIImageView!
    
    var zoomimg:UIImage = UIImage(named:"udon1.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomvc.image = zoomimg

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
