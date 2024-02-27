//
//  LoanListViewModel.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 27/02/24.
//

import Foundation

class LoanListViewModel: ObservableObject {
    @Published var loanDatas: [LoanDataModel] = [LoanDataModel]()
    @Published var isLoading: Bool = true
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        getLoanDatas()
    }
    
    func getLoanDatas() {
        APIService.shared.getLoanDatas { result in
            switch result {
            case .success(let success):
                self.loanDatas = success
                self.isLoading = false
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
                self.isError = true
                self.isLoading = false
            }
        }
    }
}
