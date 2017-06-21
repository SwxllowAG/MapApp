//
//  detailViewController.swift
//  MapApp
//
//  Created by Galym Anuarbek on 6/20/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit

var someIndex: Place = list[0]

class detailViewController: UIViewController{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameLabel.text = someIndex.title
        categoryLabel.text = someIndex.subtitle
        latLabel.text = "\(someIndex.lat)"
        lonLabel.text = "\(someIndex.lon)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
