//
//  LoanDocumentViewModel.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 28/02/24.
//

import Foundation

class LoanDocumentViewModel: ObservableObject {
    @Published var document: Document? {
        didSet {
            if let document = document {
                getImage(imageUrl: document.url)
            } else {
                errorMessage = "No Document Provided"
                isError = true
                isLoading = false
                
            }
        }
    }
    @Published var isLoading: Bool = true
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var imageData: Data?
        
    func getImage(imageUrl: String) {
        APIService.shared.getImage(imageUrl: imageUrl) { result in
            switch result {
            case .success(let success):
                self.imageData = success
                self.isLoading = false
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
                print(failure.localizedDescription)
                self.isError = true
                self.isLoading = false
            }
        }
    }
}
