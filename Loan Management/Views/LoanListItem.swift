//
//  LoanListItem.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 27/02/24.
//

import SwiftUI

struct LoanListItem: View {
    let loanData: LoanDataModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                Spacer()
                Text(loanData.borrower.name)
            }
            HStack {
                Text("Amount:")
                Spacer()
                Text(loanData.amount.description)
            }
            HStack {
                Text("Interest Rate:")
                Spacer()
                Text(loanData.interestRate.description)
            }
            HStack {
                Text("Term:")
                Spacer()
                Text(loanData.term.description)
            }
            HStack {
                Text("Purpose:")
                Spacer()
                Text(loanData.purpose)
            }
            HStack {
                Text("Risk Rating:")
                Spacer()
                Text(loanData.riskRating)
            }
        }
        .padding()
        .foregroundStyle(Color.black)
        .overlay {
            Rectangle()
                .stroke(Color(uiColor: UIColor.black))
        }
    }
}

#Preview {
    LoanListItem(loanData: LoanDataModel.sampleData[0])
}
