//
//  CustomError.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 04/03/24.
//

enum CustomError: Error {
    case urlError, decodeError, unknownError
    
    var description: String {
        switch self {
        case .urlError:
            return "URL Error"
        case .decodeError:
            return "Decode Error"
        case .unknownError:
            return "URL Error"
        }
    }
}
