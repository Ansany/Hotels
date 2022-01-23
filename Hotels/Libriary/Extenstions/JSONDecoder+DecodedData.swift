//
//  JSONDecoder+DecodedData.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

//MARK: - This extension is needed to understand errors when decoding data.
extension JSONDecoder {
    
    static func getDecodedData<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let obj = try decoder.decode(type.self, from: data)
            return obj
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found: \(context.debugDescription)")
            print("CodingPath: \(context.codingPath)")
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found: \(context.debugDescription)")
            print("CodingPath: \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch: \(context.debugDescription)")
            print("CodingPath: \(context.codingPath)")
        } catch {
            print("Error: \(error)")
        }
        return nil
    }
}
