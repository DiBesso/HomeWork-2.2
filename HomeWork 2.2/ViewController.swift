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
        setColor()
        setValueLabel()
        setValueTextField()
        
        textFieldOfRed.delegate = self
        textFieldOfGreen.delegate = self
    }
    
    @IBAction func doneAction() {
        dismiss(animated: true)
    }
    @IBAction func sliderAction(_ sender:UISlider) {
        
        switch sender.tag {
        case 0:
            labelOfRed.text = String (sliderOne.value)
            textFieldOfRed.text = String (sliderOne.value)
        case 1:
            labelOfGreen.text = String (sliderTwo.value)
            textFieldOfGreen.text = String (sliderTwo.value)
        case 2:
            labelOfBlue.text = String (sliderThree.value)
            textFieldOfBlue.text = String (sliderThree.value)
        default :
            break
        }
        
        sliderOne.value = round(sliderOne.value * 100) / 100
        sliderTwo.value = round(sliderTwo.value * 100) / 100
        sliderThree.value = round(sliderThree.value * 100) / 100
        
        setColor()
    }
    private func setColor () {
        viewOfRGB.backgroundColor = UIColor (
            red: CGFloat(sliderOne.value),
            green: CGFloat(sliderTwo.value),
            blue: CGFloat(sliderThree.value),
            alpha: 1
        )
    }
    private func setValueLabel () {
        labelOfRed.text = String(sliderOne.value)
        labelOfGreen.text = String(sliderTwo.value)
        labelOfBlue.text = String(sliderThree.value)
    }
    private func setValueTextField () {
        textFieldOfRed.text = labelOfRed.text
        textFieldOfGreen.text = labelOfGreen.text
        textFieldOfBlue.text = labelOfBlue.text
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            sliderOne.value = currentValue
            setColor()
            setValueLabel()
        } else if let currentValue = Float(text) {
            sliderTwo.value = currentValue
            setColor()
            setValueLabel()
        } else if let currentValue = Float(text) {
            sliderThree.value = currentValue
            setColor()
            setValueLabel()
        } else {
            showAlert(tittle: "Wrong format!", message: "Enter correct value")
        }
    }
    private func showAlert(tittle: String, message:String) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
