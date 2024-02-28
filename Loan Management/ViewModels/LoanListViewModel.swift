//
//  LoanListViewModel.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 27/02/24.
//

import Foundation

class LoanListViewModel: ObservableObject {
    @Published var isLoading: Bool = true

    @Published var isError: Bool = false
    @Published var errorMessage: String = ""

    @Published var loanDatas: [LoanDataModel] = [LoanDataModel]() {
        didSet {
            filteredLoanDatas = loanDatas.sorted(by: { previousData, nextData in
                return previousData.borrower.name < nextData.borrower.name
            })
        }
    }
    
    @Published var filteredLoanDatas: [LoanDataModel] = [LoanDataModel]()
    @Published var sortType: SortType = .nameAsc {
        didSet {
            filteredLoanDatas = loanDatas.sorted(by: { previousData, nextData in
                switch sortType {
                case .nameAsc:
                    return previousData.borrower.name < nextData.borrower.name
                    
                case .nameDesc:
                    return previousData.borrower.name > nextData.borrower.name
                case .amountLowest:
                    return previousData.amount < nextData.amount
                case .amountHighest:
                    return previousData.amount > nextData.amount
                case .termLowest:
                    return previousData.term < nextData.term
                case .termHighest:
                    return previousData.term > nextData.term
                case .purposeAsc:
                    return previousData.purpose < nextData.purpose
                case .purposeDesc:
                    return previousData.purpose > nextData.purpose
                }
            })
        }
    }
    
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
