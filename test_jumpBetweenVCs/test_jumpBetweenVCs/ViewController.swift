//
//  ViewController.swift
//  test_jumpBetweenVCs
//
//  Created by Eric on 2017/2/14.
//  Copyright © 2017年 Eric. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let idf:String = "main";
        let sb:UIStoryboard = UIStoryboard(name: idf, bundle: Bundle.main);
        var vc:UIViewController! = sb.instantiateViewController(withIdentifier: idf);
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

