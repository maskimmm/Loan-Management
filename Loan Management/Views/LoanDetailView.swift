//
//  LoanDetailView.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 28/02/24.
//

import SwiftUI

struct LoanDetailView: View {
    let loanData: LoanDataModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(loanData.borrower.name)
                            .foregroundStyle(Color.secondary)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(loanData.borrower.email)
                            .foregroundStyle(Color.secondary)
                    }
                    HStack {
                        Text("Credit Score")
                        Spacer()
                        Text(loanData.borrower.creditScore.description)
                            .foregroundStyle(Color.secondary)
                    }
                } header: {
                    Text("Borrower Data")
                }
                Section {
                    HStack {
                        Text("Collateral Type")
                        Spacer()
                        Text(loanData.collateral.type)
                            .foregroundStyle(Color.secondary)
                    }
                    HStack {
                        Text("Value")
                        Spacer()
                        Text(loanData.collateral.value.description)
                            .foregroundStyle(Color.secondary)
                    }
                } header: {
                    Text("Collateral")
                }
                Section {
                    ForEach(loanData.repaymentSchedule.installments, id: \.id) { installment in
                        VStack {
                            HStack {
                                Text("Due Date")
                                Spacer()
                                Text(installment.dueDate)
                            }
                            HStack {
                                Text("Amount")
                                Spacer()
                                Text(installment.amountDue.description)
                            }
                        }
                    }
                } header: {
                    Text("Repayment Schedule")
                }
                Section {
                    if loanData.documents.isEmpty {
                        Text("No Document Provided")
                            .foregroundStyle(Color.secondary)
                    } else {
                        ForEach(loanData.documents, id: \.url) { document in
                            
                            NavigationLink {
                                
                            } label: {
                                Text(document.type)
                            }
                        }
                    }
                } header: {
                    Text("Document")
                }
            }
        }
        .navigationTitle("Loan Detail")
    }
}

struct LoanDetailView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoanDetailView(loanData: LoanDataModel.sampleData[0])
        }
    }
}
