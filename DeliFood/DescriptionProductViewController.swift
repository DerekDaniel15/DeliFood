//
//  DescriptionProductViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 29/11/22.
//

import UIKit

class DescriptionProductViewController: UIViewController {
    var name:String!

    @IBOutlet weak var productName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        productName.text = name
        // Do any additional setup after loading the view.
    }

}
