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
        
        guard let url = URL(string: urlString) else { return completion(.failure(URLError(URLError.Code.badURL))) }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(URLError(URLError.Code.cannotDecodeRawData)))
                }
                return
            }
            
            var decodedData: [LoanDataModel] = [LoanDataModel]()
            
            do {
                decodedData = try JSONDecoder().decode([LoanDataModel].self, from: data)
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
        
        guard let url = URL(string: urlString) else { return completion(.failure(URLError(URLError.Code.badURL))) }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { 
                DispatchQueue.main.async {
                    completion(.failure(URLError(URLError.Code.cannotDecodeRawData)))
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
