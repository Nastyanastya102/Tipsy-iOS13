
import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
 
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

    }
    @IBAction func calculatePressed(_ sender: UIButton) {
       performSegue(withIdentifier: "goToResult", sender: self)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if (sender.value < 12) {
            splitNumberLabel.text = String(format: "%.0f", sender.value)
        }
    }
}


