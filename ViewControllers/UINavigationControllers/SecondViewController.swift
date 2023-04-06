//
//  SecondViewController.swift
//  PlaygroundProject
//
//  Created by Dawn on 09/10/21.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var unwindButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
         debugPrint("SecondViewController viewDidLoad")
         debugPrint("SecondViewController viewDidLoad isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("SecondViewController viewDidLoad isBeingPresented \(self.isBeingPresented)")
         debugPrint("SecondViewController viewDidLoad isMovingToParent \(self.isMovingToParent)")
         debugPrint("SecondViewController viewDidLoad isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         debugPrint("SecondViewController viewWillAppear")
         debugPrint("SecondViewController viewWillAppear isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("SecondViewController viewWillAppear isBeingPresented \(self.isBeingPresented)")
         debugPrint("SecondViewController viewWillAppear isMovingToParent \(self.isMovingToParent)")
         debugPrint("SecondViewController viewWillAppear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         debugPrint("SecondViewController viewWillDisappear")
         debugPrint("SecondViewController viewWillDisappear isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("SecondViewController viewWillDisappear isBeingPresented \(self.isBeingPresented)")
         debugPrint("SecondViewController viewWillDisappear isMovingToParent \(self.isMovingToParent)")
         debugPrint("SecondViewController viewWillDisappear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         debugPrint("SecondViewController viewDidAppear")
         debugPrint("SecondViewController viewDidAppear isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("SecondViewController viewDidAppear isBeingPresented \(self.isBeingPresented)")
         debugPrint("SecondViewController viewDidAppear isMovingToParent \(self.isMovingToParent)")
         debugPrint("SecondViewController viewDidAppear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         debugPrint("SecondViewController viewDidDisappear")
         debugPrint("SecondViewController viewDidDisappear isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("SecondViewController viewDidDisappear isBeingPresented \(self.isBeingPresented)")
         debugPrint("SecondViewController viewDidDisappear isMovingToParent \(self.isMovingToParent)")
         debugPrint("SecondViewController viewDidDisappear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        performSegue(withIdentifier: "ToThirdViewController", sender: self)
    }
    
    @IBAction func dismissButtonTouchUpInside(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
