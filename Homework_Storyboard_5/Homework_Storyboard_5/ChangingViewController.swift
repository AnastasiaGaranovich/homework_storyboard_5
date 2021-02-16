import UIKit

protocol ChangingViewControllerDelegate: class {
    func didPressButton(color: UIColor)
}

enum ColorNumInputError: Error {
    case wrongColorRange(String)
    case wrongInput(String)
}

class ChangingViewController: UIViewController {
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    @IBOutlet weak var opacitySlider: UISlider!
    
    
    @IBOutlet weak var redColorTextField: UITextField!
    @IBOutlet weak var greenColorTextField: UITextField!
    @IBOutlet weak var blueColorTextField: UITextField!
    @IBOutlet weak var opacityTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    weak var delegate: ChangingViewControllerDelegate?
    var color: UIColor!
    
    var redColorSl: Float = 0.0
    var greenColorSl: Float = 0.0
    var blueColorSl: Float = 0.0
    var opacitySl: Float = 0.0
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        do {
            let selectedColor = try checkColorRange()
            delegate?.didPressButton(color: selectedColor)
            navigationController?.popViewController(animated: true)
        } catch ColorNumInputError.wrongColorRange(let message) {
            AlertView(message: message)
        } catch ColorNumInputError.wrongInput(let message){
            AlertView(message: message)
        }
        catch {
            print("Unknown error")
        }
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redColorSl = redColorSlider.value * 255.0
        doneButton.backgroundColor = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: opacitySl)
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenColorSl = greenColorSlider.value * 255.0
        doneButton.backgroundColor = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: opacitySl)
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueColorSl = blueColorSlider.value * 255.0
        doneButton.backgroundColor = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: opacitySl)
    }
    
    @IBAction func opacitySliderChanged(_ sender: UISlider) {
        opacitySl = opacitySlider.value * 1
        doneButton.backgroundColor = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: opacitySl)
    }
    
    private func checkColorRange() throws -> UIColor {
        
        let redColor:Float? = Float(redColorTextField.text ?? "")
        let greenColor:Float? = Float(greenColorTextField.text ?? "")
        let blueColor:Float? = Float(blueColorTextField.text ?? "")
        let opacityColor:Float? = Float(opacityTextField.text ?? "")
        
        guard let red = redColor else {
            throw ColorNumInputError.wrongInput("Wrong Input of Red Color")
        }
        guard let green = greenColor else {
            throw ColorNumInputError.wrongInput("Wrong Input of Green Color")
        }
        guard let blue = blueColor else {
            throw ColorNumInputError.wrongInput("Wrong Input of Blue Color")
        }
        guard let opacity = opacityColor else {
            throw ColorNumInputError.wrongInput("Wrong Input of Opacity")
        }
        if(red < 0 || red > 255) {
            throw ColorNumInputError.wrongColorRange("Wrong Red Color Range")
        }
        if(green < 0 || green > 255) {
            throw ColorNumInputError.wrongColorRange("Wrong Green Color Range")
        }
        if(blue < 0 || blue > 255) {
            throw ColorNumInputError.wrongColorRange("Wrong Blue Color Range")
        }
        if(opacity < 0 || opacity > 1) {
            throw ColorNumInputError.wrongColorRange("Wrong Opacity Range")
        }
        let selectedColor = UIColor(rgbColorCodeRed: red, green: green, blue: blue, alpha: opacity)
        return selectedColor
    }
    
    private func AlertView(message: String) {
        let dialogMessage = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
