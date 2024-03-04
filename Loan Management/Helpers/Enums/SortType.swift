//
//  SortType.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 28/02/24.
//

enum SortType: String, CaseIterable {
    case nameAsc
    case nameDesc
    case amountLowest
    case amountHighest
    case purposeAsc
    case purposeDesc
    case termLowest
    case termHighest
    
    var description: String {
        switch self {
        case .nameAsc:
            return "Name Ascending"
        case .nameDesc:
            return "Name Descending"
        case .amountLowest:
            return "Lowest Amount"
        case .amountHighest:
            return "Highest Amount"
        case .termLowest:
            return "Lowest Term"
        case .termHighest:
            return "Highest Term"
        case .purposeAsc:
            return "Purpose Ascending"
        case .purposeDesc:
            return "Purpose Descending"
        }
    }
}
