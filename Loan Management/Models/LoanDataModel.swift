//
//  LoanDataModel.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 27/02/24.
//

import Foundation

struct LoanDataModel: Equatable {
    let id: String
    let amount: Int
    let interestRate: Double
    let term: Int
    let purpose: String
    let riskRating: String
    let borrower: Borrower
    let collateral: Collateral
    let documents: [Document]
    let repaymentSchedule: RepaymentSchedule
    
    static let sampleData: [LoanDataModel] = [
        LoanDataModel(
            id: "658539b43f5498ccae79105b",
            amount: 5000,
            interestRate: 0.8,
            term: 120,
            purpose: "Business Expansion",
            riskRating: "C",
            borrower: Borrower(
                id: "658539b489fdaab6eae418f3",
                name: "Shelly Valenzuela",
                email: "shellyvalenzuela@orbaxter.com",
                creditScore: 650
            ),
            collateral: Collateral(
                type: "Real Estate",
                value: 100000
            ),
            documents: [
                Document(
                    type: "Income Statement",
                    url: "/loans/documents/income_statement/slip-gaji-karyawan-pertamina.jpeg"
                )
            ],
            repaymentSchedule: RepaymentSchedule(
                installments: [
                    Installment(
                        dueDate: "2023-01-15",
                        amountDue: 500
                    ),
                    Installment(
                        dueDate: "2023-02-15",
                        amountDue: 500
                    )
                ]
            )
        ),
        LoanDataModel(
            id: "658539b428feed8be88f4743",
            amount: 5000,
            interestRate: 0.8,
            term: 60,
            purpose: "Business Expansion",
            riskRating: "B",
            borrower: Borrower(
                id: "658539b4531251559e6641bb",
                name: "Gayle Long",
                email: "gaylelong@orbaxter.com",
                creditScore: 700
            ),
            collateral: Collateral(
                type: "Real Estate",
                value: 100000
            ),
            documents: [
                Document(
                    type: "Income Statement",
                    url: "/loans/documents/income_statement/slip-gaji-karyawan-pertamina.jpeg"
                )
            ],
            repaymentSchedule: RepaymentSchedule(
                installments: [
                    Installment(
                        dueDate: "2023-01-15",
                        amountDue: 500
                    ),
                    Installment(
                        dueDate: "2023-02-15",
                        amountDue: 500
                    )
                ]
            )
        ),
        
    ]
}

struct Borrower: Equatable {
    let id, name, email: String
    let creditScore: Int
}

struct Collateral: Equatable {
    let type: String
    let value: Int
}

struct Document: Equatable {
    let type: String
    let url: String
}

struct RepaymentSchedule: Equatable {
    let installments: [Installment]
}

struct Installment: Equatable {
    let id = UUID()
    let dueDate: String
    let amountDue: Int
}
