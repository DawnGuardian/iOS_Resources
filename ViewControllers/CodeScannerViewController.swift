//
//  CodeScannerViewController.swift
//  PlaygroundProject
//
//  Created by Dawn on 20/10/21.
//

import UIKit
import AVFoundation

class CodeScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession?
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession = AVCaptureSession()
        guard captureSession != nil else {
            print("Failed setting captureSession")
            return
        }
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed getting captureDevice")
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: captureDevice)
        } catch {
            print("Failed getting videoInput")
            return
        }
        
        if captureSession!.canAddInput(videoInput) {
            captureSession?.addInput(videoInput)
        } else {
            print("Failed adding captureSession input")
            return
        }
        
        let captureMetaDataOutput = AVCaptureMetadataOutput()
        if captureSession!.canAddOutput(captureMetaDataOutput) {
            captureSession?.addOutput(captureMetaDataOutput)
            captureMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetaDataOutput.metadataObjectTypes = [.ean8, .qr, .code128]
        } else {
            print("Failed adding captureSession output")
            return
        }
        
        captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        captureVideoPreviewLayer?.frame = view.layer.bounds
        captureVideoPreviewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(captureVideoPreviewLayer!)
        
        captureSession?.startRunning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if captureSession != nil, !(captureSession?.isRunning ?? true) {
            captureSession?.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if captureSession != nil, captureSession?.isRunning ?? true {
            captureSession?.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession?.stopRunning()
        
        if let metaDataObject = metadataObjects.first {
            guard let readableObject = metaDataObject as? AVMetadataMachineReadableCodeObject else {
                print("Failed converting metaDataObject to AVMetadataMachineReadableCodeObject")
                return
            }

            let readableObjectType = readableObject.type.rawValue
            guard let stringValue = readableObject.stringValue else {
                print("Failed retrieveing stringValue from readableObject")
                return
            }
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            print("CODE TYPE: \(readableObjectType) INFO: \(stringValue)")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
