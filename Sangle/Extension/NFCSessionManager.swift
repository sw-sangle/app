//
//  NFCSessionManager.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/24/24.
//


import CoreNFC
import SwiftUI

class NFCSessionManager: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {
    @Published var nfcMessage: String = "Tap 'Scan NFC' to start."

    func startNFCSession() {
        guard NFCNDEFReaderSession.readingAvailable else {
            nfcMessage = "NFC is not available on this device."
            return
        }

        let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session.alertMessage = "Hold your iPhone near an NFC tag to scan."
        session.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("Session invalidated: \(error.localizedDescription)")
        if let readerError = error as? NFCReaderError, readerError.code != .readerSessionInvalidationErrorUserCanceled {
            DispatchQueue.main.async {
                self.nfcMessage = "NFC Error: \(error.localizedDescription)"
            }
        }
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var detectedText = ""
        for message in messages {
            for record in message.records {
                if let text = String(data: record.payload, encoding: .utf8) {
                    detectedText += "\(text)\n"
                }
            }
            print(detectedText)
        }
        DispatchQueue.main.async {
            self.nfcMessage = detectedText.isEmpty ? "No data found on tag." : detectedText
        }
    }
}
