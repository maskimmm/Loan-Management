//
//  LoanListView.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 27/02/24.
//

import SwiftUI

struct LoanListView: View {
    @StateObject private var vm = LoanListViewModel()
    
    var body: some View {
        VStack {
            if vm.isLoading {
                HStack {
                    ProgressView()
                    Text("Please Wait")
                        .padding(.leading, 10)
                }
            } else {
                if vm.loanDatas.isEmpty {
                    Text("No Loan Data")
                } else {
                    ScrollView {
                        ForEach(vm.loanDatas, id: \.id) { loanData in
                            NavigationLink {
                                
                            } label: {
                                LoanListItem(loanData: loanData)
                                .foregroundStyle(Color.black)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Loan List")
        .alert(vm.errorMessage, isPresented: $vm.isError) {
            Button {
                vm.getLoanDatas()
            } label: {
                Text("Try Again")
            }
            Button {
                
            } label: {
                Text("Dismiss")
            }
        }
    }
}

struct LoanListView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoanListView()
        }
    }
}
