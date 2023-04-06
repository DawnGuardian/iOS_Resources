//
//  KeyboardAutomationViewController.swift
//  PlaygroundProject
//
//  Created by Dawn on 09/10/21.
//

import UIKit

class KeyboardAutomationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    
    var editingFrame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.endEditingTextFields))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChangeFrame(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if editingFrame == nil {
            editingFrame = textField.frame
            
            var currentView: UIView? = textField.superview
            while currentView != nil {
                editingFrame?.origin.x += currentView?.frame.origin.x ?? CGFloat(0.0)
                editingFrame?.origin.y += currentView?.frame.origin.y ?? CGFloat(0.0)
                currentView = currentView?.superview
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if editingFrame == nil {
            editingFrame = textField.frame
            
            var currentView: UIView? = textField.superview
            while currentView != nil {
                editingFrame?.origin.x += currentView?.frame.origin.x ?? CGFloat(0.0)
                editingFrame?.origin.y += currentView?.frame.origin.y ?? CGFloat(0.0)
                currentView = currentView?.superview
            }
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        editingFrame = nil
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        editingFrame = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    @objc func keyboardWillChangeFrame(notification: Notification) {
        if let editingFrame = editingFrame {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) {
                let offset = editingFrame.maxY - keyboardSize.minY
                if offset > self.view.frame.origin.y {
                    self.view.frame.origin.y -= offset
                } else {
                    if self.view.frame.origin.y != 0 {
                        self.view.frame.origin.y = 0
                    }
                }
            }
        } else {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    @objc func endEditingTextFields() {
        view.endEditing(true)
    }
}
