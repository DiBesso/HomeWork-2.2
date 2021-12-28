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
    
    var delegate: ViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewOfRGB.layer.cornerRadius = 20
        
        viewOfRGB.backgroundColor = viewColor
        
        setSliders()
        setValue(for: labelOfRed, labelOfGreen, labelOfBlue)
        setValue(for: textFieldOfRed, textFieldOfGreen, textFieldOfBlue)
    }
    
   
    @IBAction func sliderAction(_ sender:UISlider) {
        
        switch sender {
        case sliderOne:
            setValue(for: labelOfRed)
            setValue(for: textFieldOfRed)
        case sliderTwo:
            setValue(for: labelOfGreen)
            setValue(for: textFieldOfGreen)
        default:
            setValue(for: labelOfBlue)
            setValue(for: textFieldOfBlue)
        }
        setColor()
    }
    
    @IBAction func doneAction() {
        delegate?.setColor(viewOfRGB.backgroundColor ?? .black)
        dismiss(animated: true)
    }
}
   
extension ViewController {
    private func setColor () {
        viewOfRGB.backgroundColor = UIColor (
            red: CGFloat(sliderOne.value),
            green: CGFloat(sliderTwo.value),
            blue: CGFloat(sliderThree.value),
            alpha: 1
        )
    }
    private func setValue (for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case labelOfRed: label.text = string(from: sliderOne)
            case labelOfGreen: label.text = string(from:sliderTwo)
            default: label.text = string(from: sliderThree)
            }
        }
    }
    private func setValue (for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case textFieldOfRed: textField.text = string(from: sliderOne)
            case textFieldOfGreen: textField.text = string(from: sliderTwo)
            default: textField.text = string(from: sliderThree)
            }
        }
    }
    private func setSliders () {
        let ciColor = CIColor(color: viewColor)
        sliderOne.value = Float(ciColor.red)
        sliderTwo.value = Float(ciColor.green)
        sliderThree.value = Float(ciColor.blue)
    }


private func string(from slider: UISlider) -> String {
    String(format: "%.2f", slider.value)
}
    @objc private func didTapDone() {
        view.endEditing(true)
    }

    private func showAlert(tittle: String, message:String) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
    extension ViewController: UITextFieldDelegate {
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case textFieldOfRed:
                sliderOne.setValue(currentValue, animated: true)
                setValue(for: labelOfRed)
            case textFieldOfGreen:
                sliderTwo.setValue(currentValue, animated: true)
                setValue(for: labelOfGreen)
            default:
                sliderThree.setValue(currentValue, animated: true)
                setValue(for: labelOfBlue)
            }
            setColor()
            return
        }
            showAlert(tittle: "Wrong format!", message: "Enter correct value")
    }
        func textFieldDidBeginEditing(_ textField: UITextField) {
            let keyboardToolbar = UIToolbar()
            keyboardToolbar.sizeToFit()
            textField.inputAccessoryView = keyboardToolbar
            
            let doneButton = UIBarButtonItem(
                barButtonSystemItem: .done,
                target: self,
                action: #selector(didTapDone)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
}
