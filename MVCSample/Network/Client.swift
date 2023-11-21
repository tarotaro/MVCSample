//
//  Client.swift
//  MVCSample
//
//  Created by 中村太郎 on 2023/11/21.
//

import Foundation

final class Client: GenericApi {

 let session: URLSession

 init(configuration: URLSessionConfiguration) {
  self.session = URLSession(configuration: configuration)
 }

 convenience init() {
  self.init(configuration: .default)
 }
}
