//
//  GenericApi.swift
//  MVCSample
//
//  Created by 中村太郎 on 2023/11/21.
//

import Foundation

protocol GenericApi {
 var session: URLSession { get }
 func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T
}

extension GenericApi {
 func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T {
  let (data, response) = try await session.data(for: request)
  guard let httpResponse = response as? HTTPURLResponse else {
   throw ApiError.requestFailed(description: "Invalid response")
  }
  guard httpResponse.statusCode == 200 else {
   throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
  }
  
  do {
   let decoder = JSONDecoder()
   return try decoder.decode(type, from: data)
  } catch {
   throw ApiError.jsonConversionFailure(description: error.localizedDescription)
  }
 }
}
