//
//  SacnView.swift
//  ZeroWaste
//
//  Created by 이윤오 on 2022/09/20.
//

import SwiftUI

struct ScanView: View {
    @State private var receiptSelected = false
    @State private var imagePickerPresented = false
    @State private var imageContentMode: ContentMode = .fill
    @State private var selectedImage: UIImage?
    @State private var receiptImage: Image?
    @State private var receiptName = ""
    
    var body: some View {
        if $receiptSelected.wrappedValue {
            receiptImage?
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Button {
                imagePickerPresented.toggle()
            } label: {
                Text("영수증 찾기")
                    .bold()
            }
            .opacity(receiptSelected ? 0 : 1)
            .sheet(isPresented: $imagePickerPresented) {
                loadImage()
            } content: {
                ImagePicker(image: $selectedImage)
            }
            .padding()
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        
        receiptImage = Image(uiImage: selectedImage)
        receiptSelected = true
    }
    
//    var createReceiptButton: some View {
//        Button {
//            print("Create receipt")
//        } label: {
//            Text("Create")
//                .bold()
//                .disabled(receiptName.isEmpty)
//        }
//
//    }
}

struct SacnView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
