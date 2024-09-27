
import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var numberOfPeople = 2
    var tip = 0.10
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100

    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
         let bill = billTextField.text!
         if bill != "" {
             billTotal = Double(bill)!
             let result = billTotal * (1 + tip) / Double(numberOfPeople)
             finalResult = String(format: "%.2f", result)
         }
       performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
       splitNumberLabel.text = String(format: "%.0f", sender.value)
       numberOfPeople = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           if segue.identifier == "goToResult" {
               let destinationVC = segue.destination as! ResultsViewController
               destinationVC.result = finalResult
               destinationVC.tip = Int(tip * 100)
               destinationVC.split = numberOfPeople
           }
       }
}


