//
//  ViewController.swift
//  test_collectionview_swift
//
//  Created by Eric on 16/11/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cllv:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.red
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(5, 10, 15, 20)
        layout.itemSize = CGSize(width: 50, height: 50)
        cllv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        cllv.dataSource = self;
        cllv.delegate = self;
        cllv.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ViewController")
        //        cllv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "ViewController")
        cllv.backgroundColor = UIColor.white
        self.view.addSubview(cllv)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewController", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width-40, height: 100)
        default:
            return CGSize(width: 100, height: 100)
        }
        
    }
}

