//
//  OpenViewController.swift
//  HomeWork 2.2
//
//  Created by Дмитрий Бессонов on 25.12.2021.
//

import UIKit

protocol ViewControllerDelegate {
    func setColor (_ color : UIColor)
}

class OpenViewController: UIViewController {
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ViewController
        viewController.delegate = self
        viewController.viewColor = view.backgroundColor
    
    }
}
        
extension OpenViewController: ViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
