//
//  TableAPICall.swift
//  API
//
//  Created by Kornel Krużewski on 18/05/2023.
//

import SwiftUI

class TableAPICall: ObservableObject {
    @Published var table: [Table] = []
    
    // MARK: - Events
    
    func getTable() {
        guard let url = URL(string: "https://amatorkamp.pl/wp-json/sportspress/v2/tables/2800") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedTable = try JSONDecoder().decode([Table].self, from: data)
                        self.table = decodedTable
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}



