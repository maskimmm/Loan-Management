//
//  LoanDataModelResponse.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 04/03/24.
//

struct LoanDataModelResponse: Codable, Equatable {
    let id: String
    let amount: Int
    let interestRate: Double
    let term: Int
    let purpose: String
    let riskRating: String
    let borrower: BorrowerResponse
    let collateral: CollateralResponse
    let documents: [DocumentResponse]
    let repaymentSchedule: RepaymentScheduleResponse
}

struct BorrowerResponse: Codable, Equatable {
    let id, name, email: String
    let creditScore: Int
}

struct CollateralResponse: Codable, Equatable {
    let type: String
    let value: Int
}

struct DocumentResponse: Codable, Equatable {
    let type: String
    let url: String
}

struct RepaymentScheduleResponse: Codable, Equatable {
    let installments: [InstallmentResponse]
}

struct InstallmentResponse: Codable, Equatable {
    let dueDate: String
    let amountDue: Int
}
