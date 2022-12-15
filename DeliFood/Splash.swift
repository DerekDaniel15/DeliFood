//
//  Splash.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 12/12/22.
//

import UIKit

class Splash: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.viewHome()
        }
        // Do any additional setup after loading the view.
    }
    
    func viewHome() {
        let HomeView = HomeConfigurate.makeHome()
        HomeView.modalPresentationStyle = .fullScreen
        present(HomeView, animated: true)
    }

}
