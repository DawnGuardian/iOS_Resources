//
//  DatePickerTextField.swift
//  Air_Purifier_Inventory
//
//  Created by Dawn on 30/09/21.
//

import UIKit

class DatePickerTextField: UITextField, UITextFieldDelegate {
    var datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: (3 * UIScreen.main.bounds.height / 5)))
    
    var selectedDate: Date {
        set {
            datePicker.setDate(newValue, animated: false)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/mm/dd"
            self.text = dateFormatter.string(from: datePicker.date)
        }
        get {
            return datePicker.date
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialiseTextField() {
        self.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.timeZone = TimeZone.current
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneBarButtonItemTouchUpInside))
        let timeZoneInformationBarButtonItem = UIBarButtonItem(title: "TZ: \(TimeZone.current.abbreviation() ?? "")", image: nil, primaryAction: nil, menu: nil)
        let closelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.closeBarButtonItemTouchUpInside))
        let flexibleSpaceBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([doneBarButtonItem, flexibleSpaceBarButtonItem, timeZoneInformationBarButtonItem, flexibleSpaceBarButtonItem, closelBarButtonItem], animated: false)
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneBarButtonItemTouchUpInside() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DATEFORMAT_SHORT
        self.text = dateFormatter.string(from: datePicker.date)
        endEditing(true)
    }
    
    @objc func closeBarButtonItemTouchUpInside() {
        endEditing(true)
    }
}

// Manage text editing
extension DatePickerTextField {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

// Manage text selection
extension DatePickerTextField {
    func textFieldDidChangeSelection(_ textField: UITextField) {
    }
}

// Provide context menu
extension DatePickerTextField {
    func textField(_ textField: UITextField, editMenuForCharactersIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu? {
        return nil
    }
}

// Customise edit menus
extension DatePickerTextField {
    func textField(_ textField: UITextField, willPresentEditMenuWith animator: UIEditMenuInteractionAnimating) {
    }
    
    func textField(_ textField: UITextField, willDismissEditMenuWith animator: UIEditMenuInteractionAnimating) {
    }
}
