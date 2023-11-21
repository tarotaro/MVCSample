//
//  BinOrgApi.swift
//  MVCSample
//
//  Created by 中村太郎 on 2023/11/21.
//

import Foundation

final class BinOrgApi {
    static let BASE_URL = "https://httpbin.org/"
    
    private let client = Client()
    var request: URLRequest = {
        let urlString = "\(BASE_URL)/get"
      let url = URL(string: urlString)!
      return URLRequest(url: url)
     }()
    
    func fetchApi() async -> Result<BinOrgModel, ApiError> {
      do {
       let response = try await client.fetch(type: BinOrgModel.self, with: request)
          return .success(response)
      } catch {
          return .failure(error as! ApiError)
      }
     }
}
