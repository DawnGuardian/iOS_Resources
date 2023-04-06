//
//  ThirdViewController.swift
//  PlaygroundProject
//
//  Created by Dawn on 09/10/21.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var unwindButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
         debugPrint("ThirdViewController viewDidLoad")
         debugPrint("ThirdViewController viewDidLoad isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("ThirdViewController viewDidLoad isBeingPresented \(self.isBeingPresented)")
         debugPrint("ThirdViewController viewDidLoad isMovingToParent \(self.isMovingToParent)")
         debugPrint("ThirdViewController viewDidLoad isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         debugPrint("ThirdViewController viewWillAppear")
         debugPrint("ThirdViewController viewWillAppear isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("ThirdViewController viewWillAppear isBeingPresented \(self.isBeingPresented)")
         debugPrint("ThirdViewController viewWillAppear isMovingToParent \(self.isMovingToParent)")
         debugPrint("ThirdViewController viewWillAppear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         debugPrint("ThirdViewController viewWillDisappear")
         debugPrint("ThirdViewController viewWillDisappear isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("ThirdViewController viewWillDisappear isBeingPresented \(self.isBeingPresented)")
         debugPrint("ThirdViewController viewWillDisappear isMovingToParent \(self.isMovingToParent)")
         debugPrint("ThirdViewController viewWillDisappear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         debugPrint("ThirdViewController viewDidAppear")
         debugPrint("ThirdViewController viewDidAppear isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("ThirdViewController viewDidAppear isBeingPresented \(self.isBeingPresented)")
         debugPrint("ThirdViewController viewDidAppear isMovingToParent \(self.isMovingToParent)")
         debugPrint("ThirdViewController viewDidAppear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         debugPrint("ThirdViewController viewDidDisappear")
         debugPrint("ThirdViewController viewDidDisappear isBeingDismissed \(self.isBeingDismissed)")
         debugPrint("ThirdViewController viewDidDisappear isBeingPresented \(self.isBeingPresented)")
         debugPrint("ThirdViewController viewDidDisappear isMovingToParent \(self.isMovingToParent)")
         debugPrint("ThirdViewController viewDidDisappear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    @IBAction func dismissButtonTouchUpInside(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
