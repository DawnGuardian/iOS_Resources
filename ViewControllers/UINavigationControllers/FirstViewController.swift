//
//  FirstViewController.swift
//  PlaygroundProject
//
//  Created by Dawn on 09/10/21.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("FirstViewController viewDidLoad")
        debugPrint("FirstViewController viewDidLoad isBeingDismissed \(self.isBeingDismissed)")
        debugPrint("FirstViewController viewDidLoad isBeingPresented \(self.isBeingPresented)")
        debugPrint("FirstViewController viewDidLoad isMovingToParent \(self.isMovingToParent)")
        debugPrint("FirstViewController viewDidLoad isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        debugPrint("FirstViewController viewWillAppear")
        debugPrint("FirstViewController viewWillAppear isBeingDismissed \(self.isBeingDismissed)")
        debugPrint("FirstViewController viewWillAppear isBeingPresented \(self.isBeingPresented)")
        debugPrint("FirstViewController viewWillAppear isMovingToParent \(self.isMovingToParent)")
        debugPrint("FirstViewController viewWillAppear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        debugPrint("FirstViewController viewWillDisappear")
        debugPrint("FirstViewController viewWillDisappear isBeingDismissed \(self.isBeingDismissed)")
        debugPrint("FirstViewController viewWillDisappear isBeingPresented \(self.isBeingPresented)")
        debugPrint("FirstViewController viewWillDisappear isMovingToParent \(self.isMovingToParent)")
        debugPrint("FirstViewController viewWillDisappear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        debugPrint("FirstViewController viewDidAppear")
        debugPrint("FirstViewController viewDidAppear isBeingDismissed \(self.isBeingDismissed)")
        debugPrint("FirstViewController viewDidAppear isBeingPresented \(self.isBeingPresented)")
        debugPrint("FirstViewController viewDidAppear isMovingToParent \(self.isMovingToParent)")
        debugPrint("FirstViewController viewDidAppear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        debugPrint("FirstViewController viewDidDisappear")
        debugPrint("FirstViewController viewDidDisappear isBeingDismissed \(self.isBeingDismissed)")
        debugPrint("FirstViewController viewDidDisappear isBeingPresented \(self.isBeingPresented)")
        debugPrint("FirstViewController viewDidDisappear isMovingToParent \(self.isMovingToParent)")
        debugPrint("FirstViewController viewDidDisappear isMovingFromParent \(self.isMovingFromParent)")
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        performSegue(withIdentifier: "ToSecondViewController", sender: self)
    }
}
