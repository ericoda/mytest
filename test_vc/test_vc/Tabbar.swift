//
//  Tabbar.swift
//  test_vc
//
//  Created by Eric on 2017/2/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

import UIKit

class Tabbar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbarInfo = ["VC1":"vc1,\"\"","VC2":"vc2,\"\"","VC3":"vc3,\"\"",];
        for vcName in tabbarInfo.keys {
            let info = tabbarInfo[vcName];
            let title:String? = info?.components(separatedBy: ",").first;
            let imageName:String? = info?.components(separatedBy: ",").last;
            let vcClazz = self.classFromString(className: vcName) as! UIViewController.Type;
            let vc = vcClazz.init();
            self.addChildViewController(vc, title: title!, imageName: imageName!);
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //turn string into anyclass
    func classFromString(className:String!) -> AnyClass {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let clazz = NSClassFromString(namespace+"."+className)! as! UIViewController.Type;
        return clazz;
    }

    //put childvc into tabbar
    private func addChildViewController(_ childController: UIViewController, title:String, imageName:String){
        childController.title = title;
        childController.tabBarItem.image = UIImage(named:title);
        let nv = Nav(rootViewController: childController);
        self.addChildViewController(nv);
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
