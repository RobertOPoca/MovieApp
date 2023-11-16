//
//  JsonParser.swift
//  MovieAppTests
//
//  Created by Roberto De la O Pocasangre on 14/11/23.
//

import Foundation

struct JsonParser {
    static func parseJsonFile(name: String) -> Data {
        guard let path = Bundle.main.path(forResource: name, ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        else { return Data() }
        
        return data
    }
}
