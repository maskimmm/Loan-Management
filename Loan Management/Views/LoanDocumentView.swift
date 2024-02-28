//
//  LoanDocumentView.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 28/02/24.
//

import SwiftUI

struct LoanDocumentView: View {
    let document: Document
    @StateObject private var vm = LoanDocumentViewModel()
    
    var body: some View {
        ZStack {
            if let imageData = vm.imageData, let uiImage = UIImage(data: imageData) {
                ScrollView {
                    HStack {
                        Text("Document Type")
                        Spacer()
                        Text(document.type)
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle())
                    }
                    .padding(10)
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .multilineTextAlignment(.leading)
            } else {
                Text("No Document to Show")
            }
        }
        .background(Color(UIColor.systemGray6))
        .navigationTitle("Detail " + document.type)
        .navigationBarTitleDisplayMode(.inline)
        .alert(vm.errorMessage, isPresented: $vm.isError) {
            Button {
                
            } label: {
                Text("Dismiss")
            }
        }
        .task {
            vm.document = document
        }
    }
}

struct LoanDocumentView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
//            LoanDocumentView(vm: LoanDocumentViewModel(document: LoanDataModel.sampleData[0].documents[0]))
            LoanDocumentView(document: LoanDataModel.sampleData[0].documents[0])
        }
    }
}
