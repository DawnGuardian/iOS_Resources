//
//  BarCodeScannerTextField.swift
//  PlaygroundProject
//
//  Created by Dawn on 21/10/21.
//

import UIKit
import AVFoundation

class BarCodeScannerTextField: UITextField, AVCaptureMetadataOutputObjectsDelegate {
    let cameraView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height / 2)))
    let captureSession = AVCaptureSession()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: captureDevice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else if captureSession.inputs.isEmpty {
            return
        }
        
        let captureMetaDataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(captureMetaDataOutput) {
            captureSession.addOutput(captureMetaDataOutput)
            captureMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetaDataOutput.metadataObjectTypes = [.code39, .code39Mod43, .code93, .code128, .ean8, .ean13, .interleaved2of5, .itf14, .upce,
                                                         .aztec, .dataMatrix, .pdf417, .qr]
        } else {
            return
        }
        
        let scanCodeButton = UIButton(type: .custom)
        scanCodeButton.setImage(UIImage(systemName: "barcode.viewfinder"), for: .normal)
        scanCodeButton.addTarget(self, action: #selector(self.scanCodeButtonTouchUpInside), for: .touchUpInside)
        scanCodeButton.sizeToFit()
        
        rightView = scanCodeButton
        rightViewMode = .always
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let closeBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.closeBarButtonItemTouchUpInside))
        let flexibleSpaceBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([flexibleSpaceBarButtonItem, closeBarButtonItem], animated: false)
        self.inputAccessoryView = toolbar
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metaDataObject = metadataObjects.first {
            guard let readableObject = metaDataObject as? AVMetadataMachineReadableCodeObject else {
                print("Failed converting metaDataObject to AVMetadataMachineReadableCodeObject")
                return
            }

            guard let stringValue = readableObject.stringValue else {
                print("Failed retrieveing stringValue from readableObject")
                return
            }
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            self.text = stringValue
        }
        
        inputView = nil
        resignFirstResponder()
        becomeFirstResponder()
    }
    
    @objc func scanCodeButtonTouchUpInside() {
        if captureSession.isRunning {
            return
        }
        
        let captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        captureVideoPreviewLayer.frame = cameraView.layer.bounds
        captureVideoPreviewLayer.videoGravity = .resizeAspectFill
        cameraView.layer.addSublayer(captureVideoPreviewLayer)
        
        inputView = cameraView
        
        captureSession.startRunning()
        
        resignFirstResponder()
        becomeFirstResponder()
    }
    
    @objc func closeBarButtonItemTouchUpInside() {
        if captureSession.isRunning {
            captureSession.stopRunning()
            inputView = nil
            resignFirstResponder()
            becomeFirstResponder()
        } else {
            endEditing(true)
        }
    }
}
