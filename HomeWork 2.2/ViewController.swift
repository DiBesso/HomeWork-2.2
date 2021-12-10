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

    @IBAction func sliderOneAction() {
        sliderOne.value = round(sliderOne.value * 100) / 100
        labelOfRed.text = String(sliderOne.value)
       
        
    }
    
    @IBAction func sliderTwoAction() {
        sliderTwo.value = round(sliderTwo.value * 100) / 100
        labelOfGreen.text = String(sliderTwo.value)
    }
    
    @IBAction func sliderThreeAction() {
        sliderThree.value = round(sliderThree.value * 100) / 100
        labelOfBlue.text = String(sliderThree.value)
    }
}

