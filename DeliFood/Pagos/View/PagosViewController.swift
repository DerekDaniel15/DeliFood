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
    @IBOutlet weak var Codigo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Codigo.text = String(presenter?.getCodigo() ?? 0)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pagarDelete(_ sender: Any) {
        presenter?.deleteCodigo()
        dismiss(animated: true)
    }
    
    
    @IBAction func Cancelar(_ sender: Any) {
        presenter?.deleteCodigo()
        dismiss(animated: true)
    }
    
}

extension PagosViewController: PagosViewControllerProtocol {
    
}
