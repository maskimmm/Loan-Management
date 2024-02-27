//
//  LoanDataModel.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 27/02/24.
//

import Foundation

struct LoanDataModel: Codable, Equatable {
    let id: String
    let amount: Int
    let interestRate: Double
    let term: Int
    let purpose: Purpose
    let riskRating: RiskRating
    let borrower: Borrower
    let collateral: Collateral
    let documents: [Document]
    let repaymentSchedule: RepaymentSchedule
}

struct Borrower: Codable, Equatable {
    let id, name, email: String
    let creditScore: Int
}

struct Collateral: Codable, Equatable {
    let type: CollateralType
    let value: Int
}

enum CollateralType: String, Codable {
    case realEstate = "Real Estate"
}

struct Document: Codable, Equatable {
    let type: DocumentType
    let url: String
}

enum DocumentType: String, Codable {
    case incomeStatement = "Income Statement"
}

enum Purpose: String, Codable {
    case businessExpansion = "Business Expansion"
    case education = "Education"
    case homeImprovement = "Home Improvement"
    case others = "Others"
}

struct RepaymentSchedule: Codable, Equatable {
    let installments: [Installment]
}

struct Installment: Codable, Equatable {
    let dueDate: String
    let amountDue: Int
}

enum RiskRating: String, Codable {
    case a = "A"
    case b = "B"
    case c = "C"
}
