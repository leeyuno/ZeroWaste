//
//  SacnView.swift
//  ZeroWaste
//
//  Created by 이윤오 on 2022/09/20.
//

import SwiftUI

struct ScanView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var receiptImage: Image?
    @State private var receiptName = ""
    
    var body: some View {
        Button {
            imagePickerPresented.toggle()
        } label: {
            let image = receiptImage == nil ? Image(systemName: "plus.circle") : receiptImage ?? Image(systemName: "plus.circle")
            image
                .resizable()
                .scaledToFit()
//                .fixedSize()
//                .frame(width: 64, height: 64)
                .padding(12)
                .clipShape(Circle())
                .foregroundColor(.gray)
        }
        .sheet(isPresented: $imagePickerPresented) {
            loadImage()
        } content: {
            ImagePicker(image: $selectedImage)
        }
        .padding()
//        ZStack(alignment: .bottom) {
            
            
//            HStack {
//                Spacer()
//
//
//            }
            
//        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        
        receiptImage = Image(uiImage: selectedImage)
    }
    
    var createReceiptButton: some View {
        Button {
            print("Create receipt")
        } label: {
            Text("Create")
                .bold()
                .disabled(receiptName.isEmpty)
        }

    }
}

struct SacnView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
