//
//  APIService.swift
//  Loan Management
//
//  Created by Rifqi Alhakim Hariyantoputera on 27/02/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    let baseUrl = "https://raw.githubusercontent.com/andreascandle/p2p_json_test/main"
    
    func getLoanDatas(completion: @escaping (Result<[LoanDataModel], Error>) -> Void) {
        let urlString: String = baseUrl + "/api/json/loans.json"
        
        guard let url = URL(string: urlString) else { return completion(.failure(CustomError.urlError)) }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(CustomError.unknownError))
                }
                return
            }
            
            var decodedData: [LoanDataModel] = [LoanDataModel]()
            
            do {
                let datas = try JSONDecoder().decode([LoanDataModelResponse].self, from: data)
                for data in datas {
                    var documents: [Document] = [Document]()
                    for document in data.documents {
                        documents.append(Document(type: document.type, url: document.url))
                    }
                    
                    var installments: [Installment] = [Installment]()
                    for installment in data.repaymentSchedule.installments {
                        installments.append(Installment(dueDate: installment.dueDate, amountDue: installment.amountDue))
                    }
                    
                    decodedData.append(
                        LoanDataModel(
                            id: data.id, 
                            amount: data.amount,
                            interestRate: data.interestRate, 
                            term: data.term,
                            purpose: data.purpose,
                            riskRating: data.riskRating,
                            borrower: Borrower(
                                id: data.borrower.id,
                                name: data.borrower.name,
                                email: data.borrower.email,
                                creditScore: data.borrower.creditScore
                            ),
                            collateral: Collateral(
                                type: data.collateral.type,
                                value: data.collateral.value
                            ),
                            documents: documents,
                            repaymentSchedule: RepaymentSchedule(installments: installments))
                    )
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
            DispatchQueue.main.async {
                completion(.success(decodedData))
            }
        }
        
        task.resume()
    }
    
    func getImage(imageUrl: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString: String = baseUrl + imageUrl
        
        guard let url = URL(string: urlString) else { return completion(.failure(CustomError.urlError)) }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { 
                DispatchQueue.main.async {
                    completion(.failure(CustomError.unknownError))
                }
                return
            }
            
            DispatchQueue.main.async {            
                completion(.success(data))
            }
        }
        
        task.resume()
    }
}
