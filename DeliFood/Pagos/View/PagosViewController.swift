//
//  PagosViewController.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 16/12/22.
//

import UIKit

protocol PagosViewControllerProtocol {
    
}

class PagosViewController: UIViewController {
    
    var presenter: PagosPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension PagosViewController: PagosViewControllerProtocol {
    
}
