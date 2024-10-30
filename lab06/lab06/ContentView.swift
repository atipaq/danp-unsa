//
//  ContentView.swift
//  lab06
//
//  Created by Alex Huaracha on 30/10/24.
//
import SwiftUI
import CodeScanner

struct ContentView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String = "Scan a QR code to get started."

    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                    openScannedURL(code: code.string)
                }
            }
        )
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            
            Button("Scan QR Code") {
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
    
    private func openScannedURL(code: String) {
        // Verificar si el código escaneado es una URL válida
        if let url = URL(string: code), UIApplication.shared.canOpenURL(url) {
            // Abrir en Safari el Link
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("El código escaneado no es una URL válida.")
        }
    }
}
