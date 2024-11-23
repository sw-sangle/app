//
//  BarcodeScannerPreview.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI
import AVFoundation

class CameraPreviewController: UIViewController {
    var previewLayer: AVCaptureVideoPreviewLayer?
    var captureSession: AVCaptureSession?
    var delegate: BarcodeScannedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }
    
    private func setupCamera() {
        let captureSession = AVCaptureSession()
        self.captureSession = captureSession
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417, .qr]
        } else {
            return
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        self.previewLayer = previewLayer
        
        DispatchQueue.global(qos: .background).async {
            captureSession.startRunning()
        }
    }
}

extension CameraPreviewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            delegate?.barcodeScanned(code: stringValue)
        }
    }
}

protocol BarcodeScannedDelegate {
    func barcodeScanned(code: String)
}

struct CameraPreview: UIViewControllerRepresentable {
    var scannedCode: (String) -> Void
    
    func makeUIViewController(context: Context) -> CameraPreviewController {
        let controller = CameraPreviewController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: CameraPreviewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, BarcodeScannedDelegate {
        let parent: CameraPreview
        
        init(_ parent: CameraPreview) {
            self.parent = parent
        }
        
        func barcodeScanned(code: String) {
            parent.scannedCode(code)
        }
    }
}

struct BarcodeScannerPreview: View {
    @Binding var scannedCode: String
    
    var body: some View {
        VStack {
            Text("스캔된 바코드: \(scannedCode)")
                .padding()
            
            CameraPreview { code in
                self.scannedCode = code
            }
            .frame(height: UIScreen.main.bounds.height * 0.7)
        }
    }
}

#Preview {
    @Previewable @State var code: String = ""
    
    BarcodeScannerPreview(scannedCode: $code)
}
