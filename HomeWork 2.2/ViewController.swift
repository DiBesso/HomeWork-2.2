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
    @IBOutlet weak var textFieldOfRed: UITextField!
    @IBOutlet weak var textFieldOfGreen: UITextField!
    @IBOutlet weak var textFieldOfBlue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOfRGB.layer.cornerRadius = 20
        
        
        
    }

    @IBAction func doneAction() {
        dismiss(animated: true)
    }
    @IBAction func sliderAction() {
        
        sliderOne.value = round(sliderOne.value * 100) / 100
        sliderTwo.value = round(sliderTwo.value * 100) / 100
        sliderThree.value = round(sliderThree.value * 100) / 100
        
        labelOfRed.text = String(sliderOne.value)
        labelOfGreen.text = String(sliderTwo.value)
        labelOfBlue.text = String(sliderThree.value)
        
        textFieldOfRed.text = labelOfRed.text
        textFieldOfGreen.text = labelOfGreen.text
        textFieldOfBlue.text = labelOfBlue.text
        
        let sliderOneValue = CGFloat(sliderOne.value)
        let sliderTwoValue = CGFloat(sliderTwo.value)
        let sliderThreeValue = CGFloat(sliderThree.value)
        
        
        viewOfRGB.backgroundColor = UIColor (
            red: sliderOneValue,
            green: sliderTwoValue,
            blue: sliderThreeValue,
            alpha: 1
        )
       
        
    }
 
}
