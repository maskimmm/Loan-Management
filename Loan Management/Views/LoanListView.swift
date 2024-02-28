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
                if vm.filteredLoanDatas.isEmpty {
                    Text("No Loan Data")
                } else {
                    HStack {
                        Text("Sort By")
                        Spacer()
                        Picker("Sort By", selection: $vm.sortType) {
                            ForEach(SortType.allCases, id: \.rawValue) { sortType in
                                Text(sortType.description).tag(sortType)
                            }
                        }
                    }
                    .padding(.horizontal)
                    ScrollView {
                        ForEach(vm.filteredLoanDatas, id: \.id) { loanData in
                            NavigationLink {
                                LoanDetailView(loanData: loanData)
                            } label: {
                                LoanListItem(loanData: loanData)
                                    .foregroundStyle(Color(UIColor.label))
                            }
                        }
                    }
                }
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
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
        NavigationView {
            LoanListView()
        }
        .navigationViewStyle(.stack)
    }
}
