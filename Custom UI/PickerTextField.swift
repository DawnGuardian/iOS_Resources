//
//  PickerTextField.swift
//  Air_Purifier_Inventory
//
//  Created by Dawn on 30/09/21.
//

import UIKit

class PickerTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    var options = [String]()
    var pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: (3 * UIScreen.main.bounds.width / 5)))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = options[row]
    }
    
    func setText(text: String?) {
        if let text = text {
            if options.contains(text) {
                pickerView.selectRow(options.firstIndex(of: text)!, inComponent: 0, animated: false)
                self.text = text
            } else {
                pickerView.selectRow(0, inComponent: 0, animated: false)
                self.text = "---"
            }
        } else {
            self.setText(text: "---")
        }
    }
    
    func initialiseTextField(options: [String], nullable: Bool = false) {
        self.options = options
        if nullable {
            self.options.insert("---", at: 0)
        }
        
        self.inputView = pickerView
        pickerView.reloadAllComponents()
        
        if !options.isEmpty {
            pickerView.selectRow(0, inComponent: 0, animated: false)
            self.text = options[0]
        }
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneBarButtonItemTouchUpInside))
        let closeBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.closeBarButtonItemTouchUpInside))
        let flexibleSpaceBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([doneBarButtonItem, flexibleSpaceBarButtonItem, closeBarButtonItem], animated: false)
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneBarButtonItemTouchUpInside() {
        self.text = options[pickerView.selectedRow(inComponent: 0)]
        endEditing(true)
    }
    
    @objc func closeBarButtonItemTouchUpInside() {
        endEditing(true)
    }
}
