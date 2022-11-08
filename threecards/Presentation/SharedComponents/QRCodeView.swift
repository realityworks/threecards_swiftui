//
//  QRCodeView.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import SwiftUI
import CoreGraphics

struct QRCodeView: View {
    var dataString: String
    var body: some View {
        ZStack {
            if let image = imageForDataString() {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)

            } else {
                Image(systemName: "eye.slash")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.appForegroundDark, lineWidth: 4)
        )
    }

    private func imageForDataString() -> UIImage? {
        guard let data = qrCodeImageData(text: dataString) else {
            return nil
        }

        return UIImage(data: data)
    }

    private func qrCodeImageData(text: String) -> Data? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }

        // Convert the text to data
        let data = text.data(using: .utf8)
        filter.setValue(data, forKey: "inputMessage")

        // Generate image from the CI QR Code
        guard let ciimage = filter.outputImage else { return nil }

        let transform = CGAffineTransform(scaleX: 5, y: 5)
        let scaledCIImage = ciimage.transformed(by: transform)

        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()
       }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(dataString: "this is asd  asd asd sad  asd asd asd a test")
    }
}
