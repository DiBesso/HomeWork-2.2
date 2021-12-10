//
//  ViewController.swift
//  HomeWork 2.2
//
//  Created by Дмитрий Бессонов on 11.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewOfRGB: UIView!
    @IBOutlet weak var sliderOne: UISlider!
    @IBOutlet weak var sliderTwo: UISlider!
    @IBOutlet weak var sliderThree: UISlider!
    @IBOutlet weak var labelOfRed: UILabel!
    @IBOutlet weak var labelOfGreen: UILabel!
    @IBOutlet weak var labelOfBlue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOfRGB.layer.cornerRadius = 20
        
    }

    
    
}

