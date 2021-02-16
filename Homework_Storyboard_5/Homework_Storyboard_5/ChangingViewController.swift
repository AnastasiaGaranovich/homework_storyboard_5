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
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var redColorTextField: UITextField!
    @IBOutlet weak var greenColorTextField: UITextField!
    @IBOutlet weak var blueColorTextField: UITextField!
    @IBOutlet weak var opacityTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    weak var delegate: ChangingViewControllerDelegate?
    var color: UIColor!
    
    private var redColorSl: Float {
        get {
            return redColorSlider.value * 255.0
        }
        set {
            redColorSlider.value = newValue / 255.0
        }
    }
    
    private var greenColorSl: Float {
        get {
            return greenColorSlider.value * 255.0
        }
        set {
            greenColorSlider.value = newValue / 255.0
        }
    }
    
    private var blueColorSl: Float {
        get {
            return blueColorSlider.value * 255.0
        }
        set {
            blueColorSlider.value = newValue / 255.0
        }
    }
    
    private var opacitySl: Float {
        get {
            return opacitySlider.value * 1.0
        }
        set {
            opacitySlider.value = newValue / 1.0
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(color: doneButton.backgroundColor!)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        setColor()
    }
    
    private func setColor() {
        color = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: opacitySl)
        doneButton.backgroundColor = color
        setTextFields()
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        do {
            try checkColorRange()
            errorLabel.text = ""
        } catch ColorNumInputError.wrongColorRange(let message) {
            errorLabel.text = message
        } catch ColorNumInputError.wrongInput(let message) {
            errorLabel.text = message
        }
        catch {
            errorLabel.text = "Unknown error"
        }
    }
    
    private func checkColorRange() throws {
        
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
        redColorSl = red
        greenColorSl = green
        blueColorSl = blue
        opacitySl = opacity
        
        setColor()
    }
    
    private func setSliders() {
        redColorSlider.value = Float(color.components.red)
        greenColorSlider.value = Float(color.components.green)
        blueColorSlider.value = Float(color.components.blue)
        opacitySlider.value = Float(color.components.alpha)
    }
    
    private func setTextFields() {
        redColorTextField.placeholder = String(Float(color.components.red * 255))
        greenColorTextField.placeholder = String(Float(color.components.green * 255))
        blueColorTextField.placeholder = String(Float(color.components.blue * 255))
        opacityTextField.placeholder = String(Float(color.components.alpha * 1))

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSliders()
        doneButton.backgroundColor = color
        setTextFields()
    }
}
